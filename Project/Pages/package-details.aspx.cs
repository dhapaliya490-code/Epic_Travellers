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
<<<<<<< HEAD

        void fillproduct()
        {
            da = new SqlDataAdapter("select * from Package_tbl where Pkg_Slug = '" + ViewState["pid"] + "' or CAST(Pkg_Id as nvarchar) = '" + ViewState["pid"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            // Fallback to top package if not found
            if (ds.Tables[0].Rows.Count == 0)
            {
                da = new SqlDataAdapter("select top 1 * from Package_tbl", con);
                ds = new DataSet();
                da.Fill(ds);
            }

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

            if (!IsPostBack)
            {
                string id = Request.QueryString["id"] ?? Request.QueryString["pid"] ?? "1";
                ViewState["pid"] = id;

                fillproduct();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_book")
            {
                int pid = Convert.ToInt16(e.CommandArgument);
                ViewState["pid"] = pid;

                string email = null;
                if (Session["admin"] != null)
                {
                    email = Session["admin"].ToString();
                }
                else if (Session["userEmail"] != null)
                {
                    email = Session["userEmail"].ToString();
                }
                else
                {
                    var authCookie = Request.Cookies["epic_auth"];
                    if (authCookie != null && authCookie["role"] == "user" && !string.IsNullOrEmpty(authCookie["email"]))
                    {
                        email = authCookie["email"];
                        Session["admin"] = email;
                    }
                }

                // If not logged in, remember chosen package and redirect to login
                if (string.IsNullOrEmpty(email))
                {
                    Session["pending_pkg_id"] = ViewState["pid"].ToString();
                    Response.Redirect("login.aspx");
                    return;
                }

                getcon();

                // Lookup user Id by email 
                da = new SqlDataAdapter("select * from user_tbl where Email = '" + email + "'", con);
                DataSet dsUser = new DataSet();
                da.Fill(dsUser);

                if (dsUser.Tables[0].Rows.Count > 0)
                {
                    string uid = dsUser.Tables[0].Rows[0]["Id"].ToString();
                    ViewState["uid"] = uid;

                    int qty = 2;
                    DropDownList ddlAdults = (DropDownList)e.Item.FindControl("bookAdults");
                    if (ddlAdults != null && int.TryParse(ddlAdults.SelectedValue, out int parsedQty))
                    {
                        qty = parsedQty;
                    }
                    ViewState["qty"] = qty;

                    string travelDate = "Upcoming Season • 2025";
                    TextBox txtDate = (TextBox)e.Item.FindControl("bookDate");
                    if (txtDate != null && !string.IsNullOrEmpty(txtDate.Text))
                    {
                        travelDate = txtDate.Text;
                    }
                    ViewState["tdate"] = travelDate;

                    string hotelChoice = "Heritage Deluxe";
                    DropDownList ddlHotel = (DropDownList)e.Item.FindControl("bookHotel");
                    if (ddlHotel != null && ddlHotel.SelectedItem != null)
                    {
                        hotelChoice = ddlHotel.SelectedItem.Text;
                    }
                    ViewState["hotel"] = hotelChoice;

                    string bookingCode = "#EPIC-" + new Random().Next(10000, 99999);
                    ViewState["bcode"] = bookingCode;

                    cmd = new SqlCommand("insert into Cart_tbl (Cart_User_Id, Cart_Pkg_Id, Quantity, Travel_Date, Hotel_Choice, Status, Booking_Code, Added_Date) values('" + ViewState["uid"] + "','" + ViewState["pid"] + "','" + ViewState["qty"] + "','" + ViewState["tdate"] + "','" + ViewState["hotel"] + "','Confirmed','" + ViewState["bcode"] + "',GETDATE())", con);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    Response.Redirect("dashboard.aspx?packageId=" + ViewState["pid"]);
                }
            }
=======
        

        protected void Page_Load(object sender, EventArgs e)
        {
           
>>>>>>> bc01852f792b4fec4396af373a1677e8ee63016a
        }

    }
}