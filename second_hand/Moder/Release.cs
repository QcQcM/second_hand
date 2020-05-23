using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.Moder
{
    public class Release
    {
        public int goodsID { set; get; }    //商品id（数据库自动递增）
        public String category { set; get; }        //商品所属类别
        public double prize { set; get; }   //价格
        public int bargin { set; get; }     //是否接受议价，为不接受，为接受
        public String contactInfo { set; get; }     //联系方式，可以为空
        public String img { set; get; }     //商品图片
        public String description { set; get; }     //商品描述
        public String newLevel { set; get; }        //新旧程度
        public String userID { set; get; }      //用户id
        public String goodsName { set; get; }       //商品名称
    }
}