using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.BLL
{
    public class RegisterBLL
    {
        public static bool telephoneExist = false;
        public static bool userIDExist = false;
        public int userRegister(String phoneNum,String name, String school, String campus, String college, String password, String userID )
        {
            DAL.RegisterDAO rgstd = new DAL.RegisterDAO();
            if (rgstd.insertUser(phoneNum, name, school, campus, college, password, userID) != -1)
                return 1;
            else
                return -1;
        }
        public int selectUserByTelep(String telephone)
        {
            DAL.RegisterDAO rgstd = new DAL.RegisterDAO();
            if (rgstd.selectUser(telephone, "phone_num") == 1) 
                return 1;
            else
                return -1;
        }
        public int selectUserByID(String userID)
        {
            DAL.RegisterDAO rgstd = new DAL.RegisterDAO();
            if (rgstd.selectUser(userID, "user_id") == 1)
                return 1;
            else
                return -1;
        }
    }
}