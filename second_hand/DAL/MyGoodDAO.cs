using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.DAL
{
    public class MyGoodDAO
    {
        private const String selectSql = "select * from t_release where user_id=\"{0}\"";
        private const String deleteSql = "delete from t_release where goods_id={0}";
        public List<Model.Release> selectGoodByUser(String userID)
        {
            List<Dictionary<String, Object>> sqlResult = DatabaseTool.ExecSqlReturn(String.Format(selectSql, userID));
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
        public int deleteGood(int goodID)
        {
            if (DatabaseTool.ExecSql(String.Format(deleteSql, goodID))){
                return 1;
            }
            else
            {
                return -1;
            }
        }
    }
}