<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="second_hand.UI.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="edge">
    <meta charset="utf-8">
    <link rel="icon" href="Public/images/icon/smalllogo.png" type="image/x-icon" />
    <meta name="viewport" content="width=device-width,maximum-scale=1,minimum-scale=1,initial-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>注册</title>
    <link type="text/css" href="Public/plugins/pintuer/pintuer.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="Public/public/init.css">
    <link rel="stylesheet" href="Public/Fonts/goodsdis/iconfont.css" type="text/css" />
    <link rel="stylesheet" href="Public/public/pager.css" type="text/css" />
    <link type="text/css" rel="stylesheet" href="Public/Fonts/mmiconfont/iconfont.css">
    <link rel="stylesheet" type="text/css" href="Public/plugins/webuploader/style.css" />
    <link rel="stylesheet" type="text/css" href="Public/plugins/webuploader/webuploader.css" />
    <script src="Public/public/jquery-1.8.3.min.js"></script>
    <script src="Public/plugins/pintuer/pintuer.js"></script>
    <script src="Public/plugins/layer/layer.js"></script>
    <script type="text/javascript" src="Public/public/common.js"></script>
    <script type="text/javascript" src="Public/plugins/Carousel-Ad/js/superslide.2.1.js"></script>
    <script type="text/javascript" src="Public/plugins/webuploader/webuploader.js"></script>
    <script src="Public/public/thumbupload.js"></script>
    <script src="Public/public/uploadfile.js"></script>
    <script src="./js/info.js"></script>
    <script type="text/javascript" src="Public/public/jquery.lazyload.js"></script>
    <script type="text/javascript">
        ThinkPHP = window.Think = {
            "ROOT": "",
            "APP": "",
            "PUBLIC": "Public",
            "DEEP": "/",
            "VAR": ["m", "c", "a"],
            "MODEL": ["2", "1", ""],
        }

    </script>
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
    <script>
        /*百度统计代码*/
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?631792055f974af19205e0193b81fcb4";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

    <script src="Public/public/think.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="backToTop">
        <a href="javascript:;" onfocus="this.blur();" class="backToTop_a png"></a>
    </div>
    <script type="text/javascript">
        $(document).ready(function (e) {
            $("#rightButton").css("right", "0px");

            var button_toggle = true;
            $(".right_ico").on("mouseover", function () {
                var tip_top;
                var show = $(this).attr('show');
                var hide = $(this).attr('hide');
                tip_top = show == 'tel' ? 65 : -10;
                button_toggle = false;
                $("#right_tip").css("top", tip_top).show().find(".flag_" + show).show();
                $(".flag_" + hide).hide();

            }).on("mouseout", function () {
                button_toggle = true;
                hideRightTip();
            });


            $("#right_tip").on("mouseover", function () {
                button_toggle = false;
                $(this).show();
            }).on("mouseout", function () {
                button_toggle = true;
                hideRightTip();
            });

            function hideRightTip() {
                setTimeout(function () {
                    if (button_toggle) $("#right_tip").hide();
                }, 500);
            }

            $("#backToTop").click(function () {
                var _this = $(this);
                $('body,html').animate({ scrollTop: 0 }, 1000, 'swing', function () { _this.hide() });
            });

            $(window).scroll(function () {
                var htmlTop = $(document).scrollTop();
                if (htmlTop > 0) {
                    $("#backToTop").show();
                } else {
                    $("#backToTop").hide();
                }
            });
        });
    </script>
    <!--[if lte IE 6]>
    <script src="js/phone/PNG.js" type="text/javascript"></script>
    <script>
        if( typeof(PNG) == 'object') PNG.fix('.png');
    </script>
    <![endif]-->

    <link rel="stylesheet" href="Public/Home/css/logreg/register.css" type="text/css" />

        <div class="main clearfix">
            <div class="left ">
                <div class="top">注册</div>
                <form action="/home/logreg/register" method="post" class="form-tips">
                    <div class="username item form-group">
                        <div class="field">
                            <label for="name">手机号</label>
                            <input name="telephone_num" id="telephone_num" type="text" placeholder="请输入手机号" onblur="checkUserTelep(this.value)" />                     
                        </div>
                    </div>
                     <div class="form-button reg"><label id="showResult1" name="showResult1"/></div>
                     <div class="username item form-group">
                        <div class="field">
                           <label for="phone_num">用户名</label>
                            <input name="user_id" id="user_id" type="text" onblur="checkUserid(this.value)"/>                        
                        </div>
                    </div>
                       <div class="form-button reg">
                            <label id="showResult"/>
                        </div>
                    <div class="username item form-group">
                        <div class="field">
                            <label for="name">真实姓名</label>
                            <asp:TextBox id="name" runat="server" />
                            <div class="form-button reg">
                            <asp:RequiredFieldValidator Display="Static" ID="name_val" ControlToValidate="name" ErrorMessage="真实姓名不能为空" runat="server"></asp:RequiredFieldValidator>
                            </div>
                            </div>
                    </div>
                    <div class="content">
                        <div class="username item form-group">
                            <div class="field">
                                <label for="name">省份</label>
                                <select class="name" type="text" id="province" name="province"></select>
                            </div>
                        </div>
                        <div class="username item form-group">
                            <div class="field">
                                <label for="name">城市</label>
                                <select class="name" type="text" id="city" name="city"></select>
                            </div>
                        </div>
                         <div class="username item form-group">
                                <label for="name">学校</label>
                        </div>
                          <div class="form-button reg">
                                <select class="name" type="text" id="school" name="school"></select>
                        </div>
                        <div class="username item form-group">
                        <div class="field">
                           <label for="college">学院</label>
                           <asp:TextBox id="college" runat="server" />
                             <div class="form-button reg">
                           <asp:RequiredFieldValidator Display="Static" ID="college_val" ControlToValidate="college" ErrorMessage="学院不能为空" runat="server"></asp:RequiredFieldValidator>
                        </div>
                             </div>
                        <div class="username item form-group">
                        <div class="field">
                           <label for="campus">校区</label>
                            <asp:TextBox id="campus" runat="server" />
                             <div class="form-button reg">
                             <asp:RequiredFieldValidator Display="Static" ID="campus_val" ControlToValidate="campus" ErrorMessage="校区不能为空" runat="server"></asp:RequiredFieldValidator>
                        </div>
                             </div>
                        <div class="field">
                          <label for="password">密码</label>
                          <asp:TextBox id="password1" runat="server" TextMode="Password" />
                             <div class="form-button reg">
                          <asp:RequiredFieldValidator Display="Static" ID="password_val" ControlToValidate="password1" ErrorMessage="密码不能为空" runat="server"></asp:RequiredFieldValidator>
                        </div>
                          </div>
                         <div class="field">
                          <label for="password">确认密码</label>
                          <asp:TextBox id="password2" runat="server" TextMode="Password" />
                              <div class="form-button reg">
                          <asp:CompareValidator ID="password_confirm" ControlToValidate="password2" ControlToCompare="password1" Display="Static" ErrorMessage="两次密码输入不相同" ForeColor="Red" runat="server" />
                       </div>
                                   </div>
                    </div>

                    </div>

                    <script src="js/jquery.min.js"></script>
                    <script src="js/AllSchool.js"></script>
                    <script>
                        window.onload = function () {
                            var provinceArray = "";
                            var provicneSelectStr = "";
                            for (var i = 0, len = province.length; i < len; i++) {
                                provinceArray = province[i];
                                provicneSelectStr = provicneSelectStr + "<option value='" + provinceArray[0] + "'>" + provinceArray[1] + "</option>"
                            }
                            $("#province").html(provicneSelectStr);

                            var selectCity = $("#province").val();
                            var citylist = city[selectCity];
                            var cityArray = "";
                            var citySelectStr = "";
                            for (var i = 0, len = citylist.length; i < len; i++) {
                                cityArray = citylist[i];
                                citySelectStr = citySelectStr + "<option value='" + cityArray[0] + "'>" + cityArray[1] + "</option>"
                            }
                            $("#city").html(citySelectStr);

                            var selectschool = $("#city").val();
                            var schoolUlStr = "";
                            var schoolListStr = allschool[selectschool];
                            for (var i = 0, len = schoolListStr.length; i < len; i++) {
                                schoolUlStr = schoolUlStr + "<option >" + schoolListStr[i][2] + "</option>";
                            }
                            schoolUlStr = schoolUlStr + "<option value='999'>其它</option>";
                            $("#school").html(schoolUlStr);
                            //省切换事件
                            $("#province").change(function () {
                                var selectCity = $("#province").val();
                                var citylist = city[selectCity];
                                var cityArray = "";
                                var citySelectStr = "";
                                if (citylist != null) {
                                    for (var i = 0, len = citylist.length; i < len; i++) {
                                        cityArray = citylist[i];
                                        citySelectStr = citySelectStr + "<option value='" + cityArray[0] + "'>" + cityArray[1] + "</option>"
                                    }
                                }

                                $("#city").html(citySelectStr);
                                $("#school1").show();
                                $("#school2").hide();
                                var selectschool = $("#city").val();
                                var schoolUlStr = "";
                                var schoolListStr = allschool[selectschool];
                                for (var i = 0, len = schoolListStr.length; i < len; i++) {
                                    schoolUlStr = schoolUlStr + "<option >" + schoolListStr[i][2] + "</option>";
                                }
                                schoolUlStr = schoolUlStr + "<option value='999'>其它</option>";
                                $("#school").html(schoolUlStr);
                            });
                            //切换城市事件
                            $("#city").change(function () {
                                $("#school1").show();
                                $("#school2").hide();
                                var selectschool = $("#city").val();
                                var schoolUlStr = "";
                                var schoolListStr = allschool[selectschool];
                                for (var i = 0, len = schoolListStr.length; i < len; i++) {
                                    schoolUlStr = schoolUlStr + "<option >" + schoolListStr[i][2] + "</option>";
                                }
                                schoolUlStr = schoolUlStr + "<option value='999'>其它</option>";
                                $("#school").html(schoolUlStr);
                            });
                            $("#school").change(function () {
                                if ($("#school").val() == "999") {
                                    $("#school1").hide();
                                    $("#school2").show();
                                }
                            });
                            $("#second").show();
                            $("#restart").css("backgorund", "url('assets/images/chongxintijiao.jpg') no-repeat");
                        }

                    </script>
                    <div class="form-button reg">
                         <asp:Button id="register_Button" text="注册" runat="server" OnClick="register_Button_Click" />
                    </div>
                    <div class="other">
                        <span class="has">已有账号？</span><a href="login.html">马上登录</a>
                        <span class="forget">忘记密码？</span><a href="#" onclick="javascript:layer.alert('尚未开放，敬请期待');return false;">马上找回</a>
                    </div>
                </form>
            </div>
        </div>
        
        
        <script type="text/javascript">
            $("#verifycode").click(function () {
                getPic();
            })

            function getPic() {
                $("#verifycode").attr("src", "/TP/codePic?flag=" + Math.random());
            };
        </script>
    </form>
</body>
</html>
