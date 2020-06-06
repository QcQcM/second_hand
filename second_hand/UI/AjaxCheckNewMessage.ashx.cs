using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.UI
{
    /// <summary>
    /// Summary description for checkNewMessage
    /// </summary>
    public class checkNewMessage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String myID = context.Request.Params["myID"];
            String nowChat = context.Request.Params["chatPersonID"];
            DateTime lastTime = Convert.ToDateTime(context.Request.Params["lastTime"].ToString());
            BLL.chattingBLL bl = new BLL.chattingBLL();
            if (bl.selectNewMessage(myID,nowChat,lastTime)==null)
            {
                context.Response.Write("没有新消息略略略");
            }
            else
            {
                context.Response.Write(bl.selectNewMessage(myID, nowChat, lastTime));
                BLL.chattingBLL ctb = new BLL.chattingBLL();
                ctb.updateRead(myID, nowChat);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}