using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.UI
{
    /// <summary>
    /// Summary description for AjaxSendMessage
    /// </summary>
    public class AjaxSendMessage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            BLL.chattingBLL ctb = new BLL.chattingBLL();
            String myID = context.Request.Params["myID"];
            String otherID = context.Request.Params["chatPersonID"];
            String content = context.Request.Params["mess_content"];
            if (ctb.addMessage(myID, otherID, content) == 1)
            {
                context.Response.Write("发送成功");
            }
            else
            {
                context.Response.Write("发送失败");
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