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
    public partial class BookType : System.Web.UI.Page
    {

        private DatabaseHelper helper = new DatabaseHelper();

        private string typeOfList = "pendding";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView("");
                if (WishList.Rows.Count == 0)
                    lblResult.Text = "Danh sách đơn đăng ký chờ phê duyệt trống!";
            }
        }


        protected void WishList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Lấy giá trị từ DataRow
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                string columnValue = rowView["status"].ToString();

                // Tìm điều khiển LinkButton trong hàng hiện tại
                LinkButton acceptButton = (LinkButton)e.Row.FindControl("AcceptButton");
                LinkButton selectButton = (LinkButton)e.Row.FindControl("SelectButton");

                // Kiểm tra giá trị và bật/tắt LinkButton
                if (columnValue == "Đã duyệt") // Điều kiện bạn muốn kiểm tra
                {
                    acceptButton.Visible = false;
                }
                else if(columnValue == "Từ chối")
                {
                    selectButton.Visible = false;
                }
            }
        }

        private void BindGridView(string name)
        {
            helper.openConnection();
            DataSet dataSet = new DataSet();
            SqlCommand cmd;
            if (string.IsNullOrEmpty(name.Trim()))
            {
                cmd = helper.CreateCommand(
                    "select * from wish_tbl order by status, createAt"
                );
            }
            else
            {
                cmd = helper.CreateCommand(
                    "select * from wish_tbl where studentName like @name or studentCode like @name order by status, createAt"
                );
                cmd.Parameters.AddWithValue("@name", "%" + name + "%");
            }

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dataSet);

            DataTable dataTable = dataSet.Tables[0];

            // Thay đổi giá trị trong DataTable trước khi gán cho GridView
            foreach (DataRow row in dataTable.Rows)
            {
                if (row["status"].ToString().Equals("accept"))
                {
                    row["status"] = "Đã duyệt";
                } else if(row["status"].ToString().Equals("refuse"))
                {
                    row["status"] = "Từ chối";
                } else
                {
                    row["status"] = "Chờ duyệt";
                }
            }

            WishList.DataSource = dataSet;
            WishList.DataBind();
            helper.closeConnection();
        }

        protected void WishList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            WishList.EditIndex = e.NewEditIndex;
            BindGridView("");
        }

        protected void WishList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Retrieve the updated value
            GridViewRow row = WishList.Rows[e.RowIndex];
            int id = (int)WishList.DataKeys[e.RowIndex].Values["wishId"];
            string studentName = row.Cells[0].Text;
            string description = ((TextBox)row.FindControl("txtDescription")).Text;

            // Update the data source with the new description value
            // Your data access logic to update the database goes here
            helper.openConnection();
            DataSet dataSet = new DataSet();
            SqlCommand cmd = helper.CreateCommand(
                "update wish_tbl " +
                "set description = @description, status = @status " +
                "where wishId = @wishId"
            );

            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@wishId", id);
            cmd.Parameters.AddWithValue("@status", "refuse");

            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                lblResult.Text = "Bạn vừa từ chối đơn đăng ký của " + studentName;
                WishList.EditIndex = -1;
                BindGridView("");
            }
            catch (Exception ex)
            {
                lblResult.Text = "Error: " + ex.Message;
            }
            finally { helper.closeConnection(); }
        }

        protected void WishList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            WishList.EditIndex = -1;
            BindGridView("");
        }

        protected void WishList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = WishList.SelectedRow;
            int id = Convert.ToInt32(WishList.DataKeys[gridViewRow.RowIndex].Value);
            string studentName = gridViewRow.Cells[0].Text;

            // Update the data source with the new description value
            // Your data access logic to update the database goes here
            helper.openConnection();
            SqlCommand cmd = helper.CreateCommand(
                "update wish_tbl " +
                "set status = @status " +
                "where wishId = @wishId"
            );

            cmd.Parameters.AddWithValue("@wishId", id);
            cmd.Parameters.AddWithValue("@status", "accept");

            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                lblResult.Text = "Bạn vừa chấp nhận đơn đăng ký của " + studentName;
                WishList.EditIndex = -1;
                BindGridView("");

                if (WishList.Rows.Count == 0)
                    lblResult.Text = "Danh sách đơn đăng ký chờ phê duyệt đã trống!";
            }
            catch (Exception ex)
            {
                lblResult.Text = "Error: " + ex.Message;
            }
            finally { helper.closeConnection(); }
        }

        protected void SearchBookBtn_Click(object sender, EventArgs e)
        {
            string searchText = txtSearchWish.Value.Trim();
            BindGridView(searchText);
        }

        protected void ddlSortByDate_SelectedIndexChanged(object sender, EventArgs e)
        {   
            // Lấy giá trị đã chọn từ dropdown list
            string selectedValue = ddlSortByDate.SelectedValue;
            String derection = "";
            // Xử lý dữ liệu dựa trên giá trị được chọn
            if (selectedValue == "newest")
            {
                // Sắp xếp dữ liệu theo ngày đăng ký mới nhất
                derection = "DESC";
            }
            else if (selectedValue == "oldest")
            {
                // Sắp xếp dữ liệu theo ngày đăng ký cũ nhất
                derection = "ASC";
            }

            helper.openConnection();
            DataSet dataSet = new DataSet();
            SqlCommand cmd;
            cmd = helper.CreateCommand(
                "select * from wish_tbl order by status ASC, createAt " + derection
            );

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dataSet);

            DataTable dataTable = dataSet.Tables[0];

            // Thay đổi giá trị trong DataTable trước khi gán cho GridView
            foreach (DataRow row in dataTable.Rows)
            {
                if (row["status"].ToString().Equals("accept"))
                {
                    row["status"] = "Đã duyệt";
                }
                else if (row["status"].ToString().Equals("refuse"))
                {
                    row["status"] = "Từ chối";
                }
                else
                {
                    row["status"] = "Chờ duyệt";
                }
            }

            WishList.DataSource = dataSet;
            WishList.DataBind();
            helper.closeConnection();
        }
    }
}