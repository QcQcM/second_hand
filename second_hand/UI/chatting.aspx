<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chatting.aspx.cs" Inherits="second_hand.UI.chatting" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>消息列表</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/reset.min.css">
    <link rel="stylesheet" href="css/style.css">
     <script type="text/javascript" src="https://libs.baidu.com/jquery/1.2.3/jquery.min.js"></script>
    <script>
        function CurentTime() {
            var now = new Date();
            var year = now.getFullYear(); //年 
            var month = now.getMonth() + 1; //月
            var day = now.getDate(); //日 
            var hh = now.getHours(); //时 
            var mm = now.getMinutes(); //分	
            var ss = now.getSeconds();	//秒 
            var clock = year + "-";
            if (month < 10) clock += "0";
            clock += month + "-";
            if (day < 10) clock += "0";
            clock += day + " ";
            if (hh < 10) clock += "0";
            clock += hh + ":";
            if (mm < 10) clock += '0';
            clock += mm + ":";
            if (ss < 10) clock += '0';
            clock += ss;
            return (clock);
        }
        window.onload = function () {
            //当页面加载完成以后，设置定时轮询，每隔20000毫秒，即5秒钟询问数据库一次，查找是否有上一次轮询以后新插入的数据
            setInterval(checkNew, 5000);
        }
        function checkNew() {
            //alert("我在轮询" + CurentTime())
            var myid = document.getElementById("my_id").innerHTML;
            var chatPerson = document.getElementById("now_chat").innerHTML;
            var time = CurentTime();
            var last_time = document.getElementById("last_time").innerHTML;
            $.ajax({
                type: "POST",
                url: "AjaxCheckNewMessage.ashx",
                dataType: "html",
                data: { myID: myid, chatPersonID: chatPerson, lastTime: last_time },
                beforeSend: function (XMLHttpRequest) {
                },
                success: function (msg) {
                    //alert(msg);
                    if (msg == "没有新消息略略略") { 
                      
                    } else {//说明有新消息
                        var box = document.getElementById("chat_box");
                        var div_child = '<div class="bubble you">' + msg + '</div>';
                        box.innerHTML += div_child;
                        var now_time = document.getElementById("last_time");
                        now_time.innerHTML = time;
                    } 
                },
                complete: function (XMLHttpRequest, textStatus) {
                    //隐藏正在查询图片
                },
                error: function () {
                    //错误处理
                }
            });
        }
        function changeChat(i) {
            var click = document.getElementsByTagName("span");
            var chatPerson = document.getElementById("now_chat");
            chatPerson.textContent = click[3 * i].innerHTML;
            var nowPerson = click[3 * i].innerHTML;
            window.location.href="chatting.aspx?changePerson=" + nowPerson;
        }
        function sendMessage() {
            var txt = document.getElementById("send_txt");
            var div_child = '<div class="bubble me">'+txt.value+'</div>';
            var box = document.getElementById("chat_box");
            box.innerHTML += div_child;
            var chatPerson = document.getElementById("now_chat").textContent;
            var myid = document.getElementById("my_id").innerHTML;
            $.ajax({
                type: "POST",
                url: "AjaxSendMessage.ashx",
                dataType: "html",
                data: { myID: myid, chatPersonID: chatPerson, mess_content: txt.value },
                beforeSend: function (XMLHttpRequest) {
                },
                success: function (msg) {
                    if (msg == "发送成功") {
                        alert("发送成功");
                    }
                    var txt = document.getElementById("send_txt");
                    txt.value = "";
                },
                complete: function (XMLHttpRequest, textStatus) {
                    //隐藏正在查询图片
                },
                error: function () {
                    //错误处理
                }
            });
        }
    </script>
    <style>
        .redpoint{
    display:block;
    background:#f00;
    border-radius:50%;
    width:5px;
    height:5px;
    top:0px;
    right:0px;
    position:absolute;
}
.whitepoint{
    display:none;
}
    </style>
</head>
<body>
    <div class="wrapper">
        <label id="my_id" style="visibility:hidden"><%= myID %></label>
         <label id="last_time" style="visibility:hidden"><%= now %></label>
        <div class="container">
            <div class="left">
                <div class="top">
                    <input type="text" placeholder="搜索" />
                   <%-- <a href="javascript:;" class="search"></a>--%>
                    <a href="home_logined.aspx">  
                     <button style="margin-top:1px;margin-left:5px;color:gray;background:white;border-color:black; height: 38px; width: 47px;border:none">首 页</button>
                    </a>  
                </div>
                <div style="max-height:500px;overflow-x:hidden;overflow-y:scroll;"> <!-- scroll下滑框一直存在的-->
                <ul class="people">
                    <div class="detail message-box" data-chat="person1" style="max-height:500px;overflow-x:hidden;overflow-y:auto;" > 
                    <% for (int i = 0; i < userIDList.Count; i++)
                        {
                         %>
                        <li class="person" data-chat="person1" onclick="changeChat(<%=i %>)">
                        <%if (i == 1)
                            { %>
                        <img src="chatimage/1.jpg" alt="" />
                        <%}
                            else if (i == 2)
                            {%>
                        <img src="chatimage/2.jpg" alt="" />
                            <%}
                                else if (i == 3)
                                { %>
                        <img src="chatimage/3.jpg" alt="" />
                            <%}
                                else
                                { %>
                             <img src="chatimage/4.jpg" alt="" />
                            <%} %>
                        <span class="name"><%= userIDList[i] %></span>
                            <%if (chat.Count == 0 || chat[i] == null)
                                {%>
                         <span class="time"></span>
                        <span class="preview"></span>
                            <%}
                                else
                                { %>
                        <span class="time"><%= chat[i].sendTime.Hour.ToString() + ":" + chat[i].sendTime.Minute.ToString() %> <i class="redpoint"></i></span>
                        <span class="preview"><%= chat[i].content %></span>
                       <%}
                           } %>
                
             </li>
            </ul>
            </div>
            </div>
            <div class="right">
                <div class="top"><span>To: <span class="name" id="now_chat"><%=talkNow %></span></span></div>          
                <div class="chat" data-chat="person2">
                    <div class="detail message-box" data-chat="person20" style="max-height:500px;overflow-x:hidden;overflow-y:auto;" id="chat_box"> <!-- 下滑框是当聊天的内容超过页面长度时才会出现的-->
                     <%--<div class="bubble you">
                        你好
                    </div>
                    <div class="conversation-start">
                        <span>6:48 </span>   <!--这里可以有个那个自动获取日期时间的函数 -->
                    </div>--%>
                        <%  if (messageList != null)
                            {
                                for (int i = 0; i < messageList.Count; i++)
                                {
                                    if(messageList[i].sendId == myID) {%>

                    <div class="bubble me">
                        <%= messageList[i].content %>
                    </div>
                  <%}else
                          {%>
                         <div class="bubble you">
                        <%= messageList[i].content %>
                    </div><%}
                          }
                      } %>
                  </div>
                </div>         
                <div class="write">
                    <a href="javascript:;" class="write-link attach"></a>
                    <input type="text" id="send_txt" />
                    <a href="javascript:;" class="write-link smiley"></a>
                    <a href="javascript:;" class="write-link send" onclick="sendMessage()"></a>
                </div>
            </div>
        </div>
    </div>


    <script src="js/index.js"></script>

  a>

</body>
</html>

