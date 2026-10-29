using System;
using System.Web.UI;
using System.Web.UI.WebControls;
//New Namespace
using System.Data.SqlClient; //For Connection
using System.Data;           //For Dataset
using System.Configuration;  //For Connection String

namespace Epic_Travelers.Pages
{
    public partial class index : Page
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

        void filldestinations()
        {
            da = new SqlDataAdapter("select top 8 * from Destination_tbl order by Dest_Id asc", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        void fillpackages()
        {
            da = new SqlDataAdapter("select top 6 * from Package_tbl order by Pkg_Id asc", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList2.DataSource = ds;
            DataList2.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

            if (!IsPostBack)
            {
                filldestinations();
                fillpackages();
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

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_book")
            {
                string targetUrl = e.CommandArgument.ToString();
                ViewState["url"] = targetUrl;
                Response.Redirect(ViewState["url"].ToString());
            }
        }
    }
}

