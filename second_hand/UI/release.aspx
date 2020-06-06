<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="release.aspx.cs" Inherits="second_hand.UI.release"%>
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
    <title>发布二手商品</title>
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
            "ROOT": "",
            "APP": "",
            "PUBLIC": "Public",
            "DEEP": "/",
            "VAR": ["m", "c", "a"],
            "MODEL": ["2", "1", ""],
        }
        var publicUrl = "Public";
        var curCityId = "450300";
        var curCityName = "桂林市";

    </script>

    <script src="Public/public/think.js"></script>
    <script>
        function showPic() {
            document.getElementById("good_img").src = document.getElementById("<%= fileUpLoadPic.ClientID%>").PostedFile.FileName;
        }
    </script>
</head>
<body>
    <form runat="server">
    <!--右侧图标-->
    <style>
        li {
            list-style: none
        }

        #rightButton {
            position: fixed;
            _position: absolute;
            top: 360px;
            right: 0;
            z-index: 999999;
            display: block;
        }

        #right_ul {
            position: relative;
        }

        #right_qq {
            background: url(Public/plugins/helpfixed/images/7_03.png) no-repeat;
            width: 68px;
            height: 74px;
        }

        #right_tel {
            background: url(Public/plugins/helpfixed/images/7_05.png) no-repeat;
            width: 68px;
            height: 77px;
        }

        #right_tip {
            background: url(Public/plugins/helpfixed/images/flag_right.png) no-repeat;
            width: 252px;
            height: 91px;
            position: absolute;
            right: 70px;
            top: -10px;
            display: none;
            z-index: 999999;
        }

        .flagShow_p1 {
            float: left;
            margin-left: 15px;
            _margin-left: 5px;
            font-size: 18px;
            line-height: 91px;
        }

        .flagShow_p2 {
            float: left;
            margin-left: 10px;
            _margin-left: 5px;
            font-size: 18px;
            color: #FA7C00;
        }

            .flagShow_p2 a {
                display: block;
                margin: 20px 0 5px 12px;
                line-height: 0;
            }

            .flagShow_p2 span {
                margin: 0 0 0 14px;
            }

        .flag_qq {
            display: none;
        }

        #backToTop {
            position: fixed;
            _position: absolute;
            bottom: 20px;
            right: 0;
            z-index: 999999;
            display: none;
        }

        a.backToTop_a {
            background: url(Public/plugins/helpfixed/images/7_08.png) no-repeat;
            width: 68px;
            height: 79px;
            display: block;
        }

            a.backToTop_a:active {
                background: url(Public/plugins/helpfixed/images/7_11.png) no-repeat;
            }

        .line91 {
            line-height: 91px;
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
                        <img border="0" src="Public/plugins/helpfixed/images/qiyeQQ.png">
                    </a> <span>QQ:708805642</span>
                </p>
            </li>
        </ul>
    </div>
    <div id="backToTop">
        <a href="javascript:;" onfocus="this.blur();" class="backToTop_a png"></a>
    </div>
    <!--[if lte IE 6]>
    <script src="js/phone/PNG.js" type="text/javascript"></script>
    <script>
        if( typeof(PNG) == 'object') PNG.fix('.png');
    </script>
    <![endif]-->


    <link rel="stylesheet" href="Public/public/header.css" type="text/css" />
    <div class="header header_change">
        <a><div class="logo ring-hover"><img class="oniicon" src="Uploads/web/2016-03-03/图片2.png"></div></a>
        <div class="nav clearfix">
            <ul class="nav_list">
                <a class="nav_link" href="home_logined.aspx">
                    <li class="nav_item" name="fistpage" id="fistpage">
                        首页
                    </li>
                </a>
                <a class="nav_link " href="home_logined.aspx">
                    <li class="nav_item" name="ershou" id="ershou">
                        二手物品
                    </li>
                </a>
            </ul>
        </div>
        <div class="logreg">
            <p class="right">
            <p class="loginin">
                <a class="logout" href="/logreg/logout">退出</a>
            </p>
            </p>
        </div>
        <div class="searchbox">
            <div>
                <span class="icon-search serach-icon"></span>
                <input name="keywords" id="serachWord" class="search" type="serach" placeholder="搜索你想要的商品" />            <div onclick="toSearch()" class="submit" value="搜索">搜索</div>
            </div>
        </div>
    </div>




    <link rel="stylesheet" href="Public/Home/css/release/sale.css" type="text/css" />
    <div class="wrap">
        <div class="release clearfix">
            <div class="top-panel">
                发布商品
            </div>
            <div class="somebtn clearfix">
                <div class="help">
                    <span></span>
                    <span name="help" id="help">需要帮助？</span>
                </div>
            </div>
            <div class="goods-content clearfix">
                    <div id="goodstable">
                        <table class="goodstable table">
                            <tbody>
                                <tr>
                                    <th width="13%">
                                        商品标题
                                    </th>
                                    <td width="37%">
                                        <div class="psssword item form-group">
                                            <div class="field" runat="server">
                                                <input class="title" type="text" placeholder="请输入商品标题" id="title" name="title" data-validate="required:同学，标题是必填内容哦">
                                            </div>
                                        </div>
                                    </td>
                                    <input name="thumb" type="hidden" value="" id="thumbpic">
                                    <td width="50%" rowspan="8" class="out-pic-box">
                                        <div class="pre-pic" id="thumb">
                                             <div  runat="server" >
                                         <%-- <asp:image id="imgFood" name="imgFood" runat="server" height="200px" width="170px"/>--%>
                                           <%-- <img height="200px" width="170px" name="good_img" id="good_img"/>--%>
                                            <asp:FileUpload ID="fileUpLoadPic" runat="server" onchange="showPic" />
                                           <label>请在上方选择商品照片</label>
                                            <%--<asp:Button ID="btnPicUpload" runat="server" Text="确认上传商品图片" OnClick="btnPicUpload_Click" CausesValidation="false" OnClientClick="return false" />--%>
                                        </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th width="13%">
                                        商品价格
                                    </th>
                                    <td width="37%">
                                        <div class="psssword item form-group">
                                            <div class="field" runat="server">
                                                <input class="price" type="text" placeholder="请输入商品价格" name="price" id="price" data-validate="required:同学，价格是必填内容哦,plusinteger:金额只能为整数" />
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th width="13%">
                                        交易地点
                                    </th>
                                    <td width="37%">
                                        <div class="psssword item form-group">
                                            <div class="field" runat="server">
                                                <input class="address" type="text" placeholder="请输入商品交易地点" name="address" id="address" data-validate="required:同学，交易地点是必填内容哦" />
                                            </div>
                                        </div>
                                    </td>
                                </tr>               
                                <tr>
                                    <th width="13%">
                                        所属分类
                                    </th>
                                    <td width="37%">
                                        <div class="username item form-group">
                                            <div class="field" runat="server">
                                                <select class="input" name="type" id="type"  data-validate="required:分类不能为空！"/>
                                                    <option value="">点击展开分类列表</option>
                                                    <option value="图书">图书</option>
                                                    <option value="美妆">美妆</option>
                                                    <option value="饰品">饰品</option>
                                                    <option value="数码">数码</option>
                                                    <option value="箱包">箱包</option>
                                                    <option value="生活用品">生活用品</option>
                                                    <option value="学习资料">学习资料</option>
                                                    <option value="其他">其他</option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th width="13%">
                                        是否可刀
                                    </th>
                                    <td width="37%">
                                        <div class="button-group radio" runat="server"> 
                                            <ul>
                                                <li>
                                                    <asp:RadioButton ID="RadioButton1" Text="可接受议价" GroupName="choose" runat="server" />
                                                </li>
                                                <li>
                                                     <asp:RadioButton ID="RadioButton2" Text="不接受议价" GroupName="choose" runat="server" />
                                                </li>
                                            </ul>
                                            </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th width="13%">
                                        联系方式
                                    </th>
                                    <td width="37%">
                                        <div class="psssword item form-group">
                                            <div class="field" runat="server">
                                                <input class="tel" type="text" placeholder="选填" name="tel" id="tel" value="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th width="13%">
                                        新旧程度
                                    </th>
                                    <td width="37%">
                                        <div class="psssword item form-group">
                                            <div class="field" runat="server">
                                                <input class="new" type="text" name="new" id="new">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th width="13%">
                                        商品详情
                                    </th>
                                    <td width="37%" colspan="2">
                                        <div class="psssword item form-group">
                                            <div class="field" runat="server">
                                                <textarea class="detail" type="text" placeholder="请输入商品详情" name="detail" id="detail" data-validate="required:同学，商品详情是必填内容哦" ></textarea>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                <td style="border:none"><div class="releasebtn">
                                <asp:Button runat="server" ID="release_Button" Text="发布" BackColor="#00AA88" BorderStyle="None" ForeColor="White" OnClick="release_Button_Click" />              
                                 </div></td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
            </div>
        </div>
    </div>
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
</form>
</body>
</html>
