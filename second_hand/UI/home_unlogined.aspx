<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home_unlogined.aspx.cs" Inherits="second_hand.UI.home_unlogined" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="edge">
    <meta charset="utf-8">
    <link rel="icon" href="Public/images/icon/smalllogo.png" type="image/x-icon"/>
    <meta name="viewport" content="width=device-width,maximum-scale=1,minimum-scale=1,initial-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>首页</title>
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
<div id="rightButton">
    <ul id="right_ul">
        <li id="right_qq" class="right_ico" show="qq" hide="tel"></li>
        <li id="right_tel" class="right_ico" show="tel" hide="qq"></li>
        <li id="right_tip" class="png">
            <p class="flagShow_p1 flag_tel">电话联系</p>
            <p class="flagShow_p2 flag_tel line91">111111111111</p>
            <p class="flagShow_p1 flag_qq">QQ联系</p>
            <p class="flagShow_p2 flag_qq">
                <a href="tencent://message/?uin=307242951&Site=QQ交谈&Menu=yes" target="_blank">
                    <img border="0" src="Public/plugins/helpfixed/images/qiyeQQ.png"></a> <span>QQ:1111111111</span> </p>
        </li>
    </ul>
</div>
<div id="backToTop">
    <a href="javascript:;" onfocus="this.blur();" class="backToTop_a png"></a>
