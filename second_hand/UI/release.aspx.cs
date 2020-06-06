using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace second_hand.UI
{
    public partial class release : System.Web.UI.Page
    {
        public static int count = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user_id"] == null)
            {
                Response.Write("<script>alert('需要登录才能发布商品！')</script>");
                Response.Redirect("home_unlogined.aspx");
            }
        }
            public void SaveFile(HttpPostedFile file)
        {
            string savePath = Server.MapPath(".")+"//Uploads//";
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
            else
            {
                string filepath = fileUpLoadPic.PostedFile.FileName;
                string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);//第一个\转义字符
                Session["filename"] = filename;
                string fileEx = filepath.Substring(filepath.LastIndexOf(".") + 1);//从.开始截至最后得到图片格式.jpg。。。
                string serverpath = Server.MapPath(".") + "//Uploads//";
                if (fileEx == "jpg" || fileEx == "bmp" || fileEx == "gif")
                {
                    //如果图片格式都正确，将页面所有内容存入数据库
                    String goodName = Request["title"];
                    String goodImg;
                    if (release.count > 1)
                    {
                        goodImg = "Uploads/"+ release.count.ToString() + filename;
                    }
                    else
                    {
                        goodImg = "Uploads/" + filename;
                    }
                    Double price = Convert.ToDouble(Request["price"]);
                    String address = Request["address"];
                    String category = Request["type"].ToString().Trim();
                    int bargin;
                    if (RadioButton1.Checked)
                        bargin = 1;
                    else
                        bargin = 0;
                    String contact = Request["tel"];
                    String newLevel = Request["new"];
                    String detail = Request["detail"];
                    //这里用户名从session中的得到 记得登录时候赋值session
                    String userID = Session["user_id"].ToString();
                    BLL.ReleaseBLL rel = new BLL.ReleaseBLL();
                    if(rel.releaseGood(goodName, goodImg, price, address, category, bargin, contact, newLevel, detail, userID) == 1)
                    {
                        Response.Write("<script language=javascript>window.alert('发布成功！');</script>");
                    }
                    else
                    {
                        Response.Write("<script language=javascript>window.alert('发布失败！请重试');</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert('上传商品图片格式有问题！'）</script>");
                }
            }
            
        }
    }
}