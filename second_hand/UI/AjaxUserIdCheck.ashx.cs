using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.UI
{
    /// <summary>
    /// Summary description for AjaxUserIdCheck
    /// </summary>
    public class AjaxUserIdCheck : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            BLL.RegisterBLL rb = new BLL.RegisterBLL();
            if (rb.selectUserByID(context.Request.QueryString["userName"]) == -1)
            {
                context.Response.Write("此ID可用");
                BLL.RegisterBLL.userIDExist = false;
            }
                
            else
            {
                context.Response.Write("此ID已被注册，请更改");
                BLL.RegisterBLL.userIDExist = true;
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