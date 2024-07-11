using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers;
using Microsoft.Ajax.Utilities;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin
{
    public partial class StaffList : System.Web.UI.Page
    {
        private DatabaseHelper helper = new DatabaseHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindData();
            }               
        }

        protected void BindData()
        {
            helper.openConnection();
            SqlDataAdapter adapter = new SqlDataAdapter(helper.CreateCommand("select employee_tbl.employeeId, employee_tbl.employeeName, employee_tbl.gender, employee_tbl.dateOfBirth, employee_tbl.job, building_tbl.buildingName from employee_tbl left join building_tbl on employee_tbl.buildingId=building_tbl.buildingId"));
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            employeeList.DataSource = dt;
            employeeList.DataBind();
            SqlDataReader reader = helper.CreateCommand("select * from building_tbl").ExecuteReader();
            box_buildingId.DataSource = reader;
            box_buildingId.DataTextField = "buildingName";
            box_buildingId.DataValueField = "buildingId";
            box_buildingId.DataBind();
            helper.closeConnection();
        }

        protected void employeeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(btnAdd.Visible)
            {
                btnReset.Text = "Quay lại";
                btnEdit.Visible = true;
                btnDelete.Visible = true;
                btnAdd.Visible = false;
                lbStaffID.Visible = true;
                ClearBox();
            }            
            int rowID = int.Parse(employeeList.SelectedRow.Cells[0].Text);
            string dateBirth = employeeList.SelectedRow.Cells[3].Text;
            helper.openConnection();
            SqlDataReader reader = helper.CreateCommand("select employee_tbl.employeeName, employee_tbl.gender, employee_tbl.dateOfBirth, employee_tbl.job, building_tbl.buildingId, building_tbl.buildingName from employee_tbl left join building_tbl on employee_tbl.buildingId=building_tbl.buildingId where employee_tbl.employeeId = " + rowID).ExecuteReader();
            while(reader.Read())
            {
                staffID.Value = rowID.ToString();
                staffName.Value = reader["employeeName"].ToString();
                box_staffName.Value = reader["employeeName"].ToString();
                gender.SelectedItem.Value = reader["gender"].ToString();
                box_gender.Value = reader["gender"].ToString();
                birth.Value = dateBirth;
                box_birth.Value = reader["dateOfBirth"].ToString();
                job.Value = reader["job"].ToString() ;
                box_job.Value = reader["job"].ToString();
                buildingId.Value = reader["buildingName"].ToString();
                box_buildingId.SelectedValue = reader["buildingId"].ToString();
            }
            helper.closeConnection();
            ClearMsg();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                ClearMsg();
                if (BoxValidator())
                {
                    string emName = box_staffName.Value.ToString();
                    string emGender = gender.SelectedItem.Text;
                    string emBirth = box_birth.Value.ToString();
                    string emJob = box_job.Value.ToString();
                    string buildID = box_buildingId.SelectedItem.Value;

                    helper.openConnection();
                    SqlCommand cmd = helper.CreateCommand("insert into employee_tbl ( employeeName, gender, dateOfBirth, job, buildingId, createAt) values ( @emName, @emGender, @emBirth, @emJob, @buildID, @now)");
                    cmd.Parameters.AddWithValue("@emName", emName);
                    cmd.Parameters.AddWithValue("@emGender", emGender);
                    cmd.Parameters.AddWithValue("@emBirth", emBirth);
                    cmd.Parameters.AddWithValue("@emJob", emJob);
                    cmd.Parameters.AddWithValue("@buildID", buildID);
                    cmd.Parameters.AddWithValue("@now", DateTime.Now);
                    int result = cmd.ExecuteNonQuery();
                    if (result != 0)
                    {
                        MsgSucc.Visible = true;
                        MsgSucc.Text = "Đã thêm mới cán bộ!";
                        ClearFields();
                        BindData();
                        ResetBtn();
                        return;
                    }
                } 
            }
            catch (Exception Ex)
            {
                MsgErr.Visible = true;
                MsgErr.Text = Ex.Message;
                return;
            }
        }

        protected void editBtn_Click(object sender, EventArgs e)
        {
            btnUpdate.Visible = true;
            btnEdit.Visible = false;
            btnReset.Visible = false;
            btnCancel.Visible = true;
            ShowBox();
        }

        protected void searchStaffBtn_Click(object sender, EventArgs e)
        {
            ClearMsg();
            if(searchID.Value == "")
            {
                BindData();
                ClearFields();
            }
            else
            {
                string search = searchID.Value;
                helper.openConnection();
                SqlCommand cmd = helper.CreateCommand("select employee_tbl.employeeId, employee_tbl.employeeName, employee_tbl.gender, employee_tbl.dateOfBirth, employee_tbl.job, building_tbl.buildingName from employee_tbl left join building_tbl on employee_tbl.buildingId=building_tbl.buildingId where employee_tbl.employeeId like @search or employee_tbl.employeeName like @search");
                cmd.Parameters.AddWithValue("@search","%" + search + "%");
                if (cmd.ExecuteScalar() != null)
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    employeeList.DataSource = dt;
                    employeeList.DataBind();
                }
                else
                {
                    msgSearch.Visible = true;
                    msgSearch.Text = "Không tìm thấy dữ liệu trùng khớp!";
                }
                helper.closeConnection();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearFields();
            if (btnEdit.Visible)
            {
                btnReset.Text = "Làm lại";
                btnEdit.Visible = false;
                btnDelete.Visible = false;
                btnAdd.Visible = true;
                ShowBox();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnUpdate.Visible = false;
            btnReset.Visible = true;
            btnEdit.Visible = true;
            btnCancel.Visible = false;
            ClearBox();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ClearMsg();
            int id = int.Parse(staffID.Value);
            helper.openConnection();
            try
            {
                BoxValidator();
                string emName = box_staffName.Value.ToString();
                string emGender = gender.SelectedItem.Text;
                string emBirth = box_birth.Value.ToString();
                string emJob = box_job.Value.ToString();
                string buildID = box_buildingId.SelectedItem.Value;
                SqlCommand cmd = helper.CreateCommand("update employee_tbl set employeeName = @emName, gender = @emGender, dateOfBirth = @emBirth, job = @emJob, buildingId = @buildID where employeeId = " + id);
                cmd.Parameters.AddWithValue("@emName", emName);
                cmd.Parameters.AddWithValue("@emGender", emGender);
                cmd.Parameters.AddWithValue("@emBirth", emBirth);
                cmd.Parameters.AddWithValue("@emJob", emJob);
                cmd.Parameters.AddWithValue("@buildID", buildID);
                int result = cmd.ExecuteNonQuery();
                BindData();
                if(result != 0)
                {
                    MsgSucc.Visible = true;
                    MsgSucc.Text = "Cập nhật thành công!";
                    ClearFields();
                } else {
                    MsgErr.Visible = true;
                    MsgErr.Text = "Không thể cập nhật!";
                }
            } catch (Exception Ex) {
                MsgErr.Visible = true;
                MsgErr.Text = "Lỗi: " + Ex.Message;
                return;
            }
            helper.closeConnection();
        }

        protected void ClearFields()
        {
            lbStaffID.Visible = false;
            staffID.Visible = false;

            staffID.Value = null;
            staffName.Value = null;
            gender.SelectedIndex = 0;
            birth.Value = null;
            job.Value = null;
            buildingId.Value = null;

            box_staffName.Value = null;
            box_gender.Value = null;
            box_birth.Value = null;
            box_job.Value = null;
            box_buildingId.SelectedIndex = 0;
        }

        protected void ClearBox()
        {
            staffID.Visible = true;
            staffName.Visible = true;
            box_gender.Visible = true;
            birth.Visible = true;
            job.Visible = true;
            buildingId.Visible = true;

            box_staffName.Visible = false;
            gender.Visible = false;
            box_birth.Visible = false;
            box_job.Visible = false;
            box_buildingId.Visible = false;
        }

        protected void ShowBox()
        {
            staffName.Visible = false;
            box_gender.Visible = false;
            birth.Visible = false;
            job.Visible = false;
            buildingId.Visible = false;

            box_staffName.Visible = true;
            gender.Visible = true;
            box_birth.Visible = true;
            box_job.Visible = true;
            box_buildingId.Visible = true;
        }

        protected void ClearMsg()
        {
            msgSearch.Visible = false;
            MsgErr.Visible = false;
            MsgSucc.Visible = false;

            msgValidStaffID.Text = "";
            msgValidStaffName.Text = "";
            msgValidGender.Text = "";
            msgValidBirth.Text = "";
            msgValidJob.Text = "";
            msgValidBuild.Text = "";
        }

        protected void ResetBtn()
        {
            btnAdd.Visible = true;
            btnReset.Visible = true;
            btnReset.Text = "Làm lại";
            btnEdit.Visible = false;
            btnCancel.Visible = false;
            btnDelete.Visible = false;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = int.Parse(staffID.Value);
            helper.openConnection();
            SqlCommand cmd = helper.CreateCommand("delete from employee_tbl where employeeId = " + id);
            cmd.ExecuteNonQuery();
            int result = cmd.ExecuteNonQuery();
            BindData();
            if (result == 0)
            {
                MsgSucc.Visible = true;
                MsgSucc.Text = "Xóa thành công!";
                ClearFields();
            }
            else
            {
                MsgErr.Visible = true;
                MsgErr.Text = "Không thể xóa!";
            }
        }

        protected bool BoxValidator()
        {
            string emName = box_staffName.Value.ToString();
            int emGender = gender.SelectedIndex;
            string emBirth = box_birth.Value.ToString();
            string emJob = box_job.Value.ToString();
            string buildID = box_buildingId.SelectedItem.Text;
            if (string.IsNullOrEmpty(emName))
            {
                msgValidStaffName.Text = "Vui lòng điền tên cán bộ!";
                return false;
            }
            if (emName.Length > 50) 
            {
                msgValidStaffName.Text = "Tên cán bộ không được vượt quá 50 ký tự!";
                return false;
            }
            if (emGender == 0)
            {
                msgValidGender.Text = "Vui lòng chọn giới tính!";
                return false;
            }
            if (string.IsNullOrEmpty(emBirth))
            {
                msgValidBirth.Text = "Vui lòng chọn ngày sinh!";
                return false;
            }
            if (string.IsNullOrEmpty(emJob))
            {
                msgValidJob.Text = "Vui lòng điền công việc!";
                return false;
            }
            if (string.IsNullOrEmpty(buildID))
            {
                msgValidBuild.Text = "Vui lòng chọn tòa!";
                return false;
            }
            return true;
        }
    }
}