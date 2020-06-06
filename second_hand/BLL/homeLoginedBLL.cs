using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.BLL
{
    public class homeLoginedBLL
    {
        public List<Model.Release> selectGoodsByCategory(String Category)
        {
            DAL.homeLoginedDAO rd = new DAL.homeLoginedDAO();
            List<Model.Release> lst = rd.selectGoodsByCategory(Category);
            return lst;

        }
        public List<Model.Release> selectGoodsByName(String goodName)
        {
            DAL.homeLoginedDAO rd = new DAL.homeLoginedDAO();
            List<Model.Release> lst = rd.selectGoodsByName(goodName);
            return lst;
        }
        public List<Model.Release> selectAllGoods()
        {
            DAL.homeLoginedDAO rd = new DAL.homeLoginedDAO();
            List<Model.Release> lst = rd.selectGoodsRandom();
            return lst;
        }
        public int insertColl(String userID, String goodID)
        {
            DAL.homeLoginedDAO rd = new DAL.homeLoginedDAO();
            return rd.insertColl(userID, goodID);
        }
        public bool searchNotRead(String userID)
        {
            DAL.homeLoginedDAO rd = new DAL.homeLoginedDAO();
            return rd.searchNotRead(userID);
        }
    }
}