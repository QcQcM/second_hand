using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace second_hand.UI
{
    public partial class updateGood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String goodsID = Request.QueryString["goods_id"].ToString();
            //传递过来要修改的商品id，先把信息从数据库里查出来显示出来
            BLL.UpdateGoodBLL ugb = new BLL.UpdateGoodBLL();
            List<Model.Release> lst = new List<Model.Release>();
            lst = ugb.selectGoodsByGoodID(goodsID);
            title.Value = lst[0].goodsName;
            price.Value = lst[0].prize.ToString();
            address.Value = lst[0].address;
            //这句这样指定有些问题，需要再改一下
            type.Value = lst[0].category;
            if (lst[0].bargin == 1)
            {
                //接收议价
                RadioButton1.Checked = true;
                RadioButton2.Checked = false;
            }else
            {
                //不接收议价
                RadioButton2.Checked = true;
                RadioButton1.Checked = false;
            }
            tel.Value = lst[0].contactInfo;
            new_level.Value = lst[0].newLevel;
            detail.Value = lst[0].description;
        }
        public void SaveFile(HttpPostedFile file)
        {
            string savePath = Server.MapPath(".") + "//Uploads//";
            string fileName = fileUpLoadPic.FileName;
            string pathToCheck = savePath + fileName;
            string tempfilename = "";
            if (System.IO.File.Exists(pathToCheck))
            {
                int counter = 2;
                while (System.IO.File.Exists(pathToCheck))
                {
                    tempfilename = counter.ToString() + fileName;
                    pathToCheck = savePath + tempfilename;
                    release.count = counter;
                    counter++;
                }
                fileName = tempfilename;
                Response.Write("<script>alert('你上传了两个相同文件！')</script>");
            }else
            {
                release.count = 0;
            }
            savePath += fileName;
            fileUpLoadPic.SaveAs(savePath);
        }

        protected void release_Button_Click(object sender, EventArgs e)
        {
            if (fileUpLoadPic.HasFile) //文件存在
            {
                SaveFile(fileUpLoadPic.PostedFile);//保存上传文件
            }
            else
            {
                Response.Write("<script>alert('上传文件不存在！')</script>");
            }
            if (fileUpLoadPic.PostedFile.FileName == "")  //文件名字
            {
                Response.Write("<script>alert('你还没有选择图片！')</script>");
            }
            else {
                string filepath = fileUpLoadPic.PostedFile.FileName;
                string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);//第一个\转义字符
                Session["filename"] = filename;
                string fileEx = filepath.Substring(filepath.LastIndexOf(".") + 1);//从.开始截至最后得到图片格式.jpg。。。
                string serverpath = Server.MapPath(".") + "//Uploads//" + filename;
                if (fileEx == "jpg" || fileEx == "bmp" || fileEx == "gif")
                {
                    //String goodsID = Request.QueryString["goods_id"].ToString();
                    //这句等蒋晓松的页面写完再取消注释
                    String goodsID = "3";
                    BLL.UpdateGoodBLL ugb = new BLL.UpdateGoodBLL();
                    String goodName = Request["title"];
                    String goodImg;
                    if (release.count > 1)
                    {
                        goodImg = release.count.ToString() + filename;
                    }
                    else
                    {
                        goodImg = filename;
                    }
                    Double prize = Convert.ToDouble(Request["price"]);
                    String address = Request["address"];
                    //select控件获取的文字自带一个空格，需要去空格
                    String category = Request["type"].ToString().Trim();
                    int bargin;
                    if (RadioButton1.Checked)
                        bargin = 1;
                    else
                        bargin = 0;
                    String contact = Request["tel"];
                    String newLevel = Request["new_level"];
                    String detail = Request["detail"];
                    if (ugb.updateGood(category, prize, bargin, contact, goodImg, detail, newLevel, goodName, address, goodsID) == 1)
                    {
                        Response.Write("<script>alert('成功修改商品信息！')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('修改失败，请重试！')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('商品图片格式有问题，请重新选择！')</script>");
                }
                
            }
            
        }
    }
}