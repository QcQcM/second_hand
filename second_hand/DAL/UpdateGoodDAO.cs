using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.DAL
{
    public class UpdateGoodDAO
    {
        private static String selectByID = "select * from t_release where goods_id={0}";
        private static String updateSql = "update t_release set category = \"{0}\",prize={1},bargin={2},contact_info=\"{3}\",img=\"{4}\",description=\"{5}\",new_level=\"{6}\",goods_name=\"{7}\",address=\"{8}\" where goods_id={9}";
        public int updateGood(String category,Double prize,int bargin,String contact,String img,String description,String new_level,String goodsName,String address,int goodID )
        {
            //调用数据库语句，更新商品信息,没写呢
            if (DatabaseTool.ExecSql(String.Format(updateSql,category,prize,bargin,contact,img,description,new_level,goodsName,address,goodID)))
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }
        public List<Model.Release> selectGoodsByGoodID(int goodsID)
        {
            List<Dictionary<String, Object>> sqlResult = DatabaseTool.ExecSqlReturn(String.Format(selectByID, goodsID));
            List<Model.Release> release = new List<Model.Release>();
            if (sqlResult == null || sqlResult.Count < 1)
            {
                return release;
            }
            else
            {
                foreach (Dictionary<String, Object> dic in sqlResult)
                {
                    release.Add(Model.Release.createRelease(dic));
                }
                return release;
            }
        }
    }
}