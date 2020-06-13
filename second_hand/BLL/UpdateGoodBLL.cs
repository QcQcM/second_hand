using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.BLL
{
    public class UpdateGoodBLL
    {
        public int updateGood(String category, Double prize, int bargin, String contact, String img, String description, String new_level, String goodsName, String address, String goodsID)
        {
            int goodID = Convert.ToInt32(goodsID);
            DAL.UpdateGoodDAO ugd = new DAL.UpdateGoodDAO();
            if(ugd.updateGood(category, prize, bargin, contact, img, description, new_level, goodsName, address, goodID) == -1)
            {
                return -1;
            }
            else
            {
                return 1;
            }

        }
        public int updateGoodNotPic(String category, Double prize, int bargin, String contact, String description, String new_level, String goodsName, String address, String goodsID)
        {
            int goodID = Convert.ToInt32(goodsID);
            DAL.UpdateGoodDAO ugd = new DAL.UpdateGoodDAO();
            if (ugd.updateGoodNotPic(category, prize, bargin, contact,description, new_level, goodsName, address, goodID) == -1)
            {
                return -1;
            }
            else
            {
                return 1;
            }

        }
        public List<Model.Release> selectGoodsByGoodID(String goodsID)
        {
            DAL.UpdateGoodDAO ugd = new DAL.UpdateGoodDAO();
            int goodID = Convert.ToInt32(goodsID);
            List<Model.Release> lst = new List<Model.Release>();
            lst = ugd.selectGoodsByGoodID(goodID);
            return lst;
        }
    }
}