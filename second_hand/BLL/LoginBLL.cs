using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.BLL
{
    public class LoginBLL
    {
        public int userLogin(String userID, String password)
        {
            DAL.LoginDAO ld = new DAL.LoginDAO();
            if(ld.selectUser(userID, password) == 1)
            {
                return 1;
            }else
            {
                return -1;
            }
        }
    }
}