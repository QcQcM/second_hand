using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.DAL
{
    public class myCollectionDAO
    {
        private const String selectSql = "select * from t_release where goods_id in (select goods_id from t_collection where user_id=\"{0}\")";
        public List<Model.Release> selecMyCollection(String userID)
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
    }
}