using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.Model
{
    public class Chat
    {
        public String sendId { set; get; }      //发送者用户id
        public String receiveId { set; get; }   //接收者用户id
        public DateTime sendTime { set; get; }      //发送时间
        public String content { set; get; }     //消息内容
        public int isRead { set; get; } //该消息是否已读，已读为1，否则为0
        public static Chat createChat(Dictionary<String, Object> dic)
        {
            Chat chat = new Chat();
            chat.content = (String)dic["content"];
            chat.isRead = (int)dic["is_read"];
            chat.receiveId = (String)dic["receive_id"];
            chat.sendId = (String)dic["send_id"];
            chat.sendTime = (DateTime)dic["send_time"];
            return chat;
        }
    }
}