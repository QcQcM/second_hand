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
    }
}