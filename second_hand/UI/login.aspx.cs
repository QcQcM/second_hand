using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace second_hand.UI
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_button_Click(object sender, EventArgs e)
        {
            String userID = Request["user_id"];
            String password = Request["password"];
            BLL.LoginBLL lb = new BLL.LoginBLL();
            if(lb.userLogin(userID, password) == 1)
            {
                //保存用户名到session
                Session["user_id"] = userID;
                Response.Write("<script language=javascript>window.alert('登录成功！');</script>");
                //跳转到登录后的首页
                Response.Redirect("home_logined.aspx");
            }
            else
            {
                Response.Write("<script language=javascript>window.alert('用户名或密码错误！');</script>");
            }

        }
    }
}