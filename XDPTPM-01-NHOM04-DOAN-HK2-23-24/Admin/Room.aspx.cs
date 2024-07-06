using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin
{
    public partial class Room : System.Web.UI.Page
    {

        private DatabaseHelper helper = new DatabaseHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView("");
                UpdateBtn.Enabled = false;
            }
        }

        private void BindGridView(string name)
        {
            helper.openConnection();
            DataSet dataSet = new DataSet();
            SqlCommand cmd;
            if(string.IsNullOrEmpty(name.Trim()))
            {
                cmd = helper.CreateCommand(
                    "select room_tbl.roomId, room_tbl.roomName, room_tbl.createAt, room_tbl.maxStudent, building_tbl.buildingName, COUNT(student_tbl.roomId) as currentStudent " +
                    "from room_tbl " +
                    "left join student_tbl on room_tbl.roomId = student_tbl.roomId " +
                    "left join building_tbl on room_tbl.buildingId = building_tbl.buildingId " +
                    "group by room_tbl.roomId, room_tbl.roomName, room_tbl.createAt, room_tbl.maxStudent, building_tbl.buildingName "
                );
            } else
            {
                cmd = helper.CreateCommand(
                    "select room_tbl.roomId, room_tbl.roomName, room_tbl.createAt, room_tbl.maxStudent, building_tbl.buildingName, COUNT(student_tbl.roomId) as currentStudent " +
                    "from room_tbl " +
                    "left join student_tbl on room_tbl.roomId = student_tbl.roomId " +
                    "left join building_tbl on room_tbl.buildingId = building_tbl.buildingId " +
                    "where room_tbl.roomName like '%" + name + "%' " +
                    "group by room_tbl.roomId, room_tbl.roomName, room_tbl.createAt, room_tbl.maxStudent, building_tbl.buildingName "
                );
            }

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dataSet);
            RoomList.DataSource = dataSet;
            RoomList.DataBind();
            helper.closeConnection();
        }

        protected void RoomList_PageIndexChanging()
        {

        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            if (RoomList.PageIndex > 0)
            {
                RoomList.PageIndex--;
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (RoomList.PageIndex < RoomList.PageCount - 1)
            {
                RoomList.PageIndex++;
            }
        }

        protected void GetListBuilding()
        {
            helper.openConnection();

            SqlDataReader reader = helper.CreateCommand(
                "select building_tbl.buildingId, building_tbl.buildingName from building_tbl"
            ).ExecuteReader();

            RoomBuilding.DataSource = reader;
            RoomBuilding.DataTextField = "buildingName";
            RoomBuilding.DataValueField = "buildingId";
            RoomBuilding.DataBind();
            helper.closeConnection();
        }

        protected void RoomList_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateBtn.Enabled = true;
            GridViewRow gridViewRow = RoomList.SelectedRow;
            if (gridViewRow != null)
            {
                GetListBuilding();
                string roomName = gridViewRow.Cells[1].Text;
                string maxStudent = gridViewRow.Cells[3].Text;
                string building = gridViewRow.Cells[5].Text;
                int buildingId = -1;

                helper.openConnection();
                SqlDataReader reader = helper.CreateCommand(
                    "select building_tbl.buildingId from building_tbl where buildingName = '" + building + "'"
                ).ExecuteReader();
                while (reader.Read())
                {
                    buildingId = reader.GetInt32(0);
                }

                RoomName.Value = roomName;
                MaxStudent.Value = maxStudent;
                RoomBuilding.SelectedValue = buildingId.ToString();
                helper.closeConnection();
            }

        }

        protected void RoomList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            RoomList.PageIndex = e.NewPageIndex;
            BindGridView("");
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            if(!Validate())
            {
                return;
            }

            helper.openConnection();
            SqlCommand cmd;
            string roomName = RoomName.Value;
            string maxStudent = MaxStudent.Value;
            int roomBuilding = int.Parse(RoomBuilding.SelectedValue.ToString());

            if (RoomList.SelectedIndex == -1)
            {
                DateTime createAt = DateTime.Now;
                
                cmd = helper.CreateCommand(
                    "INSERT INTO room_tbl " +
                    "(roomName, maxStudent, buildingId, createAt)" +
                    "VALUES(@roomName, @maxStudent, @buildingId, @createAt)"
                );
                cmd.Parameters.AddWithValue("@roomName", roomName);
                cmd.Parameters.AddWithValue("@maxStudent", maxStudent);
                cmd.Parameters.AddWithValue("@buildingId", roomBuilding);
                cmd.Parameters.AddWithValue("@createAt", createAt);

                try
                {
                    int rowsAffected = cmd.ExecuteNonQuery();
                    lblResult.Text = "Một phòng ký túc vừa được thêm mới";
                }
                catch (Exception ex)
                {
                    lblResult.Text = "Error: " + ex.Message;
                }
                finally { helper.closeConnection(); }
            } else
            {
                GridViewRow gridViewRow = RoomList.SelectedRow;
                string roomId = gridViewRow.Cells[0].Text;
                string originRoomName = gridViewRow.Cells[1].Text;
                string originMaxStudent = gridViewRow.Cells[3].Text;
                int originBuilding = -1;

                helper.openConnection();
                SqlDataReader reader = helper.CreateCommand(
                    "select building_tbl.buildingId from building_tbl where buildingName = '" + gridViewRow.Cells[6].Text + "'"
                ).ExecuteReader();
                while (reader.Read())
                {
                    originBuilding = reader.GetInt32(0);
                }

                reader.Close();
                if (roomName.Trim().Equals(originRoomName) 
                    && maxStudent.Trim().Equals(originMaxStudent)
                    && roomBuilding == originBuilding)
                {
                    lblResult.Text = "Chưa có dữ liệu thay đổi";
                    return;
                } else
                {
                    cmd = helper.CreateCommand(
                        "update room_tbl " +
                        "set roomName = @roomName, maxStudent = @maxStudent, buildingId = @buildingId " +
                        "where roomId = @roomId"
                    );

                    cmd.Parameters.AddWithValue("@roomName", roomName);
                    cmd.Parameters.AddWithValue("@roomId", roomId);
                    cmd.Parameters.AddWithValue("@maxStudent", maxStudent);
                    cmd.Parameters.AddWithValue("@buildingId", roomBuilding);
                    try
                    {
                        int rowsAffected = cmd.ExecuteNonQuery();
                        lblResult.Text = "Một phòng ký túc " + originRoomName + " vừa được cập nhật";
                    }
                    catch (Exception ex)
                    {
                        lblResult.Text = "Error: " + ex.Message;
                    }
                    finally { helper.closeConnection(); }
                }
            }
            helper.closeConnection();
            ClearAll();
            BindGridView("");
        }

        protected void SearchRoomBtn_Click(object sender, EventArgs e)
        {
            string searchText = txtSearchRoom.Value.Trim();
            BindGridView(searchText);
        }

        protected void ExitRoomBtn_Click(object sender, EventArgs e)
        {
            BindGridView("");
            txtSearchRoom.Value = "";
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            UpdateBtn.Enabled = true;
            GetListBuilding();
            ClearAll();
        }

        protected void ClearAll()
        {
            RoomName.Value = string.Empty;
            MaxStudent.Value = string.Empty;
            RoomBuilding.SelectedIndex = 0;

            RoomList.SelectRow(-1);
        }

        protected bool Validate()
        {
            lblResult.Text = string.Empty;
            lblResult.ForeColor = System.Drawing.Color.GreenYellow;
            if (string.IsNullOrEmpty(RoomName.Value.Trim()))
            {
                lblResult.Text = "Tên phòng không được để trống";
                lblResult.ForeColor = System.Drawing.Color.Red;
                return false;
            } 
            
            if(string.IsNullOrEmpty(MaxStudent.Value))
            {
                lblResult.Text = "Số lượng sinh viên tối đa không được để trống";
                lblResult.ForeColor = System.Drawing.Color.Red;
                return false;
            }
            return true;
        }
    }
}