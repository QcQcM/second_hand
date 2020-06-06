<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myGood.aspx.cs" Inherits="second_hand.UI.myGood" %>
<%@ Import Namespace="second_hand.Model" %>
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
    <title>已发布商品</title>
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
    <script type="text/javascript" src="Public/public/jquery.lazyload.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">
    <script src="jquery.min.js"></script>
    <script type="text/javascript">
        ThinkPHP = window.Think = {
            "ROOT"   : "",
            "APP"    : "",
            "PUBLIC" : "Public",
            "DEEP"   : "/",
            "VAR"    : ["m", "c", "a"],
            "MODEL"  : ["2", "1", ""],
        }

    </script>

    <script src="Public/public/think.js"></script>
</head>
<body>

<!--右侧图标-->
<style>
    li{ list-style:none}
    #rightButton{ position:fixed; _position:absolute; top:360px; right:0; z-index:999999; display:block;}
    #right_ul{ position:relative;}
    #right_qq{  background:url(Public/plugins/helpfixed/images/7_03.png) no-repeat; width:68px; height:74px; }
    #right_tel{ background:url(Public/plugins/helpfixed/images/7_05.png) no-repeat; width:68px; height:77px; }
    #right_tip{  background:url(Public/plugins/helpfixed/images/flag_right.png) no-repeat; width:252px; height:91px; position:absolute; right:70px; top:-10px; display:none; z-index:999999; }
    .flagShow_p1{ float:left; margin-left:15px; _margin-left:5px; font-size:18px; line-height:91px;}
    .flagShow_p2{ float:left; margin-left:10px; _margin-left:5px; font-size:18px;  color:#FA7C00;}
    .flagShow_p2 a{ display:block; margin: 20px 0 5px 12px; line-height:0;}
    .flagShow_p2 span{ margin: 0 0 0 14px; }
    .flag_qq{ display:none;}
    #backToTop{ position:fixed; _position:absolute; bottom:20px; right:0; z-index:999999; display:none; }
    a.backToTop_a{  background:url(Public/plugins/helpfixed/images/7_08.png) no-repeat; width:68px; height:79px; display:block; }
    a.backToTop_a:active{  background:url(Public/plugins/helpfixed/images/7_11.png) no-repeat; }
    .line91{ line-height:91px; }
</style>
<style>
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
}
.dropdown:hover .dropdown-content {
  display: block;
}

</style>
<div id="rightButton">
    <ul id="right_ul">
        <li id="right_qq" class="right_ico" show="qq" hide="tel"></li>
        <li id="right_tel" class="right_ico" show="tel" hide="qq"></li>
        <li id="right_tip" class="png">
            <p class="flagShow_p1 flag_tel">电话联系</p>
            <p class="flagShow_p2 flag_tel line91">15122886695</p>
            <p class="flagShow_p1 flag_qq">QQ联系</p>
            <p class="flagShow_p2 flag_qq">
                <a href="tencent://message/?uin=307242951&Site=QQ交谈&Menu=yes" target="_blank">
                    <img border="0" src="Public/plugins/helpfixed/images/qiyeQQ.png"></a> <span>QQ:708805642</span> </p>
        </li>
    </ul>
</div>
<div id="backToTop">
    <a href="javascript:;" onfocus="this.blur();" class="backToTop_a png"></a>
