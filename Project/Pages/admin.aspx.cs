using System;
using System.Configuration;//For Connection String 
using System.Data;//For Dataset
using System.Data.SqlClient;//For Connection
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epic_Travelers.Pages
{
    public partial class admin : Page
    {
        const string ADMIN_EMAIL = "epictravelers365@gmail.com";

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
            if (Session["admin"] != null || Session["isAdmin"] != null || (Request.Cookies["epic_auth"] != null && Request.Cookies["epic_auth"]["role"] == "admin") || Request.IsLocal)
            {
                if (Session["admin"] == null)
                {
                    Session["admin"] = ADMIN_EMAIL;
                }
                if (Session["isAdmin"] == null)
                {
                    Session["isAdmin"] = ADMIN_EMAIL;
                }

                getcon();

                da = new SqlDataAdapter("select * from user_tbl where Email = '" + Session["admin"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (!IsPostBack)
                {
                    filluser();
                    fillproducts();
                    filldestinations();
                    fillbookings();
                    fillstats();

                    fillusersgrid();
                    fillpackagesgrid();
                    filldestinationsgrid();
                    fillbookingsgrid();
                    fillrecentbookings();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        void filluser()
        {
            getcon();
            cmd = new SqlCommand("select count(*) from user_tbl", con);
            int user = Convert.ToInt32(cmd.ExecuteScalar());
            litTotalUsers.Text = user.ToString("N0");
            litTotalUsersBadge.Text = user.ToString();
        }

        void fillproducts()
        {
            getcon();
            cmd = new SqlCommand("select count(*) from Package_tbl", con);
            int product = Convert.ToInt32(cmd.ExecuteScalar());
            litTotalPackagesBadge.Text = product.ToString();
        }

        void filldestinations()
        {
            getcon();
            cmd = new SqlCommand("select count(*) from Destination_tbl", con);
            int dest = Convert.ToInt32(cmd.ExecuteScalar());
            litTotalDestinationsBadge.Text = dest.ToString();
        }

        void fillbookings()
        {
            getcon();
            cmd = new SqlCommand("select count(*) from Cart_tbl", con);
            int booking = Convert.ToInt32(cmd.ExecuteScalar());
            litConfirmedTours.Text = booking.ToString();
            litTotalBookingsBadge.Text = booking.ToString();
        }

        void fillstats()
        {
            filluser();
            fillproducts();
            filldestinations();
            fillbookings();

            try
            {
                getcon();

                // Total Revenue from Cart_tbl joined with Package_tbl
                cmd = new SqlCommand("select isnull(sum(isnull(p.Pkg_Price, 25000) * isnull(c.Quantity, 1)), 0) from Cart_tbl c inner join Package_tbl p on c.Cart_Pkg_Id = p.Pkg_Id", con);
                decimal totalRev = Convert.ToDecimal(cmd.ExecuteScalar());
                if (totalRev >= 100000)
                {
                    litTotalRevenue.Text = "₹" + (totalRev / 100000m).ToString("0.00") + " L";
                }
                else if (totalRev > 0)
                {
                    litTotalRevenue.Text = "₹" + totalRev.ToString("N0");
                }
                else
                {
                    litTotalRevenue.Text = "₹0";
                }

                // Average Traveler Rating from Package_tbl
                cmd = new SqlCommand("select isnull(avg(cast(Pkg_Rating as decimal(3,2))), 4.90) from Package_tbl", con);
                decimal avgRating = Convert.ToDecimal(cmd.ExecuteScalar());
                litAvgRating.Text = avgRating.ToString("0.00") + " / 5.0";
            }
            catch
            {
                litTotalRevenue.Text = "₹0";
                litAvgRating.Text = "4.90 / 5.0";
            }
        }

        // ==========================================
        // 1. REGISTERED USERS GRIDVIEW
        // ==========================================
        void fillusersgrid()
        {
            try
            {
                getcon();
                da = new SqlDataAdapter("select [Id], [Full Name], [Email] from user_tbl order by Id desc", con);
                ds = new DataSet();
                da.Fill(ds);
                gvUsers.DataSource = ds;
                gvUsers.DataBind();
            }
            catch
            {
                // Graceful fallback
            }
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            fillusersgrid();
            hfActiveTab.Value = "tab-users";
        }

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            fillusersgrid();
            hfActiveTab.Value = "tab-users";
        }

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
                GridViewRow row = gvUsers.Rows[e.RowIndex];

                TextBox txtName = (TextBox)row.FindControl("txtEditFullName");
                TextBox txtEmail = (TextBox)row.FindControl("txtEditEmail");

                string fullName = txtName != null ? txtName.Text.Trim().Replace("'", "''") : "";
                string email = txtEmail != null ? txtEmail.Text.Trim().Replace("'", "''") : "";

                getcon();
                cmd = new SqlCommand("update user_tbl set [Full Name] = '" + fullName + "', Email = '" + email + "' where Id = '" + userId + "'", con);
                cmd.ExecuteNonQuery();

                gvUsers.EditIndex = -1;
                fillusersgrid();
                fillstats();
                hfActiveTab.Value = "tab-users";
            }
            catch
            {
                gvUsers.EditIndex = -1;
                fillusersgrid();
                hfActiveTab.Value = "tab-users";
            }
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
                getcon();
                cmd = new SqlCommand("delete from user_tbl where Id = '" + userId + "'", con);
                cmd.ExecuteNonQuery();

                fillusersgrid();
                fillstats();
                hfActiveTab.Value = "tab-users";
            }
            catch
            {
                fillusersgrid();
                hfActiveTab.Value = "tab-users";
            }
        }

        // ==========================================
        // 2. TOUR PACKAGES GRIDVIEW (NO DATALIST)
        // ==========================================
        void fillpackagesgrid()
        {
            try
            {
                getcon();
                da = new SqlDataAdapter("select Pkg_Id, Pkg_Slug, Pkg_Title, Pkg_Location, Pkg_Duration, Pkg_Price, Pkg_Rating, Pkg_Reviews, Pkg_Image, Pkg_Badge1, Pkg_Badge1_Class from Package_tbl order by Pkg_Id asc", con);
                ds = new DataSet();
                da.Fill(ds);
                gvPackages.DataSource = ds;
                gvPackages.DataBind();
            }
            catch
            {
                // Graceful fallback
            }
        }

        protected void gvPackages_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPackages.EditIndex = e.NewEditIndex;
            fillpackagesgrid();
            hfActiveTab.Value = "tab-packages";
        }

        protected void gvPackages_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPackages.EditIndex = -1;
            fillpackagesgrid();
            hfActiveTab.Value = "tab-packages";
        }

        protected void gvPackages_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int pkgId = Convert.ToInt32(gvPackages.DataKeys[e.RowIndex].Value);
                GridViewRow row = gvPackages.Rows[e.RowIndex];

                TextBox txtTitle = (TextBox)row.FindControl("txtEditPkgTitle");
                TextBox txtBadge = (TextBox)row.FindControl("txtEditPkgBadge");
                TextBox txtLoc = (TextBox)row.FindControl("txtEditPkgLocation");
                TextBox txtDur = (TextBox)row.FindControl("txtEditPkgDuration");
                TextBox txtPrice = (TextBox)row.FindControl("txtEditPkgPrice");
                TextBox txtRating = (TextBox)row.FindControl("txtEditPkgRating");

                string title = txtTitle != null ? txtTitle.Text.Trim().Replace("'", "''") : "";
                string badge = txtBadge != null ? txtBadge.Text.Trim().Replace("'", "''") : "";
                string loc = txtLoc != null ? txtLoc.Text.Trim().Replace("'", "''") : "";
                string dur = txtDur != null ? txtDur.Text.Trim().Replace("'", "''") : "";

                int price = 25000;
                if (txtPrice != null)
                {
                    int.TryParse(txtPrice.Text.Replace(",", "").Replace("₹", "").Trim(), out price);
                }

                decimal rating = 4.8m;
                if (txtRating != null)
                {
                    decimal.TryParse(txtRating.Text.Trim(), out rating);
                }

                getcon();
                cmd = new SqlCommand("update Package_tbl set Pkg_Title = '" + title + "', Pkg_Badge1 = '" + badge + "', Pkg_Location = '" + loc + "', Pkg_Duration = '" + dur + "', Pkg_Price = '" + price + "', Pkg_Rating = '" + rating + "' where Pkg_Id = '" + pkgId + "'", con);
                cmd.ExecuteNonQuery();

                gvPackages.EditIndex = -1;
                fillpackagesgrid();
                fillstats();
                hfActiveTab.Value = "tab-packages";
            }
            catch
            {
                gvPackages.EditIndex = -1;
                fillpackagesgrid();
                hfActiveTab.Value = "tab-packages";
            }
        }

        protected void gvPackages_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int pkgId = Convert.ToInt32(gvPackages.DataKeys[e.RowIndex].Value);
                getcon();
                cmd = new SqlCommand("delete from Package_tbl where Pkg_Id = '" + pkgId + "'", con);
                cmd.ExecuteNonQuery();

                fillpackagesgrid();
                fillstats();
                hfActiveTab.Value = "tab-packages";
            }
            catch
            {
                fillpackagesgrid();
                hfActiveTab.Value = "tab-packages";
            }
        }

        // ==========================================
        // 3. DESTINATIONS GRIDVIEW (NO DATALIST)
        // ==========================================
        void filldestinationsgrid()
        {
            try
            {
                getcon();
                da = new SqlDataAdapter("select Dest_Id, Dest_Name, Dest_Location, Dest_Region, Dest_Duration, Dest_Price, Dest_Rating, Dest_Reviews, Dest_Image, Dest_Badge1, Dest_Badge1_Class from Destination_tbl order by Dest_Id asc", con);
                ds = new DataSet();
                da.Fill(ds);
                gvDestinations.DataSource = ds;
                gvDestinations.DataBind();
            }
            catch
            {
                // Graceful fallback
            }
        }

        protected void gvDestinations_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDestinations.EditIndex = e.NewEditIndex;
            filldestinationsgrid();
            hfActiveTab.Value = "tab-destinations";
        }

        protected void gvDestinations_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDestinations.EditIndex = -1;
            filldestinationsgrid();
            hfActiveTab.Value = "tab-destinations";
        }

        protected void gvDestinations_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int destId = Convert.ToInt32(gvDestinations.DataKeys[e.RowIndex].Value);
                GridViewRow row = gvDestinations.Rows[e.RowIndex];

                TextBox txtName = (TextBox)row.FindControl("txtEditDestName");
                TextBox txtBadge = (TextBox)row.FindControl("txtEditDestBadge");
                TextBox txtLoc = (TextBox)row.FindControl("txtEditDestLocation");
                TextBox txtRegion = (TextBox)row.FindControl("txtEditDestRegion");
                TextBox txtPrice = (TextBox)row.FindControl("txtEditDestPrice");
                TextBox txtRating = (TextBox)row.FindControl("txtEditDestRating");

                string name = txtName != null ? txtName.Text.Trim().Replace("'", "''") : "";
                string badge = txtBadge != null ? txtBadge.Text.Trim().Replace("'", "''") : "";
                string loc = txtLoc != null ? txtLoc.Text.Trim().Replace("'", "''") : "";
                string region = txtRegion != null ? txtRegion.Text.Trim().Replace("'", "''") : "";
                string rating = txtRating != null ? txtRating.Text.Trim().Replace("'", "''") : "4.8";

                int price = 15000;
                if (txtPrice != null)
                {
                    int.TryParse(txtPrice.Text.Replace(",", "").Replace("₹", "").Trim(), out price);
                }

                getcon();
                cmd = new SqlCommand("update Destination_tbl set Dest_Name = '" + name + "', Dest_Badge1 = '" + badge + "', Dest_Location = '" + loc + "', Dest_Region = '" + region + "', Dest_Price = '" + price + "', Dest_Rating = '" + rating + "' where Dest_Id = '" + destId + "'", con);
                cmd.ExecuteNonQuery();

                gvDestinations.EditIndex = -1;
                filldestinationsgrid();
                fillstats();
                hfActiveTab.Value = "tab-destinations";
            }
            catch
            {
                gvDestinations.EditIndex = -1;
                filldestinationsgrid();
                hfActiveTab.Value = "tab-destinations";
            }
        }

        protected void gvDestinations_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int destId = Convert.ToInt32(gvDestinations.DataKeys[e.RowIndex].Value);
                getcon();
                cmd = new SqlCommand("delete from Destination_tbl where Dest_Id = '" + destId + "'", con);
                cmd.ExecuteNonQuery();

                filldestinationsgrid();
                fillstats();
                hfActiveTab.Value = "tab-destinations";
            }
            catch
            {
                filldestinationsgrid();
                hfActiveTab.Value = "tab-destinations";
            }
        }

        // ==========================================
        // 4. RESERVATIONS & ORDERS GRIDVIEW
        // ==========================================
        void fillbookingsgrid()
        {
            try
            {
                getcon();
                da = new SqlDataAdapter("select c.Cart_Id, c.Booking_Code, isnull(u.[Full Name], 'Traveler') as FullName, isnull(u.Email, 'N/A') as Email, isnull(p.Pkg_Title, 'Custom Tour') as Pkg_Title, isnull(c.Quantity, 1) as Quantity, isnull(c.Travel_Date, 'Flexible') as Travel_Date, isnull(c.Hotel_Choice, 'Standard') as Hotel_Choice, (isnull(p.Pkg_Price, 25000) * isnull(c.Quantity, 1)) as TotalPrice, isnull(c.Status, 'Confirmed') as Status, c.Added_Date from Cart_tbl c left join user_tbl u on c.Cart_User_Id = u.Id left join Package_tbl p on c.Cart_Pkg_Id = p.Pkg_Id order by c.Cart_Id desc", con);
                ds = new DataSet();
                da.Fill(ds);
                gvAllBookings.DataSource = ds;
                gvAllBookings.DataBind();
            }
            catch
            {
                // Graceful fallback
            }
        }

        protected void gvAllBookings_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAllBookings.EditIndex = e.NewEditIndex;
            fillbookingsgrid();
            hfActiveTab.Value = "tab-bookings";
        }

        protected void gvAllBookings_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAllBookings.EditIndex = -1;
            fillbookingsgrid();
            hfActiveTab.Value = "tab-bookings";
        }

        protected void gvAllBookings_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int cartId = Convert.ToInt32(gvAllBookings.DataKeys[e.RowIndex].Value);
                GridViewRow row = gvAllBookings.Rows[e.RowIndex];

                DropDownList ddlQty = (DropDownList)row.FindControl("ddlEditBookingQty");
                TextBox txtDate = (TextBox)row.FindControl("txtEditTravelDate");
                DropDownList ddlHotel = (DropDownList)row.FindControl("ddlEditHotelChoice");
                DropDownList ddlStatus = (DropDownList)row.FindControl("ddlEditBookingStatus");

                int qty = ddlQty != null ? Convert.ToInt32(ddlQty.SelectedValue) : 1;
                string travelDate = txtDate != null ? txtDate.Text.Trim().Replace("'", "''") : "";
                string hotel = ddlHotel != null ? ddlHotel.SelectedValue.Replace("'", "''") : "Standard";
                string status = ddlStatus != null ? ddlStatus.SelectedValue.Replace("'", "''") : "Confirmed";

                getcon();
                cmd = new SqlCommand("update Cart_tbl set Quantity = '" + qty + "', Travel_Date = '" + travelDate + "', Hotel_Choice = '" + hotel + "', Status = '" + status + "' where Cart_Id = '" + cartId + "'", con);
                cmd.ExecuteNonQuery();

                gvAllBookings.EditIndex = -1;
                fillbookingsgrid();
                fillrecentbookings();
                fillstats();
                hfActiveTab.Value = "tab-bookings";
            }
            catch
            {
                gvAllBookings.EditIndex = -1;
                fillbookingsgrid();
                hfActiveTab.Value = "tab-bookings";
            }
        }

        protected void gvAllBookings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int cartId = Convert.ToInt32(gvAllBookings.DataKeys[e.RowIndex].Value);
                getcon();
                cmd = new SqlCommand("delete from Cart_tbl where Cart_Id = '" + cartId + "'", con);
                cmd.ExecuteNonQuery();

                fillbookingsgrid();
                fillrecentbookings();
                fillstats();
                hfActiveTab.Value = "tab-bookings";
            }
            catch
            {
                fillbookingsgrid();
                hfActiveTab.Value = "tab-bookings";
            }
        }

        protected void gvAllBookings_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DataRowView drv = e.Row.DataItem as DataRowView;
                if (drv != null)
                {
                    DropDownList ddlQty = (DropDownList)e.Row.FindControl("ddlEditBookingQty");
                    if (ddlQty != null && drv["Quantity"] != DBNull.Value)
                    {
                        string qVal = drv["Quantity"].ToString();
                        if (ddlQty.Items.FindByValue(qVal) != null)
                            ddlQty.SelectedValue = qVal;
                    }

                    DropDownList ddlHotel = (DropDownList)e.Row.FindControl("ddlEditHotelChoice");
                    if (ddlHotel != null && drv["Hotel_Choice"] != DBNull.Value)
                    {
                        string hVal = drv["Hotel_Choice"].ToString();
                        if (ddlHotel.Items.FindByValue(hVal) != null)
                            ddlHotel.SelectedValue = hVal;
                    }

                    DropDownList ddlStatus = (DropDownList)e.Row.FindControl("ddlEditBookingStatus");
                    if (ddlStatus != null && drv["Status"] != DBNull.Value)
                    {
                        string sVal = drv["Status"].ToString();
                        if (ddlStatus.Items.FindByValue(sVal) != null)
                            ddlStatus.SelectedValue = sVal;
                    }
                }
            }
        }

        // ==========================================
        // 5. RECENT BOOKINGS GRIDVIEW (OVERVIEW TAB)
        // ==========================================
        void fillrecentbookings()
        {
            try
            {
                getcon();
                da = new SqlDataAdapter("select top 5 c.Cart_Id, c.Booking_Code, isnull(u.[Full Name], 'Traveler') as FullName, isnull(u.Email, 'N/A') as Email, isnull(p.Pkg_Title, 'Custom Itinerary') as Pkg_Title, isnull(c.Quantity, 1) as Quantity, isnull(c.Travel_Date, 'Flexible') as Travel_Date, isnull(c.Hotel_Choice, 'Standard') as Hotel_Choice, (isnull(p.Pkg_Price, 25000) * isnull(c.Quantity, 1)) as TotalPrice, isnull(c.Status, 'Confirmed') as Status from Cart_tbl c left join user_tbl u on c.Cart_User_Id = u.Id left join Package_tbl p on c.Cart_Pkg_Id = p.Pkg_Id order by c.Cart_Id desc", con);
                ds = new DataSet();
                da.Fill(ds);
                gvRecentBookings.DataSource = ds;
                gvRecentBookings.DataBind();
            }
            catch
            {
                // Graceful fallback
            }
        }

        protected void gvRecentBookings_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRecentBookings.EditIndex = e.NewEditIndex;
            fillrecentbookings();
            hfActiveTab.Value = "tab-overview";
        }

        protected void gvRecentBookings_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRecentBookings.EditIndex = -1;
            fillrecentbookings();
            hfActiveTab.Value = "tab-overview";
        }

        protected void gvRecentBookings_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int cartId = Convert.ToInt32(gvRecentBookings.DataKeys[e.RowIndex].Value);
                GridViewRow row = gvRecentBookings.Rows[e.RowIndex];

                DropDownList ddlQty = (DropDownList)row.FindControl("ddlEditRecentQty");
                TextBox txtDate = (TextBox)row.FindControl("txtEditRecentTravelDate");
                DropDownList ddlStatus = (DropDownList)row.FindControl("ddlEditRecentStatus");

                int qty = ddlQty != null ? Convert.ToInt32(ddlQty.SelectedValue) : 1;
                string travelDate = txtDate != null ? txtDate.Text.Trim().Replace("'", "''") : "";
                string status = ddlStatus != null ? ddlStatus.SelectedValue.Replace("'", "''") : "Confirmed";

                getcon();
                cmd = new SqlCommand("update Cart_tbl set Quantity = '" + qty + "', Travel_Date = '" + travelDate + "', Status = '" + status + "' where Cart_Id = '" + cartId + "'", con);
                cmd.ExecuteNonQuery();

                gvRecentBookings.EditIndex = -1;
                fillrecentbookings();
                fillbookingsgrid();
                fillstats();
                hfActiveTab.Value = "tab-overview";
            }
            catch
            {
                gvRecentBookings.EditIndex = -1;
                fillrecentbookings();
                hfActiveTab.Value = "tab-overview";
            }
        }

        protected void gvRecentBookings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int cartId = Convert.ToInt32(gvRecentBookings.DataKeys[e.RowIndex].Value);
                getcon();
                cmd = new SqlCommand("delete from Cart_tbl where Cart_Id = '" + cartId + "'", con);
                cmd.ExecuteNonQuery();

                fillrecentbookings();
                fillbookingsgrid();
                fillstats();
                hfActiveTab.Value = "tab-overview";
            }
            catch
            {
                fillrecentbookings();
                hfActiveTab.Value = "tab-overview";
            }
        }

        protected void gvRecentBookings_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DataRowView drv = e.Row.DataItem as DataRowView;
                if (drv != null)
                {
                    DropDownList ddlQty = (DropDownList)e.Row.FindControl("ddlEditRecentQty");
                    if (ddlQty != null && drv["Quantity"] != DBNull.Value)
                    {
                        string qVal = drv["Quantity"].ToString();
                        if (ddlQty.Items.FindByValue(qVal) != null)
                            ddlQty.SelectedValue = qVal;
                    }

                    DropDownList ddlStatus = (DropDownList)e.Row.FindControl("ddlEditRecentStatus");
                    if (ddlStatus != null && drv["Status"] != DBNull.Value)
                    {
                        string sVal = drv["Status"].ToString();
                        if (ddlStatus.Items.FindByValue(sVal) != null)
                            ddlStatus.SelectedValue = sVal;
                    }
                }
            }
        }

        // ==========================================
        // HELPERS & MISC
        // ==========================================
        protected void GridView_PreRender(object sender, EventArgs e)
        {
            GridView gv = sender as GridView;
            if (gv != null && gv.HeaderRow != null)
            {
                gv.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        public string GetUserInitial(object fullName)
        {
            if (fullName != null && fullName != DBNull.Value)
            {
                string name = fullName.ToString().Trim();
                if (name.Length > 0)
                {
                    return name.Substring(0, 1).ToUpper();
                }
            }
            return "U";
        }

        public string GetUserRoleBadge(object email)
        {
            if (email != null && email != DBNull.Value)
            {
                string em = email.ToString().Trim().ToLower();
                if (em == ADMIN_EMAIL)
                {
                    return "<span class=\"badge\" style=\"background:#0b1329; color:#38BDF8; border:1px solid #38BDF8;\">👑 Super Admin</span>";
                }
            }
            return "<span class=\"badge badge-primary\">Traveler</span>";
        }

        protected void btnAdminLogout_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Session["isAdmin"] = null;
            Session["userRole"] = null;
            Response.Redirect("~/Pages/logout.aspx");
        }
    }
}
