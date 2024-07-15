using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24
{
    public partial class Login : System.Web.UI.Page
    {
        private DatabaseHelper helper = new DatabaseHelper();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string UN = username.Text.Trim();
            string PW = password.Text.Trim();

            if (ValidateUser(UN, PW))
            {
                string fullName = GetUserFullName(UN);
                bool isAdmin = GetIsAdmin(UN);
                HttpCookie userCookie = new HttpCookie("UserInfo");
                userCookie["Username"] = UN;
                userCookie["FullName"] = HttpUtility.UrlEncode(fullName);
                userCookie["IsAdmin"] = isAdmin.ToString();
                userCookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(userCookie);
                Response.Redirect("Admin/Room.aspx");
            }
            else
            {
                lblErrorMessage.Text = "Tên đăng nhập hoặc mật khẩu không đúng.";
            }
        }

        private bool ValidateUser(string username, string password)
        {
            bool isValid = false;
            try
            {
                helper.openConnection();
                string query = "SELECT COUNT(*) FROM dbo.user_tbl WHERE userName = @Username AND password = @Password";
                SqlCommand cmd = helper.CreateCommand(query);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                int count = (int)cmd.ExecuteScalar();
                isValid = count > 0;
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message; 
            }
            finally
            {
                helper.closeConnection();
            }
            return isValid;
        }

        private string GetUserFullName(string username)
        {
            string fullName = string.Empty;
            try
            {
                helper.openConnection();
                string query = "SELECT fullName FROM dbo.user_tbl WHERE userName = @Username";
                SqlCommand cmd = helper.CreateCommand(query);
                cmd.Parameters.AddWithValue("@Username", username);

                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    fullName = result.ToString();
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
            finally
            {
                helper.closeConnection();
            }
            return fullName;
        }

        private bool GetIsAdmin(string username)
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
                lblErrorMessage.Text = ex.Message;
            }
            finally
            {
                helper.closeConnection();
            }
            return isAdmin;
        }
    }
}