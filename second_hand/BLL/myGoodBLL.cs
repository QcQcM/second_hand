using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.BLL
{
    public class myGoodBLL
    {
        public List<Model.Release> selectMyGood(String userID)
        {
            DAL.MyGoodDAO mgd = new DAL.MyGoodDAO();
            List<Model.Release> lst = new List<Model.Release>();
            lst = mgd.selectGoodByUser(userID);
            return lst;
        }
        public int deleteGood(String goodsID)
        {
            DAL.MyGoodDAO mgd = new DAL.MyGoodDAO();
            int goodID = Convert.ToInt32(goodsID);
            if(mgd.deleteGood(goodID) == 1)
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