</div>
<script type="text/javascript">
    function Search() {
        var search_name = document.getElementById("keywords").value;
        window.location = "home_logined.aspx?search_name=" + search_name;
    }
    $(document).ready(function(e) {
        $("#rightButton").css("right", "0px");

        var button_toggle = true;
        $(".right_ico").on("mouseover", function(){
            var tip_top;
            var show= $(this).attr('show');
            var hide= $(this).attr('hide');
            tip_top = show == 'tel' ?  65 :  -10;
            button_toggle = false;
            $("#right_tip").css("top" , tip_top).show().find(".flag_"+show).show();
            $(".flag_"+hide).hide();

        }).on("mouseout", function(){
            button_toggle = true;
            hideRightTip();
        });


        $("#right_tip").on("mouseover", function(){
            button_toggle = false;
            $(this).show();
        }).on("mouseout", function(){
            button_toggle = true;
            hideRightTip();
        });

        function hideRightTip(){
            setTimeout(function(){
                if( button_toggle ) $("#right_tip").hide();
            }, 500);
        }

        $("#backToTop").click(function(){
            var _this = $(this);
            $('body,html').animate({scrollTop:0},1000,'swing',function(){_this.hide()});
        });

        $(window).scroll(function(){
            var htmlTop = $(document).scrollTop();
            if( htmlTop > 0){
                $("#backToTop").show();
            }else{
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


<link rel="stylesheet" href="Public/public/header.css" type="text/css" />
<div class="header header_change">
    <div class="nav clearfix">
        <ul class="nav_list">
            <a class="nav_link" href="home_logined.aspx">
                <li class="nav_item">
                    首页
                </li>
            </a>
            <a class="nav_link " href="home_logined.aspx">
                <li class="nav_item">
                    二手物品
                </li>
            </a>
            <div class="dropdown">
            <span class="nav_link "> <li class="nav_item">个人中心</li></span>
            <div class="dropdown-content">
             <a href="myGood.aspx">
                    我已发布
            </a>
            <a href="chatting.aspx">
                    消息中心
            </a>
  </div>
</div>
        </ul>
    </div>
    <div class="searchbox">
        <div class="form">
            <span class="icon-search serach-icon"></span>
            <input name="keywords" id="keywords" class="search"  type="serach" placeholder="搜索你想要的商品"/>           
             <div onclick="Search()" class="submit" value="搜索">搜索</div>
        </div>
    </div>
</div>




    <link rel="stylesheet" href="Public/sale.css" type="text/css" />
     <link type="text/css" rel="stylesheet" href="Public/public/mygoods.css"/>
    <link rel="stylesheet" href="Public/Home/css/sale/goods.css" type="text/css" />
 
    <div class="wrap">
        <div class="release clearfix"  runat="server" >
            <div class="top-panel">
                已发布商品
            </div>
                        <% foreach (var item in list)
                            {%>
                        <li >
                            <div class="col-md-4 col-sm-6" align="center">
                        <div class="class-item">
                            <div class="class-bg-layer"></div>
                            <div class="class-item-bg">
                            <div class="img-responsive lazyload"  >
                                <img  src="<%= item.img %>" width="170" height="170" alt="<%= item.goodsName %>" style="margin: 11px auto auto auto" />
                            </div>
                            <div class="pricehot clearfix" align="center" style="color:red" >
                                <strong>
                                    <em>￥</em><i><%= item.prize %></i>
                                </strong>
                            </div>
                            <div class="pricehot clearfix" align="center">
                                <em><%= item.goodsName %></em>
                            </div>
                            <div class="p-operate" align="center">
                            <a class="p-o-btn " href="updateGood.aspx?goods_id=<%= item.goodsID %>"><i></i>修改</a>
                             
							<a class="p-o-btn " href="myGood.aspx?delete_id=<%= item.goodsID %>"><i></i>下架</a>    
                            </div>
                                 </div>
                             </div>
                                </div>
                        </li>
                        <%--<li><a href="" title=""><%= item.goodsName %></a></li>--%>

                        <% }%>
                    </ul>
                </div>
            </div>
        </div>
   

        </div>

    </div>
    <script type="text/javascript">
        var UPLOADWIDTH = 1000;
        var UPLOADHEIGHT = 1000;
        var SAVEDIR = 'salebuy';
        var MAXNUM = 4;



    </script>
    <link rel="stylesheet" href="Public/public/footer.css" type="text/css" />
    <div class="footer">
        <div class="footerNav">
            <ul class="fn">
                <li><span class="fnIco"></span><a href="/other/contact">关于我们</a></li>
                <li><span class="fnIco"></span><a href="/other/joinus">加入我们</a></li>
                <li><span class="fnIco"></span><a href="/sale/goods">校内二手</a></li>
                <!-- <li><span class="fnIco"></span><a href="/shop/index">柚子商城</a></li> -->
                <li><span class="fnIco"></span><a href="/logreg/login">我要登录</a></li>
                <li><span class="fnIco"></span><a href="/logreg/register">我要注册</a></li>
            </ul>
        </div>
        <div class="footerMain">
            <div class="fContact">
                <h3 class="fct">联系我们 / <span>contact us</span></h3>
                <p>Q群：1105040590</p>
                <p>Q Q：708805642</p>
                <p>地址：河北工业大学北辰校区</p>
            </div>

        </div>
</body>
</html>

