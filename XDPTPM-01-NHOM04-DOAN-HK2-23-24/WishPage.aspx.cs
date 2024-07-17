using System;
using System.Collections.Generic;
using System.ComponentModel.Design.Serialization;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Claims;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin;
using XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24
{
    public partial class WishPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearFields();
            }
        }

        private DatabaseHelper helper = new DatabaseHelper();
        private void ClearFields()
        {
            studentCode.Value = "";
            numIdentify.Value = "";
            studentName.Value = "";
            major.Value = "";
            Class.Value = "";
            reason.Value = "";
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                {
                    
                    string Studentcode = studentCode.Value.Trim();
                    string NumIdentify = numIdentify.Value.Trim();
                    string Studentname = studentName.Value.Trim();
                    string Major = major.Value.Trim();
                    string Class_ = Class.Value.Trim();
                    string Reason = reason.Value.Trim();

                    string Query = null;
                    if (Studentcode == "")
                    {
                        Query = "INSERT INTO wish_tbl (studentName, numIdentify, createAt, major, class, reason) " +
                                  "VALUES (@StudentName, @NumIdentify, @CreateAt, @Major, @Class, @Reason)";
                    }
                    else
                    {
                        Query = "INSERT INTO wish_tbl (studentName, numIdentify, createAt, studentCode, major, class, reason) " +
                                  "VALUES (@StudentName, @NumIdentify, @CreateAt, @StudentCode, @Major, @Class, @Reason)";
                    }

                    helper.openConnection();
                    using (SqlCommand cmd = helper.CreateCommand(Query))
                    {
                        cmd.Parameters.AddWithValue("@StudentName", Studentname);
                        cmd.Parameters.AddWithValue("@NumIdentify", NumIdentify);
                        if(Studentcode != "")
                        {
                            cmd.Parameters.AddWithValue("@StudentCode", Studentcode);
                        }
                        cmd.Parameters.AddWithValue("@CreateAt", DateTime.Now);
                        cmd.Parameters.AddWithValue("@Major", Major);
                        cmd.Parameters.AddWithValue("@Class", Class_);
                        cmd.Parameters.AddWithValue("@Reason", Reason);
                        
                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            ErrMsg.Text = "Đã đăng kí thành công!";
                            ClearFields();
                        }
                        else
                        {
                            ErrMsg.Text = "Lỗi khi đăng kí. Vui lòng thử lại!";
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
    }
}