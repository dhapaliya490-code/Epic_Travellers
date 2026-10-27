using System;
using System.Web.UI;
using System.Web.UI.WebControls;
//New Namespace
using System.Data.SqlClient; //For Connection
using System.Data;           //For Dataset
using System.Configuration;  //For Connection String

namespace Epic_Travelers.Pages
{
    public partial class package_details : Page
    {
        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;//For Connection String 

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

    }
}