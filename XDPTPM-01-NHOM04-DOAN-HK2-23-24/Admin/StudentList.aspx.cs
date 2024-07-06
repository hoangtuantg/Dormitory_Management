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
    }
}