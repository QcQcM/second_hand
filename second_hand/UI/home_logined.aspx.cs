using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace second_hand.UI
{
    public partial class home : System.Web.UI.Page
    {
        public List<Model.Release> lst = new List<Model.Release>();
        public bool notRead = false;
        protected void Page_Load(object sender, EventArgs e)
        {
                //如果不是第一次加载，说明用户点击了搜索种类链接或者是按名称搜索商品按钮
                 BLL.homeLoginedBLL hb = new BLL.homeLoginedBLL();
                 String userID = Session["user_id"].ToString();
                 notRead = hb.searchNotRead(userID);
                if (Request.QueryString["search_name"] != null)    
                {
                    //说明用户点击了按名称搜索商品按钮，模糊搜索
                    lst = hb.selectGoodsByName(Request.QueryString["search_name"].ToString());
                 }
                else if(Request.QueryString["search_category"] != null)
                {
                //说明用户按类别搜索
                    String search_category = Request.QueryString["search_category"].ToString();
                    lst = hb.selectGoodsByCategory(Request.QueryString["search_category"].ToString());
                }else if (Request.QueryString["save_good"] != null)
            {
                String saveGood = Request.QueryString["save_good"].ToString();
                if(hb.insertColl(userID, saveGood) == 1)
                {
                    Response.Write("<script language=javascript>window.alert('加入收藏成功！');</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>window.alert('不能重复加入收藏！');</script>");
                }
                lst = hb.selectAllGoods();
            }
            else
            {
                //如果是第一次加载，从数据库里任意检索出一些展示
                lst = hb.selectAllGoods();
            }
            
        }
    }
}