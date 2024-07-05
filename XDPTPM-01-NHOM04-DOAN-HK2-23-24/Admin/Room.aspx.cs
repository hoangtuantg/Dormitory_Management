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
            helper.openConnection();
            DataSet dataSet = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(helper.CreateCommand("select * from room_tbl"));
            adapter.Fill(dataSet);
            RoomList.DataSource = dataSet;
            RoomList.DataBind();
            helper.closeConnection();
        }
    }
}