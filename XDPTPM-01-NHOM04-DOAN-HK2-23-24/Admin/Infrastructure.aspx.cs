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
using System.Reflection;
using System.Xml.Linq;
using System.Data.SqlTypes;
using System.Web.Services.Description;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin
{
    public partial class Infrastructure : System.Web.UI.Page
    {
        private DatabaseHelper helper = new DatabaseHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowInfrastructure();
            }
        }

        protected void ShowInfrastructure()
        {
            helper.openConnection();
            DataSet dataSet = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(helper.CreateCommand(
                " SELECT infrastructure_tbl.infrastructureId, infrastructure_tbl.wardrobe_quantity,infrastructure_tbl.aircondition_quantity, infrastructure_tbl.bed_quantity, infrastructure_tbl.room_acreage, infrastructure_tbl.createAt, infrastructure_tbl.updateAt, room_tbl.roomName " +
                " FROM infrastructure_tbl" +
                " LEFT JOIN room_tbl ON infrastructure_tbl.roomId = room_tbl.roomId"
            ));
            adapter.Fill(dataSet);
            InfrastructureLists.DataSource = dataSet;
            InfrastructureLists.DataBind();
            SqlDataReader reader = helper.CreateCommand("select * from room_tbl").ExecuteReader();
            roomName.DataSource = reader;
            roomName.DataTextField = "roomName";
            roomName.DataValueField = "roomId";
            roomName.DataBind();
            helper.closeConnection();
        }

        protected void InfrastructureLists_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            InfrastructureLists.PageIndex = e.NewPageIndex;
            ShowInfrastructure();
        }

        int Key = 0;
        protected void InfrastructureLists_SelectedIndexChanged(object sender, EventArgs e)
        {
            infrastructure.Value = HttpUtility.HtmlDecode(InfrastructureLists.SelectedRow.Cells[0].Text);
            string RoomName = HttpUtility.HtmlDecode(InfrastructureLists.SelectedRow.Cells[2].Text);
            IWardrobe.Value = HttpUtility.HtmlDecode(InfrastructureLists.SelectedRow.Cells[3].Text);
            IAircondition.Value = HttpUtility.HtmlDecode(InfrastructureLists.SelectedRow.Cells[4].Text);
            IBed.Value = HttpUtility.HtmlDecode(InfrastructureLists.SelectedRow.Cells[5].Text);
            IAcreage.Value = HttpUtility.HtmlDecode(InfrastructureLists.SelectedRow.Cells[6].Text);

            int roomId = -1;
            if (roomName.SelectedValue == "")
            {
                Key = 0;
            }
            else
            {
                Key = Convert.ToInt32(InfrastructureLists.SelectedRow.Cells[1].Text);
            }

            helper.openConnection();
            SqlDataReader reader = helper.CreateCommand(
                "select room_tbl.roomId from room_tbl where roomName = '" + RoomName + "'"
            ).ExecuteReader();
            while (reader.Read())
            {
                roomId = reader.GetInt32(0);
            }

            roomName.SelectedValue = roomId.ToString();
            helper.closeConnection();
        }

        protected void SearchRoomNameBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string searchText = txtSearchRoomName.Value.Trim();
                if (!string.IsNullOrEmpty(searchText))
                {
                    string query = "SELECT infrastructure_tbl.infrastructureId, infrastructure_tbl.wardrobe_quantity,infrastructure_tbl.aircondition_quantity, infrastructure_tbl.bed_quantity, infrastructure_tbl.room_acreage, infrastructure_tbl.createAt, infrastructure_tbl.updateAt, room_tbl.roomName " +
                                   "FROM infrastructure_tbl " +
                                   "LEFT JOIN room_tbl ON infrastructure_tbl.roomId = room_tbl.roomId " +
                                   "WHERE room_tbl.roomName LIKE @searchText ";

                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@searchText", "%" + searchText + "%");
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataSet dataSet = new DataSet();
                            adapter.Fill(dataSet);
                            InfrastructureLists.DataSource = dataSet;
                            InfrastructureLists.DataBind();
                        }
                    }
                    helper.closeConnection();
                }
                else
                {
                    ShowInfrastructure();
                }
            }
            catch (Exception ex)
            {
                ErrMsg.Text = ex.Message;
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

        private void ClearFields()
        {
            roomName.SelectedItem.Value = "";
            IWardrobe.Value = "";
            IAircondition.Value = "";
            IBed.Value = "";
            IAcreage.Value = "";
            Key = 0;
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (IWardrobe.Value == "" || IAircondition.Value == "" || IBed.Value == "" || IAcreage.Value == "")
                {
                    ErrMsg.Text = "Vui lòng điền đầy đủ thông tin!";
                }
                else
                {
                    string roomId = roomName.SelectedItem.Value;
                    string Wardrobe = IWardrobe.Value;
                    string Aircondition = IAircondition.Value;
                    string Bed = IBed.Value;
                    string Acreage = IAcreage.Value;

                    string Query = "INSERT INTO infrastructure_tbl ( wardrobe_quantity, aircondition_quantity, bed_quantity, room_acreage, createAt, updateAt, roomId) " +
                                   "VALUES (@IWardrobe, @IAircondition, @IBed, @IAcreage, @CreateAt, @UpdateAt, @RoomId)";

                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(Query))
                    {
                        cmd.Parameters.AddWithValue("@IWardrobe", Wardrobe);
                        cmd.Parameters.AddWithValue("@IAircondition", Aircondition);
                        cmd.Parameters.AddWithValue("@IBed", Bed);
                        cmd.Parameters.AddWithValue("@IAcreage", Acreage);
                        cmd.Parameters.AddWithValue("@RoomId", roomId);
                        cmd.Parameters.AddWithValue("@CreateAt", DateTime.Now);
                        cmd.Parameters.AddWithValue("@UpdateAt", DateTime.Now);

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            ShowInfrastructure();
                            ErrMsg.Text = "Đã thêm thông tin cơ sở vật chất thành công!";
                            ClearFields();
                        }
                        else
                        {
                            ErrMsg.Text = "Không thể thêm thông tin cơ sở vật chất. Vui lòng thử lại!";
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

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (IWardrobe.Value == "" || IAircondition.Value == "" || IBed.Value == "" || IAcreage.Value == "")
                {
                    ErrMsg.Text = "Bạn chưa chọn nội dung muốn xóa!!!";
                }
                else
                {
                    string Query = "DELETE FROM infrastructure_tbl WHERE infrastructureId = @infrastructureId";

                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(Query))
                    {
                        cmd.Parameters.AddWithValue("@infrastructureId", InfrastructureLists.SelectedRow.Cells[1].Text);
                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            ShowInfrastructure();
                            ErrMsg.Text = "Đã xóa thông tin cơ sở vật chất ";
                            ClearFields();
                        }
                        else
                        {
                            ErrMsg.Text = "Không tìm thấy thông tin cơ sở vật chất để xóa";
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
                if (IWardrobe.Value == "" || IAircondition.Value == "" || IBed.Value == "" || IAcreage.Value == "")
                {
                    ErrMsg.Text = "Vui lòng chọn phòng và điền đầy đủ thông tin để cập nhật!";
                }
                else
                {
                    string roomId = roomName.SelectedItem.Value;
                    string Wardrobe = IWardrobe.Value;
                    string Aircondition = IAircondition.Value;
                    string Bed = IBed.Value;
                    string Acreage = IAcreage.Value;

                    int infrastructureId = Convert.ToInt32(InfrastructureLists.SelectedRow.Cells[1].Text);
                    string Query = @"Update infrastructure_tbl
                        SET wardrobe_quantity = @IWardrobe,
                            aircondition_quantity = @IAircondition,
                            bed_quantity = @IBed,
                            room_acreage = @IAcreage,
                            updateAt = @IUpdateAt,
                            roomId = @RoomId
                        WHERE infrastructureId = @InfrastructureId";

                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(Query))
                    {
                        cmd.Parameters.AddWithValue("@InfrastructureId", infrastructureId);
                        cmd.Parameters.AddWithValue("@IWardrobe", Wardrobe);
                        cmd.Parameters.AddWithValue("@IAircondition", Aircondition);
                        cmd.Parameters.AddWithValue("@IBed", Bed);
                        cmd.Parameters.AddWithValue("@IAcreage", Acreage);
                        cmd.Parameters.AddWithValue("@IUpdateAt", DateTime.Now);
                        cmd.Parameters.AddWithValue("@RoomId", roomId);

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            ShowInfrastructure();
                            ErrMsg.Text = "Đã cập nhật thông tin cơ sở vật chất thành công!";
                            ClearFields();
                        }
                        else
                        {
                            ErrMsg.Text = "Không thể cập nhật thông tin cơ sở vật chất. Vui lòng thử lại!";
                        }
                    }
                    helper.closeConnection();
                }
            }
            catch (Exception Ex)
            {
                ErrMsg.Text = "Lỗi khi cập nhật: " + Ex.Message;
            }
        }

        protected void ExitSearchBtn_Click(object sender, EventArgs e)
        {
            ShowInfrastructure();
            txtSearchRoomName.Value = "";
        }
    }
}