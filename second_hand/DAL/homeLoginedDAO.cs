using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.DAL
{
    public class homeLoginedDAO
    {
        private const String selectByCategory = "select * from t_release where category=\"{0}\"";
        private const String selcetByKeywords = "selcet * from t_release where goods_name like '%{0}%'";
        private const String selectAll = "select * from t_release";
        public List<Model.Release> selectGoodsByCategory(String Category)
        {
            List<Dictionary<String, Object>> sqlResult = DatabaseTool.ExecSqlReturn(String.Format(selectByCategory, Category));
            List<Model.Release> release = new List<Model.Release>();
            if(sqlResult == null || sqlResult.Count < 1)
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
        public List<Model.Release> selectGoodsByName(String goodName)
        {
            List<Dictionary<String, Object>> sqlResult = DatabaseTool.ExecSqlReturn(String.Format(selcetByKeywords, goodName));
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
        public List<Model.Release> selectGoodsRandom()
        {
            List<Dictionary<String, Object>> sqlResult = DatabaseTool.ExecSqlReturn(selectAll);
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