using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.BLL
{
    public class ReleaseBLL
    {
        public int releaseGood(String goodName, String goodImg, Double price, String address, String category, int bargin, String contact, String newLevel, String detail, String userID)
        {
            DAL.ReleaseDAO red = new DAL.ReleaseDAO();
            if(red.insertRelease(goodName, goodImg, price, address, category, bargin, contact, newLevel, detail, userID) == 1)
            {
                return 1;
            }else
            {
                return -1;
            }
        }
    }
}