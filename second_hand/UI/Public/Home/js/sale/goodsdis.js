$(document).ready(function(){
    //鼠标经过4个小图中的一个切换大图
    $('.smallpic img').click(function(){
        $('.bigpic img').removeClass('show').addClass('hidden');
        $('.bigpic img').eq($(this).index()).removeClass('hidden').addClass('show');
    });
    //异步提交吐槽
    $('.wotu').click(function(){
        if($(this).hasClass('yes')){
            $('.dialog-body').html('可是，您已经吐槽过了哦！');
            $('#alertdialog').trigger("click");
            return ;
        }
        wotu = $(this);
        $.ajax({
            url: wotuurl,    //请求的url地址
            dataType: "json",   //返回格式为json
            async: true, //请求是否异步，默认为异步，这也是ajax重要特性
            data: {'goodsid':$(this).attr('name')},    //参数值
            type: "POST",   //请求方式
            beforeSend: function() {
                //请求前的处理
            },
            success: function(data) {
                //请求成功时处理
                wotu.addClass('yes');
                wotu.children('span').html('+'+data.num);
                /*if(data.status == 1){
                    alert(data.content)
                }*/
            },
          /*  error: function(data){
                alert(data)
            }*/
        });
    })

    //异步提交点赞
    $('.wozan').click(function(){
        if($(this).hasClass('yes')){
            $('.dialog-body').html('可是，您已经点赞过了哦！');
            $('#alertdialog').trigger("click");
            return ;
        }
        //$('#favor').trigger("click")
        wotu = $(this);
        $.ajax({
            url: wozanurl,    //请求的url地址
            dataType: "json",   //返回格式为json
            async: true, //请求是否异步，默认为异步，这也是ajax重要特性
            data: {'goodsid':$(this).attr('name')},    //参数值
            type: "POST",   //请求方式
            beforeSend: function() {
                //请求前的处理
            },
            success: function(data) {
                //请求成功时处理
                wotu.addClass('yes');
                wotu.children('span').html('+'+data.num);
            },
        });
    })

});