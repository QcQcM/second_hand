using System;
using System.Collections.Generic;
using System.Web;
using MySql.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace second_hand.DAL
{
    public class DatabaseTool
    {
        public static MySqlConnection sqlConnection;
        public static MySqlConnection GetSqlConnection()
        {
            if (sqlConnection == null || sqlConnection.State == System.Data.ConnectionState.Closed)
            {
                String str = "Server=localhost;Database=second_hand;User ID=root;PWD=123456";
                sqlConnection = new MySqlConnection(str);
                sqlConnection.Open();
            }
            return sqlConnection;
        }
        public static bool ExecSql(String sql)
        {
            MySqlCommand command = new MySqlCommand(sql, GetSqlConnection());
            return command.ExecuteNonQuery() > 0 ? true : false;
        }
        public static bool ExcelSelectResult(String sql)    //查询到返回true,查询不到返回false
        {
            MySqlDataAdapter da = new MySqlDataAdapter(sql, GetSqlConnection());
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
                return false;
            else
                return true;

        }
    }
}