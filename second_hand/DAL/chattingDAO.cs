using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.DAL
{
    public class chattingDAO
    {
        private static String selectSendUser = "select send_id from chat_record where receive_id=\"{0}\"";
        private static String selectReceiveUser = "select receive_id from chat_record where send_id= \"{0}\"";
        private static String selectMessage = "select* from chat_record where send_time=(select MIN(send_time) where send_id=\"{0}\" and receive_id=\"{1}\" and is_read=0) ";
        private static String selectAllMessages = "select* from chat_record where (receive_id=\"{0}\" and send_id= \"{1}\") or (receive_id=\"{2}\" and send_id= \"{3}\")";
        private static String addMessage = "insert into chat_record(send_id,receive_id,send_time,content,is_read) values(\"{0}\",\"{1}\",\"{2}\",\"{3}\",{4})";
        private static String selectNew = "select * from chat_record where receive_id = \"{0}\" and send_id = \"{1}\" and send_time > \"{2}\"";
        private static String setRead = "update chat_record set is_read=1 where receive_id = \"{0}\" and send_id=\"{1}\"";
        public List<String> selectChatUsers(String userID)
        {
            List<String> usersID1 = new List<string>();
            List<String> usersID2 = new List<string>();
            usersID1 = DatabaseTool.ExecSqlReturnItem(String.Format(selectSendUser, userID), "send_id");
            usersID2 = DatabaseTool.ExecSqlReturnItem(String.Format(selectReceiveUser, userID), "receive_id");
            List<String> result = usersID1.Union(usersID2).ToList<String>();
            return result;
        }
        public Model.Chat selectRecentMessage(String myID, String otherID)
        {
            List<Dictionary<String, Object>> sqlResult = DatabaseTool.ExecSqlReturn(String.Format(selectMessage,otherID,myID));
            Model.Chat chat = new Model.Chat();
            if (sqlResult == null || sqlResult.Count < 1)
            {
                //如果没找到和这个人的聊天记录，说明这个人可能是该用户在首页点击的chat_id
                return null;
            }
            else
            {
                return Model.Chat.createChat(sqlResult[0]);
            }
        }
        public List<Model.Chat>  selectAllMessage(String myID, String otherID)
        {
            List<Dictionary<String, Object>> sqlResult = DatabaseTool.ExecSqlReturn(String.Format(selectAllMessages, myID, otherID, otherID, myID));
            List<Model.Chat> message = new List<Model.Chat>();
            if (sqlResult == null || sqlResult.Count < 1)
            {
                //如果没找到和这个人的聊天记录，说明这个人可能是该用户在首页点击的chat_id
                return null;
            }
            else
            {
                foreach(Dictionary < String, Object > dic in sqlResult)
                {
                    message.Add(Model.Chat.createChat(dic));
                }
                return message;
            }
        }
        public int sendMessage(String myID, String otherID, String content)
        {
            if(DatabaseTool.ExecSql(String.Format(addMessage,myID,otherID,DateTime.Now,content,0)))
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }
        public String selectNewMessage(String myID, String otherID, DateTime lastTime)
        {
            List<Dictionary<String, Object>> sqlResult = DatabaseTool.ExecSqlReturn(String.Format(selectNew, myID, otherID, lastTime));
            Model.Chat chat = new Model.Chat();
            if (sqlResult == null || sqlResult.Count < 1)
            {
                //如果没找到和这个人的聊天记录，说明这个人可能是该用户在首页点击的chat_id
                return null;
            }
            else
            {
               chat =  Model.Chat.createChat(sqlResult[0]);
                return chat.content;
            }
        }
        public int updateRead(String myID, String otherID)
        {
            if (DatabaseTool.ExecSql(String.Format(setRead, myID, otherID))){
                return 1;
            }
            else
            {
                return -1;
            }
        }
    }
}