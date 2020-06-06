using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.DAL
{
    public class homeLoginedDAO
    {
        private const String selectByCategory = "select * from t_release where category='{0}'";
        private const String selcetByKeywords = "select * from t_release where goods_name LIKE '%{0}%\'";
        private const String selectAll = "select * from t_release";
        private const String insertCollection = "insert into t_collection(user_id,goods_id) values (\"{0}\",\"{1}\")";
        private const String selectCollection = "select * from t_collection where user_id = \"{0}\" and goods_id = \"{1}\"";
        private const String selectNotRead = "select * from chat_record where receive_id = \"{0}\" and is_read = 0";
        public List<Model.Release> selectGoodsByCategory(String Category)
        {
            String sql = String.Format(selectByCategory, Category);
            List<Dictionary<String, Object>> sqlResult = DatabaseTool.ExecSqlReturn(sql);
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
        public int insertColl(String userID,String goodID)
        {
            if (DatabaseTool.ExcelSelectResult(String.Format(selectCollection, userID, goodID)))
            {
                return -1;
            }
            else if (DatabaseTool.ExecSql(String.Format(insertCollection, userID, goodID)))
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }
        public bool searchNotRead(String userID)
        {
            return DatabaseTool.ExcelSelectResult(String.Format(selectNotRead, userID));
        }
    }
}