using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace second_hand.UI
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_Button_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                String phoneNum = Request["telephone_num"];
                String userID = Request["user_id"];
                String realName = name.Text.Trim();
                String userSchool = Request["school"];
                String userCollege = college.Text.Trim();
                String userCampus = campus.Text.Trim();
                String userPassword = password1.Text.Trim();
                BLL.RegisterBLL rstb = new BLL.RegisterBLL(); 
                if(phoneNum == "")
                    Response.Write("<script language=javascript>window.alert('手机号不能为空！');</script>");
                else if(userID == "")
                    Response.Write("<script language=javascript>window.alert('用户名不能为空！');</script>");
                else if (BLL.RegisterBLL.telephoneExist)
                {
                    Response.Write("<script language=javascript>window.alert('手机号已注册，请更改！');</script>");
                } else if(BLL.RegisterBLL.userIDExist)
                {
                    Response.Write("<script language=javascript>window.alert('该ID已存在，请更改！');</script>");
                }  else if (rstb.userRegister(phoneNum, realName, userSchool, userCampus, userCollege, userPassword, userID) != -1)
                {
                    Response.Write("<script language=javascript>window.alert('注册成功！');</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>window.alert('注册失败！');</script>");
                }
            }
            

        }

        protected void send_code_Button_Click(object sender, EventArgs e)
        {

        }
    }
}