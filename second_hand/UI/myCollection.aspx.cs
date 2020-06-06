using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace second_hand.UI
{
    public partial class myCollection : System.Web.UI.Page
    {
        public List<Model.Release> lst = new List<Model.Release>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BLL.myCollectionBLL mcb = new BLL.myCollectionBLL();
            //页面加载时从数据库检索出该用户已发布的商品信息
            String userID = Session["user_id"].ToString();
            lst = mcb.selecMyCollection(userID);
        }
    }
}