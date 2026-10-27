using System;
using System.Web.UI;
using System.Web.UI.WebControls;
//New Namespace
using System.Data.SqlClient; //For Connection
using System.Data;           //For Dataset
using System.Configuration;  //For Connection String

namespace Epic_Travelers.Pages
{
    public partial class gallery : Page
    {
        SqlConnection con;//For Connection
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select

        public string GalleryJson = "[]";

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;//For Connection String 
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void filldatalist()
        {
            da = new SqlDataAdapter("select * from Gallery_tbl order by Gallery_Order asc, Gallery_Id asc", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("[");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataRow r = ds.Tables[0].Rows[i];
                if (i > 0) sb.Append(",");
                sb.Append("{");
                sb.AppendFormat("\"src\":\"{0}\",", r["Gallery_Image"]);
                sb.AppendFormat("\"title\":\"{0}\",", r["Gallery_Title"].ToString().Replace("\"", "\\\""));
                sb.AppendFormat("\"location\":\"{0}\",", r["Gallery_Location"].ToString().Replace("\"", "\\\""));
                sb.AppendFormat("\"badge\":\"{0}\",", r["Gallery_Badge"].ToString().Replace("\"", "\\\""));
                sb.AppendFormat("\"badgeClass\":\"{0}\",", r["Gallery_BadgeClass"]);
                sb.AppendFormat("\"category\":\"{0}\",", r["Gallery_Category"]);
                sb.AppendFormat("\"ctaLink\":\"{0}\"", r["Gallery_CtaLink"]);
                sb.Append("}");
            }
            sb.Append("]");
            GalleryJson = sb.ToString();
            ViewState["gallery_json"] = GalleryJson;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

            if (!IsPostBack)
            {
                filldatalist();
            }
            else
            {
                if (ViewState["gallery_json"] != null)
                {
                    GalleryJson = ViewState["gallery_json"].ToString();
                }
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_details")
            {
                string targetUrl = e.CommandArgument.ToString();
                ViewState["url"] = targetUrl;
                Response.Redirect(ViewState["url"].ToString());
            }
        }
    }
}
