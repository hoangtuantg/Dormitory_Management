using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24
{
    public partial class SearchPage : System.Web.UI.Page
    {

        private DatabaseHelper helper = new DatabaseHelper();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearchWish.Value.Trim();

            helper.openConnection();
            DataSet dataSet = new DataSet();
            SqlCommand cmd;

            cmd = helper.CreateCommand(
                "select * from wish_tbl where numIdentify = @searchText or studentCode = @searchText"
            );
            cmd.Parameters.AddWithValue("@searchText", searchText);

            // Sử dụng SqlDataAdapter để lấy dữ liệu
            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
            {

                adapter.Fill(dataSet);

                // Kiểm tra nếu có dữ liệu trả về
                if (dataSet.Tables[0].Rows.Count > 0)
                {
                    DataRow row = dataSet.Tables[0].Rows[0];
                    lblName.Text = row["studentName"].ToString(); // Giả sử cột tên là "Name"
                    lblIDNumber.Text = row["numIdentify"].ToString(); // Cột số căn cước
                    pnDescription.Visible = false;
                    if (row["status"].ToString().Equals("accept"))
                    {
                        row["status"] = "Đã duyệt";
                    }
                    else if (row["status"].ToString().Equals("refuse"))
                    {
                        row["status"] = "Từ chối";
                        lblDescription.Text = row["description"].ToString();
                        pnDescription.Visible = true;

                    }
                    else
                    {
                        row["status"] = "Chờ duyệt";
                    }

                    lblStatus.Text = row["status"].ToString(); // Giả sử cột trạng thái là "Status"

                    pnlUserInfo.Visible = true; // Hiển thị khung thông tin
                }
                else
                {
                    // Hiển thị thông báo khi không có dữ liệu
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Không tìm thấy thông tin.');", true);
                    pnlUserInfo.Visible = false; // Ẩn khung thông tin nếu không có dữ liệu
                }
            }

            helper.closeConnection();
        }
    }
}