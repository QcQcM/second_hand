<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home_logined.aspx.cs" Inherits="second_hand.UI.home" %>

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
    <title>校内二手交易平台</title>
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

<form runat="server">
<link rel="stylesheet" href="Public/public/header.css" type="text/css" />
<div class="header header_change">
    <div class="nav clearfix">
        <ul class="nav_list">
            <a class="nav_link" href="/resource/indexInfo.html">
                <li class="nav_item">
                    首页
                </li>
            </a>
            <a class="nav_link " href="/resource/indexGoods.html">
                <li class="nav_item">
                    二手物品
                </li>
            </a>
            <a class="nav_link" href="/resource/GetGoods.html">
                <li class="nav_item">
                    二手求购
                </li>
            </a>
            <a  target="_blank" class="nav_link" href="/other/appdown">
                <li class="nav_item">
                    APP下载
                </li>
            </a>
        </ul>
    </div>

    <div class="searchbox">
        <div class="form">
            <span class="icon-search serach-icon"></span>
            <input name="keywords" id="keywords" class="search"  type="serach" placeholder="搜索你想要的商品"/>            
            <div class="search"><asp:Button runat="server" ID="serach_button" Text="搜索" OnClick="serach_button_Click"/>
        </div>
        <!-- <div class="hotword">
            <span class="hot">热门：</span>
            <a href="/sale/item/type/2">
                <span class="word1">手机</span>
            </a>
            <a href="/sale/item/type/3">
                <span class="word1">电脑</span>
            </a>
            <a href="/sale/item/type/7">
                <span class="word1">书籍教材</span>
            </a>
        </div> -->
    </div>
</div>



<link rel="stylesheet" href="Public/Home/css/item/item.css" type="text/css" />
<link rel="stylesheet" href="Public/Fonts/items/iconfont.css" type="text/css" />
<nav class="item clearfix">
    <ul>

        <a href="#">
            <li class="daibu item0">
                <span class="icon iconfontitems">&#xe697;</span>
                <span class="text">所有分类</span>
            </li>
        </a>
        <a href="home_logined.aspx?search_category=图书&search_name=">
            <li class="daibu item1">
                <span class="icon iconfontitems">&#xe857;</span>
                <span class="text">图书</span>
            </li>
        </a>
        <a href="home_logined.aspx?search_category=美妆&search_name=">
            <li class="shouji item2">
                <span class="icon iconfontitems">&#xe602;</span>
                <span class="text">美妆</span>
            </li>
        </a>
        <a href="home_logined.aspx?search_category=饰品&search_name=">
            <li class="diannao item3">
                <span class="icon iconfontitems">&#xe696;</span>
                <span class="text">饰品</span>
            </li>
        </a>
        <a href="home_logined.aspx?search_category=数码&search_name=">
            <li class="shuma  item4">
                <span class="icon iconfontitems">&#xe600;</span>
                <span class="text">数码</span>
            </li>
        </a>
        <a href="home_logined.aspx?search_category=箱包&search_name=">
            <li class="dianqi item5">
                <span class="icon iconfontitems">&#xe617;</span>
                <span class="text">箱包</span>
            </li>
        </a>
        <a href="home_logined.aspx?search_category=其他&search_name=">
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
            <a href="/resource/PushGoods.html">发布二手</a>
        </div>
        <div class="qiugou">
            <a href="/resource/GetGoods.html">发布求购</a>
        </div>
    </div>
</div>
<!--引入layer.js文件-->



<link rel="stylesheet" href="Public/Home/css/sale/goods.css" type="text/css" />
<style type="text/css">
    *{padding:0;list-style:none;
        margin-left: 0;
        margin-right: 0;
        margin-top: 0;
    }
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
                            <li _src="url(Uploads/ad/2017-04-15/58f19eaf6afea.png)" style="background:#fff center 0 no-repeat;"><a href="#"></a></li><li _src="url(Uploads/ad/2016-06-26/576f620c8b186.png)" style="background:#fff center 0 no-repeat;"><a href="#"></a></li><li _src="url(Uploads/ad/2016-06-26/576f620c805dd.png)" style="background:#fff center 0 no-repeat;"><a href="#"></a></li><li _src="url(Uploads/ad/2016-06-26/576f620c65e6e.png)" style="background:#fff center 0 no-repeat;"><a href="#"></a></li>
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
                <li class="items clearfix">
                    <div class="col-md-3 col-sm-6">
                        <div class="class-item">
                            <div class="class-bg-layer"></div>
                            <div class="class-item-bg">
                                <a target="_blank" href="" class="class-img">
                                    <img class="img-responsive lazyload" alt="" data-original="">
                                </a>
                                <div class="pricehot clearfix">
                                    <span class="price">￥&nbsp;<span>30</span></span>
                                    <span class="hot">点击数&nbsp;<span>11</span></span>
                                </div>
                                <a target="_blank" href="/sale/goodsdis/goodsid/1977" class="title">
                                    中国电信4G流量卡，移动流量卡，联通上网卡，全国通用，0月租                                        </a>
                                <div class="some  clearfix">
                                    <span class="school">广西师范大学</span>
                                        <span class="renzheng">
                                            未认证                                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </li><li class="items clearfix">
                <div class="col-md-3 col-sm-6">
                    <div class="class-item">
                        <div class="class-bg-layer"></div>
                        <div class="class-item-bg">
                            <a target="_blank" href="/sale/goodsdis/goodsid/1943" class="class-img">
                                <img class="img-responsive lazyload" alt="60v转让" data-original="Uploads/salebuy/2017-04-24/58fdaa27d68bd.jpg">
                            </a>
                            <div class="pricehot clearfix">
                                <span class="price">￥&nbsp;<span>1250</span></span>
                                <span class="hot">点击数&nbsp;<span>11</span></span>
                            </div>
                            <a target="_blank" href="/sale/goodsdis/goodsid/1943" class="title">
                                60v转让                                        </a>
                            <div class="some  clearfix">
                                <span class="school">广西师范大学</span>
                                        <span class="renzheng">
                                            未认证                                        </span>
                            </div>
                        </div>
                    </div>
                </div>
            </li>                         </ul>
            <div class="pager">
                <div><span class="current">1</span><a class="num" href="/sale/cschool/school/2/page/2">2</a><a class="num" href="/sale/cschool/school/2/page/3">3</a><a class="next" href="/sale/cschool/school/2/page/2">下一页</a><span class="rows">第<b>1</b>页/共<b>3</b>页&nbsp;&nbsp;共<b>43</b>条记录</span></div>            </div>
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
            <p>Q群：11111111111</p>
            <p>Q Q：11111111111</p>
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
</form>
</body>
</html>