using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace second_hand.UI
{
    public partial class chatting : System.Web.UI.Page
    {
        //页面初始化需要的数据包括
        //1.左侧和该用户聊天的用户id
        public List<String> userIDList = new List<String>();
        //2.要展示出和该用户最近聊天的一条消息的时间和内容
        public List<Model.Chat> chat = new List<Model.Chat>();
        //3.右侧聊天面板要展示的消息（）
        public List<Model.Chat> messageList = new List<Model.Chat>();
        public String myID;
        public String talkNow = "";
        public DateTime now = DateTime.Now;
        public bool notRead = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            /*该页面可以有两种进入方式
            一种是通过首页点击商品信息中的卖方id进入
            一种是通过用户中心下拉框进入
            为避免未注册用户进入聊天界面，首先检查Session*/
            if (Session["user_id"] == null)
            {
                Response.Write("<script>alert('需要登录才能和卖方联系！')</script>");
                Response.Redirect("home_unlogined.aspx");
            }
            else
            {
                myID = Session["user_id"].ToString();
                BLL.chattingBLL ctb = new BLL.chattingBLL();
                if (Request.QueryString["chat_id"] != null)
                {
                    String chatID = Request.QueryString["chat_id"].ToString();
                    //说明是从首页点击进入，需要判断点击的这个人在不在以前聊天的清单里
                    bool isExist = false;
                    userIDList = ctb.selectChatUsers(Session["user_id"].ToString());
                    for (int i = 0; i < userIDList.Count; i++)
                    {
                        if (userIDList[i].Equals(chatID))
                        {
                            isExist = true;
                        }
                    }
                    //如果不在，将chat_id的这个用户消息其他字段置空，加入到消息列表
                    if (!isExist)
                    {
                        //Model.Chat c = new Model.Chat();
                        //c.content = "";
                        //c.sendTime = DateTime.Now;
                        //chat.Add(c);
                        userIDList.Add(chatID);
                        //从用户表中的第一个开始
                        for (int j = 1; j < userIDList.Count; j++)
                        {
                            //对左侧的每个用户都需要获取到发送方为该用户，接收方为我，或者是发送方为我，接收方为该用户的最近的一条消息
                            chat.Add(ctb.selectRecentMessage(myID, userIDList[j]));
                        }
                    }
                    else
                    {
                        //如果在的话就不用把他加进去了
                        foreach (String id in userIDList)
                        {
                            //对左侧的每个用户都需要获取到发送方为该用户，接收方为我，或者是发送方为我，接收方为该用户的最近的一条消息
                            chat.Add(ctb.selectRecentMessage(myID, id));
                        }
                    }

                    //如果是首页点进来的，右侧加载和首页点进来的那个人的聊天记录
                    talkNow = chatID;
                    messageList = ctb.selectMessage(myID, chatID);

                }
                else if (Request.QueryString["changePerson"] != null)
                {
                    //说明点击li更换聊天对象
                    userIDList = ctb.selectChatUsers(Session["user_id"].ToString());
                    foreach (String id in userIDList)
                    {
                        //对左侧的每个用户都需要获取到发送方为该用户，接收方为我，或者是发送方为我，接收方为该用户的最近的一条消息
                        /*这里有bug*/
                        chat.Add(ctb.selectRecentMessage(myID, id));
                    }
                    talkNow = Request.QueryString["changePerson"].ToString();
                    messageList = ctb.selectMessage(myID, talkNow);
                    //把此人发给我的所有消息设置为已读
                    ctb.updateRead(myID, talkNow);
                }
                else
                {
                    //说明不是从首页点击进入，也不是刷新，只需从数据库中找和该用户有来往的用户id
                    userIDList = ctb.selectChatUsers(Session["user_id"].ToString());
                    foreach (String id in userIDList)
                    {
                        //对左侧的每个用户都需要获取到发送方为该用户，接收方为我，或者是发送方为我，接收方为该用户的最近的一条消息
                        /*这里有bug*/
                        chat.Add(ctb.selectRecentMessage(myID, id));
                    }
                    //如果不是首页点进来的，那么右侧聊天框需要加载与第一个人聊天历史记录
                    talkNow = userIDList[0];
                    messageList = ctb.selectMessage(myID, userIDList[0]);
                    //把第一个人所有发送给我的消息设置为已读
                    ctb.updateRead(myID, userIDList[0]);
                }
            }

        }
    }
}
