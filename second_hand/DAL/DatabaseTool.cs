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
        public static List<Dictionary<String, Object>> ExecSqlReturn(String sql) //返回查找结果集的
        {
            List<Dictionary<String, Object>> list = new List<Dictionary<String, Object>>();
            MySqlCommand command = new MySqlCommand(sql, GetSqlConnection());
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Dictionary<string, Object> keyValues = new Dictionary<string, Object>();
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    keyValues.Add(reader.GetName(i), reader.GetFieldValue<Object>(i));
                }
                list.Add(keyValues);
            }
            reader.Close();
            return list;
        }

    }
}