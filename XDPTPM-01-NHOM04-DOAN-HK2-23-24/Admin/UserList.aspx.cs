using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers;
using System.Xml.Linq;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin
{
    public partial class UserList : System.Web.UI.Page
    {
        private DatabaseHelper helper = new DatabaseHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowUsers();
            }
        }

        private void ShowUsers()
        {
            helper.openConnection();
            DataSet dataSet = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(helper.CreateCommand(@"
                SELECT 
                    userId, 
                    fullName, 
                    gender, 
                    dateOfBirth, 
                    userName, 
                    password, 
                    CASE 
                        WHEN LOWER(TRIM(isadmin)) = 'true' THEN 'Admin' 
                        ELSE 'User' 
                    END AS UserRole
                FROM user_tbl
            "));
            adapter.Fill(dataSet);
            UsersList.DataSource = dataSet;
            UsersList.DataBind();
            helper.closeConnection();
        }

        protected void SearchUserBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string searchText = txtSearchUser.Value.Trim();
                if (!string.IsNullOrEmpty(searchText))
                {
                    string query = "SELECT * FROM user_tbl WHERE fullName LIKE N'%" + searchText + "%'";


                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@searchText", "%" + searchText + "%");
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataSet dataSet = new DataSet();
                            adapter.Fill(dataSet);
                            UsersList.DataSource = dataSet;
                            UsersList.DataBind();
                        }
                    }
                    helper.closeConnection();
                }
                else
                {
                    ShowUsers();
                }
            }
            catch (Exception ex)
            {
                ErrMsg.Text = ex.Message;
            }
        }

        int Key = 0;
        protected void UsersList_SelectedIndexChanged1(object sender, EventArgs e)
        {
            FName.Value = HttpUtility.HtmlDecode(UsersList.SelectedRow.Cells[2].Text);
            DateTime dob;
            string dateText = HttpUtility.HtmlDecode(UsersList.SelectedRow.Cells[4].Text);
            if (DateTime.TryParseExact(dateText, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out dob))
            {
                UDOB.Text = dob.ToString("yyyy-MM-dd");
            }
            else
            {
                UDOB.Text = string.Empty;
            }
            gender.SelectedItem.Value = HttpUtility.HtmlDecode(UsersList.SelectedRow.Cells[3].Text);
            UName.Value = HttpUtility.HtmlDecode(UsersList.SelectedRow.Cells[5].Text);
            Pass.Value = HttpUtility.HtmlDecode(UsersList.SelectedRow.Cells[6].Text);
            admin.SelectedItem.Value = HttpUtility.HtmlDecode(UsersList.SelectedRow.Cells[7].Text);
            if (FName.Value == "")
            {
                Key = 0;
            }
            else
            {
                Key = Convert.ToInt32(UsersList.SelectedRow.Cells[1].Text);


            }
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (FName.Value == "" || UDOB.Text == "" || gender.SelectedIndex == -1 || UName.Value == "" || Pass.Value == "" || admin.SelectedIndex == -1)
                {
                    ErrMsg.Text = "Vui lòng điền đầy đủ thông tin!";
                }
                else
                {
                    string Name = FName.Value;
                    string NSinh = UDOB.Text;
                    string UGender = gender.SelectedItem.ToString();
                    string username = UName.Value;
                    string pw = Pass.Value;
                    string ad = admin.SelectedItem.ToString();

                    string Query = "INSERT INTO user_tbl (userName, fullName, dateOfBirth, gender, password, isAdmin) " +
                                   "VALUES (@Name, @fName, @dOB, @gen, @passw, @isAdmin)";

                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(Query))
                    {
                        cmd.Parameters.AddWithValue("@Name", username);
                        cmd.Parameters.AddWithValue("@fName", Name);
                        cmd.Parameters.AddWithValue("@dOB", NSinh);
                        cmd.Parameters.AddWithValue("@gen", UGender);
                        cmd.Parameters.AddWithValue("@passw", pw);
                        cmd.Parameters.AddWithValue("@isAdmin", ad);

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            ShowUsers();
                            ErrMsg.Text = "Đã thêm người dùng thành công!";
                            ClearInputs();
                        }
                        else
                        {
                            ErrMsg.Text = "Không thể người dùng. Vui lòng thử lại!";
                        }
                    }
                    helper.closeConnection();
                }
            }
            catch (Exception Ex)
            {
                ErrMsg.Text = Ex.Message;
            }
        }

        private void ClearInputs()
        {
            FName.Value = string.Empty;
            UDOB.Text = string.Empty;
            gender.SelectedIndex = 0;
            UName.Value = string.Empty;
            Pass.Value = string.Empty;
            admin.SelectedIndex = 0;
        }

        protected void UsersList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            UsersList.PageIndex = e.NewPageIndex;
            ShowUsers();
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (FName.Value == "" || UDOB.Text == "" || gender.SelectedIndex == -1 || UName.Value == "" || Pass.Value == "" || admin.SelectedIndex == -1)
                {
                    ErrMsg.Text = "Bạn chưa chọn nội dung muốn xóa!!!";
                }
                else
                {
                    string Query = "DELETE FROM user_tbl WHERE userId = @userId";

                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(Query))
                    {
                        cmd.Parameters.AddWithValue("@userId", UsersList.SelectedRow.Cells[1].Text);
                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            ShowUsers();
                            ErrMsg.Text = "Đã xóa thông tin cán bộ";
                            ClearInputs();
                        }
                        else
                        {
                            ErrMsg.Text = "Không tìm thấy người dùng để xóa";
                        }
                    }
                    helper.closeConnection();
                }
            }
            catch (Exception Ex)
            {
                ErrMsg.Text = Ex.Message;
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (FName.Value == "" || UDOB.Text == "" || gender.SelectedIndex == -1 || UName.Value == "" || Pass.Value == "" || admin.SelectedIndex == -1)
                {
                    ErrMsg.Text = "Vui lòng chọn người dùng và điền đầy đủ thông tin để cập nhật!";
                    return;
                }

                if (UsersList.SelectedRow == null)
                {
                    ErrMsg.Text = "Vui lòng chọn người dùng để cập nhật!";
                    return;
                }
                int UId = Convert.ToInt32(UsersList.SelectedRow.Cells[1].Text);

                string Name = FName.Value;
                string NSinh = UDOB.Text;
                string UGender = gender.SelectedItem.ToString();
                string username = UName.Value;
                string pw = Pass.Value;
                string ad = admin.SelectedItem.ToString();
                string Query = @"UPDATE user_tbl 
                         SET fullName = @Name, 
                             dateOfBirth = @dob, 
                             gender = @gen, 
                             userName = @UN, 
                             password = @pass, 
                             isAdmin = @admin
                         WHERE userId = @UserI";

                helper.openConnection();
                using (SqlCommand cmd = helper.CreateCommand(Query))
                {
                    cmd.Parameters.AddWithValue("@UserI", UId);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@dob", NSinh);
                    cmd.Parameters.AddWithValue("@gen", UGender);
                    cmd.Parameters.AddWithValue("@UN", username);
                    cmd.Parameters.AddWithValue("@pass", pw);
                    cmd.Parameters.AddWithValue("@admin", ad);

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        ShowUsers();
                        ErrMsg.Text = "Đã cập nhật thông tin người dùng thành công!";
                        ClearInputs();
                    }
                    else
                    {
                        ErrMsg.Text = "Không thể cập nhật thông tin người dùng. Vui lòng thử lại!";
                    }
                }
                helper.closeConnection();
            }
            catch (Exception Ex)
            {
                ErrMsg.Text = "Lỗi khi cập nhật: " + Ex.Message;
            }
        }

        protected void ExitSearchUserBtn_Click(object sender, EventArgs e)
        {
            ShowUsers();
            txtSearchUser.Value = "";
        }
    }
}