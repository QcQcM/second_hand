using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.DAL
{
    public class ReleaseDAO
    {
        private const String insertSql = "insert into t_release(category,prize,bargin,contact_info,img,description,new_level,user_id,goods_name,address) values (\" {0} \",{1},{2},\"{3}\",\"{4}\",\"{5}\",\"{6}\",\"{7}\",\"{8}\",\"{9}\")";
        public int insertRelease(String goodName, String goodImg, Double price, String address, String category, int bargin, String contact, String newLevel, String detail, String userID)
        {
            if (DatabaseTool.ExecSql(String.Format(insertSql, category, price, bargin, contact, goodImg, detail, newLevel, userID, goodName, address)))
                return 1;
            else
                return -1;
        }
    }
}