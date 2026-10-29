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
<<<<<<< HEAD
        protected void Page_Load(object sender, EventArgs e)
        {
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
                HttpCookie authCookie = Request.Cookies["epic_auth"];
                if (authCookie != null && authCookie["role"] == "user" && !string.IsNullOrEmpty(authCookie["email"]))
                {
                    email = authCookie["email"];
                    Session["admin"] = email;
                }
            }

            // If not logged in, redirect to login
            if (string.IsNullOrEmpty(email))
            {
                Response.Redirect("login.aspx");
            }

            getcon();

            if (!IsPostBack)
            {
                // Fetch user info from user_tbl 
                da = new SqlDataAdapter("select * from user_tbl where Email = '" + email + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    nm = ds.Tables[0].Rows[0]["Full Name"].ToString();
                    string uid = ds.Tables[0].Rows[0]["Id"].ToString();
                    ViewState["uid"] = uid;

                    litUserName.Text     = nm;
                    litUserEmail.Text    = email;
                    litProfileName.Text  = nm;
                    litProfileEmail.Text = email;

                    Session["userRole"]  = "user";
                    Session["userName"]  = nm;
                    Session["userEmail"] = email;

                    CheckAndAddBooking(ViewState["uid"].ToString());

                    fillcartgrid();
                }
            }
        }

        void CheckAndAddBooking(string uid)
        {
            string pkgParam = Request.QueryString["packageId"] ?? Request.QueryString["pid"] ?? Request.QueryString["booked"];
            if (string.IsNullOrEmpty(pkgParam) && Session["pending_pkg_id"] != null)
            {
                pkgParam = Session["pending_pkg_id"].ToString();
                Session["pending_pkg_id"] = null;
            }

            if (!string.IsNullOrEmpty(pkgParam))
            {
                ViewState["pkg_param"] = pkgParam;
                getcon();
                da = new SqlDataAdapter("select Pkg_Id from Package_tbl where Pkg_Slug = '" + ViewState["pkg_param"] + "' or CAST(Pkg_Id as nvarchar) = '" + ViewState["pkg_param"] + "'", con);
                DataSet dsPkg = new DataSet();
                da.Fill(dsPkg);

                if (dsPkg.Tables[0].Rows.Count > 0)
                {
                    int pkgId = Convert.ToInt16(dsPkg.Tables[0].Rows[0]["Pkg_Id"]);
                    ViewState["add_pkg_id"] = pkgId;
                    string bookingCode = "#EPIC-" + new Random().Next(10000, 99999);
                    ViewState["bcode"] = bookingCode;

                    cmd = new SqlCommand("insert into Cart_tbl (Cart_User_Id, Cart_Pkg_Id, Quantity, Travel_Date, Hotel_Choice, Status, Booking_Code, Added_Date) values('" + ViewState["uid"] + "','" + ViewState["add_pkg_id"] + "','2','Upcoming Season • 2025','Heritage Deluxe','Confirmed','" + ViewState["bcode"] + "',GETDATE())", con);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("dashboard.aspx");
                }
            }
        }

        void fillcartgrid()
        {
            getcon();
            int uid = Convert.ToInt16(ViewState["uid"]);
            da = new SqlDataAdapter("select c.Cart_Id, c.Cart_Pkg_Id, p.Pkg_Id, p.Pkg_Title, p.Pkg_Image, p.Pkg_Price, p.Pkg_Duration, p.Pkg_Location, c.Quantity, c.Status, c.Travel_Date, c.Booking_Code, c.Added_Date from Package_tbl p inner join Cart_tbl c on p.Pkg_Id = c.Cart_Pkg_Id where c.Cart_User_Id = '" + ViewState["uid"] + "' order by c.Cart_Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            decimal total = 0;
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                decimal price = Convert.ToDecimal(row["Pkg_Price"]);
                int quantity = Convert.ToInt16(row["Quantity"]);
                total += price * quantity;
            }
            ViewState["total"] = total;
            Label5.Text = "Total Amount is ₹: " + Convert.ToDecimal(ViewState["total"]).ToString("N0");

            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.Visible = true;
                pnlEmptyState.Visible = false;
                pnlTotalBar.Visible = true;
            }
            else
            {
                GridView1.Visible = false;
                pnlEmptyState.Visible = true;
                pnlTotalBar.Visible = false;
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillcartgrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int prid = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
            ViewState["prid"] = prid;
            GridViewRow row = GridView1.Rows[e.RowIndex];

            DropDownList drpqty = (DropDownList)row.FindControl("DropDownList1");
            int qty = int.Parse(drpqty.SelectedValue);
            ViewState["qty"] = qty;

            getcon();
            cmd = new SqlCommand("update Cart_tbl set Quantity='" + ViewState["qty"] + "' where Cart_Pkg_Id='" + ViewState["prid"] + "' and Cart_User_Id = '" + ViewState["uid"] + "'", con);
            cmd.ExecuteNonQuery();

            GridView1.EditIndex = -1;
            fillcartgrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillcartgrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_rmv")
            {
                int cid = Convert.ToInt16(e.CommandArgument);
                ViewState["cid"] = cid;

                getcon();
                cmd = new SqlCommand("delete from Cart_tbl where Cart_Pkg_Id = '" + ViewState["cid"] + "' and Cart_User_Id = '" + ViewState["uid"] + "'", con);
                cmd.ExecuteNonQuery();
                fillcartgrid();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("logout.aspx");
        }
=======
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        
>>>>>>> bc01852f792b4fec4396af373a1677e8ee63016a
    }
}
