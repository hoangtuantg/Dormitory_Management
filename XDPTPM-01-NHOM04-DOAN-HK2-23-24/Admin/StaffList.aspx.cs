using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers;

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
            SqlDataAdapter adapter = new SqlDataAdapter(helper.CreateCommand("select employee_tbl.employeeId, employee_tbl.employeeName, employee_tbl.gender, employee_tbl.dateOfBirth, building_tbl.buildingName from employee_tbl left join building_tbl on employee_tbl.buildingId=building_tbl.buildingId"));
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
            cardInfo.Visible = true;
            int rowID = int.Parse(employeeList.SelectedRow.Cells[0].Text);
            string dateBirth = employeeList.SelectedRow.Cells[3].Text;
            helper.openConnection();
            SqlDataReader reader = helper.CreateCommand("select employee_tbl.employeeName, employee_tbl.gender, employee_tbl.dateOfBirth, building_tbl.buildingId, building_tbl.buildingName from employee_tbl left join building_tbl on employee_tbl.buildingId=building_tbl.buildingId where employee_tbl.employeeId = " + rowID).ExecuteReader();
            while(reader.Read())
            {
                staffID.Value = rowID.ToString();
                staffName.Value = reader["employeeName"].ToString();
                box_staffName.Value = reader["employeeName"].ToString();
                gender.SelectedItem.Value = reader["gender"].ToString();
                box_gender.Value = reader["gender"].ToString();
                birth.Value = dateBirth;
                box_birth.Value = reader["dateOfBirth"].ToString();
                buildingId.Value = reader["buildingName"].ToString();
                box_buildingId.SelectedValue = reader["buildingId"].ToString();
            }
            helper.closeConnection();
            ClearMsg();
        }

        protected void editBtn_Click(object sender, EventArgs e)
        {
            btnUpdate.Visible = true;
            btnEdit.Visible = false;
            btnCancel.Visible = true;
            staffName.Visible = false;
            gender.Visible = true;
            birth.Visible = false;
            buildingId.Visible = false;
            box_staffName.Visible = true;
            box_gender.Visible = false;
            box_birth.Visible = true;
            box_buildingId.Visible = true;
        }

        protected void searchStaffBtn_Click(object sender, EventArgs e)
        {
            if(searchID.Value == "")
            {
                BindData();
                ClearFields();
            }
            else
            {
                string search = searchID.Value;
                helper.openConnection();
                SqlCommand cmd = helper.CreateCommand("select employee_tbl.employeeId, employee_tbl.employeeName, employee_tbl.gender, employee_tbl.dateOfBirth, building_tbl.buildingName from employee_tbl left join building_tbl on employee_tbl.buildingId=building_tbl.buildingId where employee_tbl.employeeId like @search or employee_tbl.employeeName like @search");
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
                    alertErr.Visible = true;
                    MsgErr.Text = "Không tìm thấy dữ liệu trùng khớp!";
                }
                helper.closeConnection();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnUpdate.Visible = false;
            btnEdit.Visible = true;
            btnCancel.Visible = false;
            staffName.Visible = true;
            gender.Visible = false;
            birth.Visible = true;
            buildingId.Visible = true;
            box_staffName.Visible = false;
            box_gender.Visible = true;
            box_birth.Visible = false;
            box_buildingId.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int id = int.Parse(staffID.Value);
            helper.openConnection();
            try
            {
                if(box_staffName.Value == "" || box_gender.Value == "" || box_buildingId.SelectedItem.Value == "")
                {
                    alertErr.Visible = true;
                    MsgErr.Text = "Vui lòng nhập đầy đủ thông tin";
                    return;
                }
                string employeeName = box_staffName.Value;
                string employeeGender = gender.SelectedItem.ToString();
                string employeeBirth = box_birth.Value;
                string buildID = box_buildingId.SelectedItem.Value;
                SqlCommand cmd = helper.CreateCommand("update employee_tbl set employeeName = @employeeName, gender = @employeeGender, dateOfBirth = @employeeBirth, updateAt = @updateAt, buildingId = @buildID where employeeId = " + id);
                cmd.Parameters.AddWithValue("@employeeName", employeeName);
                cmd.Parameters.AddWithValue("@employeeGender", employeeGender);
                cmd.Parameters.AddWithValue("@employeeBirth", employeeBirth);
                cmd.Parameters.AddWithValue("@buildID", buildID);
                cmd.Parameters.AddWithValue("@updateAt", DateTime.Now);
                int result = cmd.ExecuteNonQuery();
                BindData();
                if(result != 0)
                {
                    alertSucc.Visible = true;
                    MsgSucc.Text = "Cập nhật thành công!";
                    ClearFields();
                } else {
                    alertErr.Visible = true;
                    MsgErr.Text = "Không thể cập nhật!";
                }
            } catch (Exception Ex) {
                alertErr.Visible = true;
                MsgErr.Text = "Lỗi: " + Ex.Message;
                return;
            }
        }

        protected void ClearFields()
        {
            cardInfo.Visible = false;
            btnUpdate.Visible = false;
            btnEdit.Visible = true;
            btnCancel.Visible = false;
            staffName.Visible = true;
            gender.Visible = false;
            birth.Visible = true;
            buildingId.Visible = true;
            box_staffName.Visible = false;
            box_gender.Visible = true;
            box_birth.Visible = false;
            box_buildingId.Visible = false;
        }

        protected void ClearMsg()
        {
            alertErr.Visible = false;
            alertSucc.Visible = false;
            MsgErr.Visible = false;
            MsgSucc.Visible = false;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = int.Parse(staffID.Value);
            helper.openConnection();
            SqlCommand cmd = helper.CreateCommand("delete from employee_tbl where employeeId = " + id);
            cmd.ExecuteNonQuery();
            int result = cmd.ExecuteNonQuery();
            BindData();
            if (result != 0)
            {
                alertSucc.Visible = true;
                MsgSucc.Text = "Xóa thành công!";
                ClearFields();
            }
            else
            {
                alertErr.Visible = true;
                MsgErr.Text = "Không thể xóa!";
            }
        }
    }
}