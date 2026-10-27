using System;
using System.Web.UI;
using System.Web.UI.WebControls;
//New Namespace
using System.Data.SqlClient; //For Connection
using System.Data;           //For Dataset
using System.Configuration;  //For Connection String

namespace Epic_Travelers.Pages
{
    public partial class packages : Page
    {
        SqlConnection con;//For Connection
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;//For Connection String 
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void filldatalist()
        {
            da = new SqlDataAdapter("select * from Package_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

            if (!IsPostBack)
            {
                filldatalist();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_details")
            {
                string targetUrl = e.CommandArgument.ToString();
                ViewState["pid_url"] = targetUrl;
                Response.Redirect(ViewState["pid_url"].ToString());
            }
        }
    }
}
