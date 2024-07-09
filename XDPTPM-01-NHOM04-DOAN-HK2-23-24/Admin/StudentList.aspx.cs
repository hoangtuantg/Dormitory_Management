using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers;
using System.Xml.Linq;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin
{
    public partial class StudentList : System.Web.UI.Page
    {
        private DatabaseHelper helper = new DatabaseHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowStudent();
            }
        }

        private void ShowStudent()
        {
            helper.openConnection();
            DataSet dataSet = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(helper.CreateCommand(
                " SELECT student_tbl.studentId, student_tbl.studentName,student_tbl.createAt, student_tbl.gender, student_tbl.studentCode, student_tbl.numIdentify, student_tbl.dateOfBirth, room_tbl.roomName" + 
                " FROM student_tbl" + 
                " LEFT JOIN room_tbl ON student_tbl.roomId = room_tbl.roomId" 
            ));
            adapter.Fill(dataSet);
            StudentLists.DataSource = dataSet;
            StudentLists.DataBind();
            helper.closeConnection();
        }

        protected void StudentLists_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            StudentLists.PageIndex = e.NewPageIndex;
            ShowStudent();
        }

        protected void SearchStudentBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string searchText = txtSearchStudent.Value.Trim();
                if (!string.IsNullOrEmpty(searchText))
                {
                    string query = "SELECT student_tbl.studentId, student_tbl.studentName, student_tbl.createAt, " +
                                   "student_tbl.gender, student_tbl.studentCode, student_tbl.numIdentify, " +
                                   "student_tbl.dateOfBirth, room_tbl.roomName " +
                                   "FROM student_tbl " +
                                   "LEFT JOIN room_tbl ON student_tbl.roomId = room_tbl.roomId " +
                                   "WHERE student_tbl.studentName LIKE @searchText OR " +
                                   "student_tbl.studentCode LIKE @searchText OR " +
                                   "student_tbl.numIdentify LIKE @searchText";

                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@searchText", "%" + searchText + "%");
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataSet dataSet = new DataSet();
                            adapter.Fill(dataSet);
                            StudentLists.DataSource = dataSet;
                            StudentLists.DataBind();
                        }
                    }
                    helper.closeConnection();
                }
                else
                {
                    ShowStudent();
                }
            }
            catch (Exception ex)
            {
                ErrMsg.Text = ex.Message;
            }
        }

        int Key = 0;
        protected void StudentLists_SelectedIndexChanged(object sender, EventArgs e)
        {
            SName.Value = HttpUtility.HtmlDecode(StudentLists.SelectedRow.Cells[2].Text);
            gender.SelectedItem.Value = HttpUtility.HtmlDecode(StudentLists.SelectedRow.Cells[4].Text);
            MSV.Value = HttpUtility.HtmlDecode(StudentLists.SelectedRow.Cells[5].Text);
            CCCD.Value = HttpUtility.HtmlDecode(StudentLists.SelectedRow.Cells[6].Text);
            Dob.Value = HttpUtility.HtmlDecode(StudentLists.SelectedRow.Cells[7].Text);
            SRoom.Value = HttpUtility.HtmlDecode(StudentLists.SelectedRow.Cells[8].Text);

            if (SName.Value == "")
            {
                Key = 0;
            }
            else
            {
                Key = Convert.ToInt32(StudentLists.SelectedRow.Cells[1].Text);


            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (SName.Value == "" || gender.SelectedIndex == -1 || MSV.Value == "" || CCCD.Value == "" || Dob.Value == "" || SRoom.Value == "")
                {
                    ErrMsg.Text = "Bạn chưa chọn nội dung muốn xóa!!!";
                }
                else
                {
                    string Query = "DELETE FROM student_tbl WHERE studentId = @studentId";

                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(Query))
                    {
                        cmd.Parameters.AddWithValue("@studentId", StudentLists.SelectedRow.Cells[1].Text);
                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            ShowStudent();
                            ErrMsg.Text = "Đã xóa thông tin sinh viên";
                            ClearFields();
                        }
                        else
                        {
                            ErrMsg.Text = "Không tìm thấy sinh viên để xóa";
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

        private void ClearFields()
        {
            SName.Value = "";
            gender.SelectedIndex = -1;
            MSV.Value = "";
            CCCD.Value = "";
            Dob.Value = "";
            SRoom.Value = "";
            Key = 0;
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (SName.Value == "" || gender.SelectedIndex == -1 || MSV.Value == "" || CCCD.Value == "" || Dob.Value == "" || SRoom.Value == "")
                {
                    ErrMsg.Text = "Vui lòng điền đầy đủ thông tin!";
                }
                else
                {
                    string Name = SName.Value;
                    string SGender = gender.SelectedItem.ToString();
                    string SCode = MSV.Value;
                    string NI = CCCD.Value;
                    string NgaySinh = Dob.Value;
                    string RoomName = SRoom.Value;

                    // Lấy roomId từ tên phòng
                    int roomId = GetRoomIdFromName(RoomName);

                    if (roomId == -1)
                    {
                        ErrMsg.Text = "Không tìm thấy phòng với tên đã nhập!";
                        return;
                    }

                    string Query = "INSERT INTO student_tbl (studentName, gender, studentCode, numIdentify, dateOfBirth, roomId, createAt) " +
                                   "VALUES (@Name, @Gender, @Code, @NI, @DoB, @RoomId, @CreateAt)";

                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(Query))
                    {
                        cmd.Parameters.AddWithValue("@Name", Name);
                        cmd.Parameters.AddWithValue("@Gender", SGender);
                        cmd.Parameters.AddWithValue("@Code", SCode);
                        cmd.Parameters.AddWithValue("@NI", NI);
                        cmd.Parameters.AddWithValue("@DoB", NgaySinh);
                        cmd.Parameters.AddWithValue("@RoomId", roomId);
                        cmd.Parameters.AddWithValue("@CreateAt", DateTime.Now);

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            ShowStudent();
                            ErrMsg.Text = "Đã thêm sinh viên thành công!";
                            ClearFields();
                        }
                        else
                        {
                            ErrMsg.Text = "Không thể thêm sinh viên. Vui lòng thử lại!";
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

        private int GetRoomIdFromName(string roomName)
        {
            string query = "SELECT roomId FROM room_tbl WHERE roomName = @roomName";
            int roomId = -1;

            helper.openConnection();
            using (SqlCommand cmd = helper.CreateCommand(query))
            {
                cmd.Parameters.AddWithValue("@roomName", roomName);
                object result = cmd.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    roomId = Convert.ToInt32(result);
                }
            }
            helper.closeConnection();

            return roomId;
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (SName.Value == "" || gender.SelectedIndex == -1 || MSV.Value == "" || CCCD.Value == "" || Dob.Value == "" || SRoom.Value == "")
                {
                    ErrMsg.Text = "Vui lòng chọn sinh viên và điền đầy đủ thông tin để cập nhật!";
                    return;
                }

                // Lấy studentId từ hàng được chọn trong GridView
                if (StudentLists.SelectedRow == null)
                {
                    ErrMsg.Text = "Vui lòng chọn sinh viên để cập nhật!";
                    return;
                }
                int studentId = Convert.ToInt32(StudentLists.SelectedRow.Cells[1].Text);

                string Name = SName.Value;
                string SGender = gender.SelectedItem.ToString();
                string SCode = MSV.Value;
                string NI = CCCD.Value;
                string NgaySinh = Dob.Value;
                string RoomName = SRoom.Value;

                // Lấy roomId từ tên phòng
                int roomId = GetRoomIdFromName(RoomName);

                if (roomId == -1)
                {
                    ErrMsg.Text = "Không tìm thấy phòng với tên đã nhập!";
                    return;
                }

                string Query = @"UPDATE student_tbl 
                         SET studentName = @Name, 
                             gender = @Gender, 
                             studentCode = @Code, 
                             numIdentify = @NI, 
                             dateOfBirth = @DoB, 
                             roomId = @RoomId
                         WHERE studentId = @StudentId";

                helper.openConnection();
                using (SqlCommand cmd = helper.CreateCommand(Query))
                {
                    cmd.Parameters.AddWithValue("@StudentId", studentId);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Gender", SGender);
                    cmd.Parameters.AddWithValue("@Code", SCode);
                    cmd.Parameters.AddWithValue("@NI", NI);
                    cmd.Parameters.AddWithValue("@DoB", NgaySinh);
                    cmd.Parameters.AddWithValue("@RoomId", roomId);

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        ShowStudent();
                        ErrMsg.Text = "Đã cập nhật thông tin sinh viên thành công!";
                        ClearFields();
                    }
                    else
                    {
                        ErrMsg.Text = "Không thể cập nhật thông tin sinh viên. Vui lòng thử lại!";
                    }
                }
                helper.closeConnection();
            }
            catch (Exception Ex)
            {
                ErrMsg.Text = "Lỗi khi cập nhật: " + Ex.Message;
            }
        }
    }
    
}