using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.DAL
{
    public class LoginDAO
    {
        private const String selectSql = "select * from user where user_id=\"{0}\" and password=\"{1}\" ";
        public int selectUser(String userID, String password)
        {
            if(DAL.DatabaseTool.ExcelSelectResult(String.Format(selectSql, userID, password)))
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }
    }
}