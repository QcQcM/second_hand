using System;
using System.Collections.Generic;
using System.Web;
using MySql.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace second_hand.DAL
{
    public class RegisterDAO
    {
       private const String insertSql = "insert into user(phone_num, name, school, campus, college, password, id_num, is_real, user_id) values (\" {0} \",\"{1}\",\"{2}\",\"{3}\",\"{4}\",\"{5}\",1,0,\"{6}\")";
        private const String selectSql = "select * from user where {0} =\"{1}\"";
        public int insertUser(String phoneNum, String name, String school, String campus, String college, String password, String userID)
        {
            if (DatabaseTool.ExecSql(String.Format(insertSql,phoneNum,name,school,campus,college,password,userID)))
                return -1;
            else
                return 1;
        }
        public int selectUser(String value, String fieldName)
        {
            Console.WriteLine(String.Format(fieldName, value));
            if (DatabaseTool.ExcelSelectResult(String.Format(selectSql,fieldName, value)))  //如果查询到，返回1，否则返回-1
                return 1;
            else
                return -1; 
        }
    }
}