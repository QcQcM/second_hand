using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.BLL
{
    public class chattingBLL
    {
        public List<String> selectChatUsers(String userID)
        {
            DAL.chattingDAO ctd = new DAL.chattingDAO();
            return ctd.selectChatUsers(userID);
        }
        public Model.Chat selectRecentMessage(String myID,String otherID)
        {
            DAL.chattingDAO ctd = new DAL.chattingDAO();
            return ctd.selectRecentMessage(myID, otherID);
        }
        public List<Model.Chat> selectMessage(String myID,String otherID)
        {
            DAL.chattingDAO ctd = new DAL.chattingDAO();
            return ctd.selectAllMessage(myID, otherID);
        }
        public int addMessage(String myID, String otherID,String content)
        {
            DAL.chattingDAO ctd = new DAL.chattingDAO();
            return ctd.sendMessage(myID, otherID, content);
        }
        public String selectNewMessage(String myID, String otherID, DateTime lastTime)
        {
            DAL.chattingDAO ctd = new DAL.chattingDAO();
            return ctd.selectNewMessage(myID, otherID, lastTime);
        }
        public int updateRead(String myID, String otherID)
        {
            DAL.chattingDAO ctd = new DAL.chattingDAO();
            return ctd.updateRead(myID, otherID);
        }
    }
}