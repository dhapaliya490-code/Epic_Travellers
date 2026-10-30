using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epic_Travelers.Pages
{
    public partial class login : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        int i;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if (!(string.IsNullOrEmpty(txtLoginEmail.Text)) && !(string.IsNullOrEmpty(txtLoginPass.Text)))
            {
                getcon();
                cmd = new SqlCommand("select count(*) from user_tbl where Email = '" + txtLoginEmail.Text + "' and Password = '" + txtLoginPass.Text + "'", con);

                i = Convert.ToInt16(cmd.ExecuteScalar());

                if (i > 0)
                {
                    if (txtLoginEmail.Text == "epictravelers365@gmail.com" && txtLoginPass.Text == "admin@123")
                    {
                        Session["admin"] = txtLoginEmail.Text;
                        Session["isAdmin"] = txtLoginEmail.Text;
                        Session["userRole"] = "admin";
                        Session["userName"] = "Administrator";
                        Session["userEmail"] = txtLoginEmail.Text;

                        System.Web.HttpCookie authCookie = new System.Web.HttpCookie("epic_auth");
                        authCookie["role"] = "admin";
                        authCookie["name"] = "Admin";
                        authCookie["email"] = txtLoginEmail.Text;
                        authCookie.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(authCookie);

                        Response.Redirect("~/Pages/admin.aspx");
                    }
                    else
                    {
                        Session["admin"] = txtLoginEmail.Text;
                        Session["userEmail"] = txtLoginEmail.Text;

                        // Retrieve user details from database
                        SqlDataAdapter daUser = new SqlDataAdapter("SELECT Id, [Full Name] FROM user_tbl WHERE Email = '" + txtLoginEmail.Text + "'", con);
                        DataSet dsUser = new DataSet();
                        daUser.Fill(dsUser);

                        string nm = "Traveler";
                        int uid = 0;
                        if (dsUser.Tables[0].Rows.Count > 0)
                        {
                            uid = Convert.ToInt32(dsUser.Tables[0].Rows[0]["Id"]);
                            nm = dsUser.Tables[0].Rows[0]["Full Name"].ToString();
                            Session["userName"] = nm;
                        }

                        // Set authentication cookie for components
                        System.Web.HttpCookie authCookie = new System.Web.HttpCookie("epic_auth");
                        authCookie["role"] = "user";
                        authCookie["email"] = txtLoginEmail.Text;
                        authCookie["name"] = nm;
                        authCookie.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(authCookie);

                        // Check if there was a pending booking submitted before login
                        if (Session["pending_pkg_id"] != null && uid > 0)
                        {
                            int pkgId = Convert.ToInt32(Session["pending_pkg_id"]);
                            int qty = Session["pending_qty"] != null ? Convert.ToInt32(Session["pending_qty"]) : 2;
                            string travelDate = Session["pending_date"] != null ? Session["pending_date"].ToString() : DateTime.Now.AddDays(15).ToString("dd MMM yyyy");
                            string hotel = Session["pending_hotel"] != null ? Session["pending_hotel"].ToString() : "4★ Heritage Deluxe";
                            string bookingCode = "#EPIC-" + new Random().Next(10000, 99999);

                            cmd = new SqlCommand("INSERT INTO Cart_tbl (Cart_User_Id, Cart_Pkg_Id, Quantity, Travel_Date, Hotel_Choice, Status, Booking_Code, Added_Date) VALUES ('"+ uid + "', '"+ pkgId +"', '"+ qty +"', '"+ travelDate +"', '"+ hotel +"', 'Confirmed', '"+ bookingCode +"', GETDATE())", con);
                            cmd.ExecuteNonQuery();

                            Session["pending_pkg_id"] = null;
                            Session["pending_qty"] = null;
                            Session["pending_date"] = null;
                            Session["pending_hotel"] = null;
                        }

                        string returnUrl = Request.QueryString["returnUrl"];
                        if (!string.IsNullOrEmpty(returnUrl))
                        {
                            Response.Redirect(returnUrl);
                        }
                        else
                        {
                            Response.Redirect("~/Pages/dashboard.aspx");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password');</script>");
                }
            }
        }


    }
}
