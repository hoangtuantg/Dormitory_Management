using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        private DatabaseHelper helper = new DatabaseHelper();
        public bool IsAdmin { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserInfo"] == null)
            {
                Response.Redirect("~/LoginPage.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.Cookies["UserInfo"] != null)
                {
                    string username = Request.Cookies["UserInfo"]["Username"];
                    IsAdmin = CheckIsAdmin(username);
                }
            }
        }

        private bool CheckIsAdmin(string username)
        {
            bool isAdmin = false;
            try
            {
                helper.openConnection();
                string query = "SELECT isAdmin FROM dbo.user_tbl WHERE userName = @Username";
                System.Data.SqlClient.SqlCommand cmd = helper.CreateCommand(query);
                cmd.Parameters.AddWithValue("@Username", username);
                object result = cmd.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    isAdmin = Convert.ToBoolean(result);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                helper.closeConnection();
            }
            return isAdmin;
        }


    }
}