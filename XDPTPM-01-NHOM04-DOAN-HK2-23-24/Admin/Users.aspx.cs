using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        private DatabaseHelper helper = new DatabaseHelper();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Kiểm tra cookie có tồn tại không
                if (Request.Cookies["UserInfo"] != null)
                {
                    HttpCookie userCookie = Request.Cookies["UserInfo"];
                    string username = userCookie["Username"];
                    string fullName = HttpUtility.UrlDecode(userCookie["FullName"]);

                    fullname.Value = fullName;
                    Uname.Text = username;
                }
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            string oldPassword = oldPass.Text;
            string newPassword = newPass.Text;
            string username = Uname.Text;

            if (string.IsNullOrEmpty(oldPassword) || string.IsNullOrEmpty(newPassword))
            {
                ErrMsg.Text = "Vui lòng nhập đầy đủ mật khẩu cũ và mới.";
                return;
            }

            if (ValidateOldPassword(username, oldPassword))
            {
                if (UpdatePassword(username, newPassword))
                {
                    ErrMsg.Text = "Mật khẩu đã được cập nhật thành công.";
                    ClearPasswordFields();
                }
                else
                {
                    ErrMsg.Text = "Có lỗi xảy ra khi cập nhật mật khẩu.";
                }
            }
            else
            {
                ErrMsg.Text = "Mật khẩu cũ không chính xác.";
            }
        }

        private bool ValidateOldPassword(string username, string oldPassword)
        {
            string query = "SELECT password FROM dbo.user_tbl WHERE userName = @Username AND password = @Password";
            try
            {
                helper.openConnection();
                using (SqlCommand cmd = helper.CreateCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", oldPassword);
                    object result = cmd.ExecuteScalar();
                    return result != null;
                }
            }
            finally
            {
                helper.closeConnection();
            }
        }

        private bool UpdatePassword(string username, string newPassword)
        {
            string query = "UPDATE dbo.user_tbl SET password = @Password WHERE userName = @Username";
            try
            {
                helper.openConnection();
                using (SqlCommand cmd = helper.CreateCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Password", newPassword);
                    cmd.Parameters.AddWithValue("@Username", username);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
            finally
            {
                helper.closeConnection();
            }
        }

        private void ClearPasswordFields()
        {
            oldPass.Text = string.Empty;
            newPass.Text = string.Empty;
        }
    }
}