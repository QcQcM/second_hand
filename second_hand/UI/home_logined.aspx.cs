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
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Model.Release> lst = new List<Model.Release>();
            if (IsPostBack)
            {
                //如果不是第一次加载，说明用户点击了搜索种类链接或者是按名称搜索商品按钮
                String category = Request.QueryString["search_category"];
                String goodName = Request.QueryString["search_name"];
                if (category == null)    
                {
                    //说明用户点击了按名称搜索商品按钮
                    BLL.homeLoginedBLL hb = new BLL.homeLoginedBLL();
                    lst = hb.selectGoodsByCategory(category);
                }
                else
                {
                    //说明用户按类别搜索
                    BLL.homeLoginedBLL hb = new BLL.homeLoginedBLL();
                    lst = hb.selectGoodsByName(goodName);
                }          
            }
            else
            {
                //如果是第一次加载，从数据库里任意检索出一些展示
                BLL.homeLoginedBLL hb = new BLL.homeLoginedBLL();
                lst = hb.selectAllGoods();
            }
        }

        protected void serach_button_Click(object sender, EventArgs e)
        {
            String goodName = Request["keywords"];
            Response.Redirect("home_logined.aspx?category=&goodName=" + goodName);
        }
    }
}