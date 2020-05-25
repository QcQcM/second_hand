<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="second_hand.UI.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <title>注册</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

    <style> 
        div
        {
            background:url(https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00662-2772.jpg);
            background-size:100% 100%;
            background-repeat:no-repeat;
        }
        td{
            border:none;
        }
     </style>
     <script type="text/javascript" src="https://libs.baidu.com/jquery/1.2.3/jquery.min.js"></script>
      <script>
          function checkUserid(userid) {
               $.ajax({
            type:"GET",
            url:"AjaxUserIdCheck.ashx",
            dataType:"html",
            data:"userName="+$("#user_id").val(),
            beforeSend:function(XMLHttpRequest)
                {
                    $("#showResult").text("正在查询");
                    $("#showResult").css("color", "black");
                    $("#user_id").css("border-color", "black");
                    //Pause(this,100000);
                },
            success:function(msg)
                {   
                    $("#showResult").html(msg);
                    if (msg == "此ID已被注册，请更改") {
                        $("#showResult").css("color", "red");
                        $("#user_id").css("border-color", "red");
                    }
                    
                },
           complete:function(XMLHttpRequest,textStatus)
                {
                    //隐藏正在查询图片
                },
          error:function()
               {
                    //错误处理
               }
            });
        }
      </script>
       <script>
           function checkUserTelep(telephone_num) {
               $.ajax({
            type:"GET",
            url:"AjaxUserTelephoneCheck.ashx",
            dataType:"html",
            data: "telephone=" + $("#telephone_num").val(),
            beforeSend:function(XMLHttpRequest)
                {
                $("#showResult1").text("正在查询");
                $("#showResult1").css("color", "black");
                $("#telephone_num").css("border-color", "black");
                    //Pause(this,100000);
                },
            success:function(msg)
                {   
                    $("#showResult1").html(msg);
                    if (msg == "此手机号已被注册，请更换") {
                        $("#showResult1").css("color", "red");
                        $("#telephone_num").css("border-color", "red");
                    }
                   
                },
           complete:function(XMLHttpRequest,textStatus)
                {
                    //隐藏正在查询图片
                },
          error:function()
               {
                    //错误处理
               }
            });
        }
      </script>
  </head>
  <body>
      <form runat="server">
  <div>
    <table border="1" align="center" width="500">
        <tr>
            <td ><label for="name">手机号</label></td>
            <td><input name="telephone_num" id="telephone_num" type="text" onblur="checkUserTelep(this.value)" /></td>
            <td><label id="showResult1" name="showResult1"/></td>
        </tr>
       
         <tr>
            <td><asp:Button id="send_code_Button" text="发送手机验证码" runat="server" OnClick="send_code_Button_Click"/></td>
         </tr>
       
         <tr>
            <td><label for="phone_num">填写验证码</label></td>
            <td><asp:TextBox id="code" runat="server" /></td>
            <e
        
         </tr>
       
         <tr>
            <td><label for="phone_num">用户名</label></td>
            <td><input name="user_id" id="user_id" type="text" onblur="checkUserid(this.value)"/></td>
            <td><label id="showResult"/></td>
         </tr>
        <tr>
            <td><label for="phone_num">真实姓名</label></td>
            <td><asp:TextBox id="name" runat="server" /></td>
            <td><asp:RequiredFieldValidator Display="Static" ID="name_val" ControlToValidate="name" ErrorMessage="真实姓名不能为空" runat="server"></asp:RequiredFieldValidator></td>   
        </tr>
        
        <tr>
            <td><label for="school">学校</label></td>
            <td><asp:TextBox id="school" runat="server" /></td>
            <td><asp:RequiredFieldValidator Display="Static" ID="school_val" ControlToValidate="school" ErrorMessage="学校不能为空" runat="server"></asp:RequiredFieldValidator></td>
       
        </tr>
        <tr>
            <td><label for="college">学院</label></td>
            <td><asp:TextBox id="college" runat="server" /></td>
            <td><asp:RequiredFieldValidator Display="Static" ID="college_val" ControlToValidate="school" ErrorMessage="学院不能为空" runat="server"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><label for="campus">校区</label></td>
            <td><asp:TextBox id="campus" runat="server" /></td>
            <td><asp:RequiredFieldValidator Display="Static" ID="campus_val" ControlToValidate="campus" ErrorMessage="校区不能为空" runat="server"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><label for="password">密码</label></td>
            <td><asp:TextBox id="password1" runat="server" TextMode="Password" /></td>
            <td><asp:RequiredFieldValidator Display="Static" ID="password_val" ControlToValidate="password1" ErrorMessage="密码不能为空" runat="server"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td><label for="password">确认密码</label></td>
            <td><asp:TextBox id="password2" runat="server" TextMode="Password" /></td>
             <td><asp:CompareValidator ID="password_confirm" ControlToValidate="password2" ControlToCompare="password1" Display="Static" ErrorMessage="两次密码输入不相同" ForeColor="Red" runat="server" /></td>
        </tr>
        
        <tr>
            <td colspan="2" align="center">
                <asp:Button id="register_Button" text="注册" runat="server" OnClick="register_Button_Click" />
            </td>
        </tr>

    </table>
</div>
</form>
</body>
</html>
