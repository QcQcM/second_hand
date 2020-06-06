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
        public static MySqlConnection GetSqlConnection()
        {
                String str = "Server=localhost;Database=second_hand;User ID=root;PWD=123456";
                MySqlConnection sqlConnection = new MySqlConnection(str);
                sqlConnection.Open();
                return sqlConnection;
        }
        public static bool ExecSql(String sql)
        {
            MySqlConnection conn = DatabaseTool.GetSqlConnection();
            MySqlCommand command = new MySqlCommand(sql, conn);
            if (command.ExecuteNonQuery() > 0)
            {
                conn.Close();
                return true;  
            }else
            {
                conn.Close();
                return false;
            }
        }
        public static bool ExcelSelectResult(String sql)    //查询到返回true,查询不到返回false
        {
            MySqlConnection conn = DatabaseTool.GetSqlConnection();
            MySqlDataAdapter da = new MySqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                conn.Close();
                return false;
            }

            else
            {
                conn.Close();
                return true;
            }
                

        }
        public static List<Dictionary<String, Object>> ExecSqlReturn(String sql) //返回查找结果集的
        {
            List<Dictionary<String, Object>> list = new List<Dictionary<String, Object>>();
            MySqlConnection conn = DatabaseTool.GetSqlConnection();
            MySqlCommand command = new MySqlCommand(sql, conn);
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
            conn.Close();
            return list;
        }
        public static List<String> ExecSqlReturnItem(String sql, String item)   //返回查找结果集中的某个字段的值，以list形式返回
        {
            MySqlConnection conn = DatabaseTool.GetSqlConnection();
            MySqlCommand command = new MySqlCommand(sql, conn);
            MySqlDataReader reader = command.ExecuteReader();
            List<String> lst = new List<string>();
            while (reader.Read())
            {
                lst.Add(reader[item].ToString());
            }
            conn.Close();
            reader.Close();
            return lst;
        }
    }
}