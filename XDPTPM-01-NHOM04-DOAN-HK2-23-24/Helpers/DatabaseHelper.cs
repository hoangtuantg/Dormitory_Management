using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace XDPTPM_01_NHOM04_DOAN_HK2_23_24.Helpers
{
    public class DatabaseHelper
    {
        private SqlConnection sqlConnection;

        public DatabaseHelper() {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            sqlConnection = new SqlConnection(connectionString);
        }

        public void openConnection()
        {
            if(sqlConnection.State == ConnectionState.Closed)
            {
                sqlConnection.Open();
            }
        }

        public void closeConnection() {
            if (sqlConnection.State == ConnectionState.Open)
            {
                sqlConnection.Close();
            }
        }

        public SqlCommand CreateCommand(string query)
        {
            SqlCommand cmd = new SqlCommand(query, sqlConnection);
            return cmd;
        }
    }
}