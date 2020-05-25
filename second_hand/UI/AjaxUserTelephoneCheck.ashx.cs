using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.UI
{
    /// <summary>
    /// Summary description for AjaxUserTelephoneCheck
    /// </summary>
    public class AjaxUserTelephoneCheck : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            BLL.RegisterBLL rb = new BLL.RegisterBLL();
            if (rb.selectUserByTelep(context.Request.QueryString["telephone"]) == -1)
            {
                context.Response.Write("此手机号首次注册，可使用");
                BLL.RegisterBLL.telephoneExist = false;
            }
                
            else
            {
                context.Response.Write("此手机号已被注册，请更换");
                BLL.RegisterBLL.telephoneExist = true;
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