using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace second_hand.UI
{
    public partial class myGood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BLL.myGoodBLL mgb = new BLL.myGoodBLL();
            if (IsPostBack)
            {
                //如果页面不是首次加载，说明传递了要删除的商品id
                String deleteGoodID = Request.QueryString["delete_id"];
                if (mgb.deleteGood(deleteGoodID) == 1)
                {
                    Response.Write("<script>alert('已成功下架该商品！')</script>");
                }
                else
                {
                    Response.Write("<script>alert('商品下架失败，请重试！')</script>");
                }
            }
            //页面加载时从数据库检索出该用户已发布的商品信息
            String userID = Session["user_id"].ToString();
            List<Model.Release> lst = new List<Model.Release>();
            lst = mgb.selectMyGood(userID);
        }
    }
}