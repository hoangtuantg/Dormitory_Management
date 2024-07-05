using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
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
                BindGridView();
            }
        }

        private void BindGridView()
        {
            helper.openConnection();
            DataSet dataSet = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(helper.CreateCommand(
                "select room_tbl.roomId, room_tbl.roomName, room_tbl.createAt, room_tbl.maxStudent, building_tbl.buildingName, COUNT(student_tbl.roomId) as currentStudent " +
                "from room_tbl " +
                "left join student_tbl on room_tbl.roomId = student_tbl.roomId " +
                "left join building_tbl on room_tbl.buildingId = building_tbl.buildingId " +
                "group by room_tbl.roomId, room_tbl.roomName, room_tbl.createAt, room_tbl.maxStudent, building_tbl.buildingName "
            ));
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

        protected void RoomList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = RoomList.SelectedRow;
            if (gridViewRow != null)
            {
                string roomName = gridViewRow.Cells[1].Text;
                string maxStudent = gridViewRow.Cells[3].Text;
                string building = gridViewRow.Cells[4].Text;
                RoomName.Value = roomName;
                MaxStudent.Value = maxStudent;
                Building.Value = building;
            }

        }

        protected void RoomList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            RoomList.PageIndex = e.NewPageIndex;
            BindGridView();
        }
    }
}