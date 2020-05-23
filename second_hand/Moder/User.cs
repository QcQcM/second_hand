using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.Moder
{
    public class User
    {
        public String phoneNum { set; get; }        //电话号码
        public String name { set; get; }        //真实姓名
        public String school { set; get; }      //学校
        public String campus { set; get; }      //校区
        public String college { set; get; }     //学院
        public String password { set; get; }        //密码
        public int idNum { set; get; }      //身份码，区别用户和管理员
        public int isReal { set; get; }     //是否已实名
        public String userId { set; get; }      //用户id，不可重复
        public String stuImg1 { set; get; }     //学生证或一卡通正面照
        public String stuImg2 { set; get; }     //学生证或一卡通背面照
    }
}