/**
 * ��ѯ���ݣ��ɵ������򲿷ִ���
 * @param dom obj �������Ķ���
 * @param int target �û����𱻵����Ķ�����0-������1-ʱ�䣬2-�۸���3-�ȶ�
 */
function querySale(obj, target){
    _this = $(obj);
    var url = querySaleUrl;
    if(target == 0){//�ȶ�
        order = 0;
    }
    if(target == 1){//ʱ��
        order = $.trim(_this.attr("data-type"))==5?6:5;//ȡ����һ���෴��������
    }
    if(target == 2){//�۸�
        order = $.trim(_this.attr("data-type"))==1?2:1;//ȡ����һ���෴��������
    }
    if(target == 3){//�ȶ�
        order = $.trim(_this.attr("data-type"))==3?4:3;//ȡ����һ���෴��������
    }
    url = url + "/order/" + order;
    var keyword = $.trim($("input[name='keyWord']").val());
    if(keyword){
        url = url + "/keyword/" + keyword;
    }
    var type = $.trim($("input[name='type']").val());
    if(type){
        url = url + "/type/" + type;
    }
    //console.log(order)
    location.href = url;
}

/**
 * �ֲ�ͼ
 */
$(".fullSlide").hover(function(){
    $(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.5)
},
function(){
    $(this).find(".prev,.next").fadeOut()
});
$(".fullSlide").slide({
    titCell: ".hd ul",
    mainCell: ".bd ul",
    effect: "fold",
    autoPlay: true,
    autoPage: true,
    trigger: "click",
    delayTime: 1000,
    interTime: 3000,
    startFun: function(i) {
        var curLi = jQuery(".fullSlide .bd li").eq(i);
        if ( !! curLi.attr("_src")) {
            curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
        }
    }
});

//lazyload����
$("img.lazyload").show().lazyload({ 
    threshold : 100,
    placeholder : "/public/images/icon/small_loading_default.png",
    effect : "fadeIn" ,
    effectspeed : 500,
    failure_limit : 10,
});

$(function(){
    //���ض������Ǹ�С��ť��js
    $('.toTop').hide();
    $(window).scroll(function() {
        if($(window).scrollTop() >= 100){
            $('.toTop').fadeIn(1000);
        }
        else{
            $('.toTop').fadeOut(1000);
        }
    });
    $('.toTop').click(function(){
        $('body,html').animate({scrollTop:0},1000,'swing');
    })
})

/**
 * �����ֹؼ�������
 */
function toSearch(){
    var keyword = $("#serachWord").val();
    var url = querySaleUrl + "/keyword/" + keyword;
    //alert(keyword)
    location.href = url ;
}