</div>
<script type="text/javascript">
    function Search() {
        var search_name = document.getElementById("keywords").value;
        window.location = "home_unlogined.aspx?search_name=" + search_name;
    }
    function Release() {
        alert('需要先登录才能发布商品！');
    }
    function Chat() {
        alert('需要先登录才能联系卖家！');
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
        </ul>
    </div>

    <div class="searchbox">
        <div class="form">
            <span class="icon-search serach-icon"></span>
            <input name="keywords" id="keywords" class="search"  type="serach" placeholder="搜索你想要的商品"/>           
             <div onclick="Search()" class="submit" value="搜索">搜索</div>
        </div>
    </div>
    <div class="logreg">
        <p class="right">
            <a href="login.aspx">登录</a><a class="line">|</a>
            <a href="register.aspx">注册</a>        </p>
    </div>
</div>



<link rel="stylesheet" href="Public/Home/css/item/item.css" type="text/css" />
<link rel="stylesheet" href="Public/Fonts/items/iconfont.css" type="text/css" />
<nav class="item clearfix">
    <ul>

       <a href="home_unlogined.aspx">
            <li class="daibu item0">
                <span class="icon iconfontitems">&#xe697;</span>
                <span class="text">分类</span>
            </li>
        </a>
        <a href="home_unlogined.aspx">
            <li class="qita item11">
                <span class="icon iconfontitems">&#xe631;</span>
                <span class="text">查看全部</span>
            </li>
        </a>
        <a href="home_unlogined.aspx?search_category=图书">
            <li class="daibu item1">
                <span class="icon iconfontitems">&#xe60f;</span>
                <span class="text">图书</span>
            </li>
        </a>
        <a a href="home_unlogined.aspx?search_category=美妆">
            <li class="shouji item2">
                <span class="icon iconfontitems">&#xe666;</span>
                <span class="text">美妆</span>
            </li>
        </a>
        <a a href="home_unlogined.aspx?search_category=饰品">
            <li class="diannao item3">
                <span class="icon iconfontitems">&#xe605;</span>
                <span class="text">饰品</span>
            </li>
        </a>
        <a a href="home_unlogined.aspx?search_category=数码">
            <li class="shuma  item4">
                <span class="icon iconfontitems">&#xe602;</span>
                <span class="text">数码</span>
            </li>
        </a>
        <a href="home_unlogined.aspx?search_category=箱包">
            <li class="dianqi item5">
                <span class="icon iconfontitems">&#xe617;</span>
                <span class="text">箱包</span>
            </li>
        </a>
        <a href="home_unlogined.aspx?search_category=生活用品">
            <li class="qita item11">
                <span class="icon iconfontitems">&#xe600;</span>
                <span class="text">生活用品</span>
            </li>
        </a>
        <a href="home_unlogined.aspx?search_category=学习资料">
            <li class="qita item11">
                <span class="icon iconfontitems">&#xe60a;</span>
                <span class="text">学习资料</span>
            </li>
        </a>
        <a href="home_unlogined.aspx?search_category=其他">
            <li class="qita item11">
                <span class="icon iconfontitems">&#xe631;</span>
                <span class="text">其他</span>
            </li>
        </a>
    </ul>
</nav>

<script type="text/javascript">
    $('.item'+"").css('box-shadow','0 0 7px rgba(0,0,0,0.5) inset');
</script>
<link rel="stylesheet" href="Public/Home/css/public/sidebar.css" type="text/css" />
<div class="sidebar">
    <div class="btn block">
        <div class="ershou">
            <a href="#" onclick="Release()">发布二手</a>
        </div>
    </div>
</div>
<!--引入layer.js文件-->


<link rel="stylesheet" href="Public/Home/css/sale/goods.css" type="text/css" />
<style type="text/css">
    *{margin:0;padding:0;list-style:none;}
    body{background:#fff;font:normal 12px/22px 宋体;width:100%;}
    img{border:0;}
    a{text-decoration:none;color:#333;}
    a:hover{color:#1974A1;}
    /* fullSlide */
    .fullSlide{width:100%;position:relative;height:300px;background:#000;}
    .fullSlide .bd{margin:0 auto;position:relative;z-index:0;overflow:hidden;}
    .fullSlide .bd ul{width:100% !important;}
    .fullSlide .bd li{background-size:100% 100%!important;width:100% !important;height:300px;overflow:hidden;text-align:center;}
    .fullSlide .bd li a{display:block;height:300px;}
    .fullSlide .hd{width:100%;position:absolute;z-index:1;bottom:0;left:0;height:30px;line-height:30px;}
    .fullSlide .hd ul{text-align:center;}
    .fullSlide .hd ul li{cursor:pointer;display:inline-block;*display:inline;zoom:1;width:42px;height:11px;margin:1px;overflow:hidden;background:#000;filter:alpha(opacity=50);opacity:0.5;line-height:999px;}
    .fullSlide .hd ul .on{background:#f00;}
    .fullSlide .prev,.fullSlide .next{display:block;position:absolute;z-index:1;top:50%;margin-top:-30px;left:15%;z-index:1;width:40px;height:60px;background:url(Public/plugins/Carousel-Ad/images/slider-arrow.png) -126px -137px #000 no-repeat;cursor:pointer;filter:alpha(opacity=50);opacity:0.5;display:none;}
    .fullSlide .next{left:auto;right:15%;background-position:-6px -137px;}
</style>
<input type="hidden" name="order" value="">
<input type="hidden" name="keyWord" value="">
<input type="hidden" name="type" value="">
<div class="wrap" id="theTop">
    <div class="main clearfix">
        <div class="topbox">
            <div class="hot-event"  style="width: 100%; height: 300px;">
                <div class="fullSlide">
                    <div class="bd">
                        <ul>
                            <li _src="url(image/home_1.png)" style="background:#fff center 0 no-repeat;"><a href="#"></a></li>
                            <li _src="url(image/home_2.jpg)" style="background:#fff center 0 no-repeat;"><a href="#"></a></li>
                            <li _src="url(image/home_5.jpg)" style="background:#fff center 0 no-repeat;"><a href="#"></a></li>
                        </ul>
                    </div>
                    <div class="hd"><ul></ul></div>
                    <span class="prev"></span>
                    <span class="next"></span>
                </div>
            </div>          
        </div>  



 <div class="item-list">
    <ul class="goodsbox clearfix recommend-class-list row">
<% foreach(var item in lst)
	{%>
        <li class="items clearfix">
         <div class="col-md-3 col-sm-6">
                        <div class="class-item">
                            <div class="class-bg-layer"></div>
                            <div class="class-item-bg">
		    <img src=<%=item.img%> width="170" height="170"  class="img-responsive lazyload">
                                
             <div class="pricehot clearfix">
             <span class="price">￥&nbsp;<span><%=item.prize%></span></span>
             <span class="hot">&nbsp;<span><%=item.goodsName%></span></span>
             </div>     
                                
             <a  href="#" onclick="Chat()" class="title"><span class="school">卖家ID：<%=item.userID%></span></a>          
                        
            <div class="some  clearfix">
                <span class="school">商品描述：<%=item.description%></span>
           </div>
           <div class="some  clearfix">
                <span class="school">新旧程度：<%=item.newLevel%></span>
           </div>
            <div class="some  clearfix">
                <span class="school">卖家联系方式：<%= item.contactInfo%></span>
           </div>

           <div class="some  clearfix">
                <span class="school">是否接受议价：<%if(item.bargin==1){%>是<%}else{%>否<%}%></span>
           </div>


            <div class="some  clearfix">
                <span class="school">交易地点：<%=item.address%></span>
           </div>


             </div>
        </div>
        </div>
        
        <%}%>
        </ul>
            </div>

                <div class="pager">
                    <div></div>            </div>
            </div>
    </div>
</div>

<script type="text/javascript">
    var querySaleUrl = "/sale/querysale";
    /*轮播图片配置*/
</script>
<script src="Public/Home/js/sale/goods.js"></script>
<link rel="stylesheet" href="Public/public/footer.css" type="text/css" />
<div class="footer">
    <div class="footerNav">
        <ul class="fn">
            <li><span class="fnIco"></span><a href="/other/contact">关于我们</a></li>
            <li><span class="fnIco"></span><a href="/other/joinus">加入我们</a></li>
            <li><span class="fnIco"></span><a href="/sale/goods">校内二手</a></li>
            <li><span class="fnIco"></span><a href="/buy/index">校内求购</a></li>
            <!-- <li><span class="fnIco"></span><a href="/shop/index">柚子商城</a></li> -->
            <li><span class="fnIco"></span><a href="/logreg/login">我要登录</a></li>
            <li><span class="fnIco"></span><a href="/logreg/register">我要注册</a></li>
        </ul>
    </div>
    <div class="footerMain">
        <div class="fContact">
            <h3 class="fct">联系我们 / <span>contact us</span></h3>
            <p>Q群：709094762</p>
            <p>Q Q：1291682947</p>
            <p>地址：河北工业大学北辰校区</p>
        </div>
        <div class="fCall">
            <p class="callN">TEL:18176406629</p>
            <span class="kfT">24小时在线客服</span>
            <a class="fxl" href="http://weibo.com/u/276233227/" target="_blank">新浪微博</a>
            <a class="fqq" href="tencent://message/?uin=307242951&amp;Site=QQ交谈&amp;Menu=yes" target="_blank">客服QQ</a>
            <a class="fwx tips" data-toggle="hover" data-place="top" data-image="Uploads/web/2016-03-03/56d792395ebe9.png">微信二维码</a>
        </div>
</div>
</div>
</body>
</html>