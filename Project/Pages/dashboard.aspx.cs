using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epic_Travelers.Pages
{
    public partial class dashboard : Page
    {
        SqlConnection con;  // For Connection
        SqlCommand cmd;     // For insert, update, delete
        SqlDataAdapter da;  // For Container
        DataSet ds;         // For Select
        string nm;          // For Name

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString; // For Connection String

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
