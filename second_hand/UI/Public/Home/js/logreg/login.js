 function login(){  
	 $("#flagShow").html("");
      var userName=document.getElementById("username").value;  
      var pwd=document.getElementById("password").value;  
      var validcode=document.getElementById("validcode").value;  
      var matchResult=false;  
      var flagShow="";
      if(userName==""){  
    	  flagShow="用户账号不能为空！";
      }else if(pwd==""){  
    	  flagShow="用户密码不能为空！"; 
      }else if(validcode==""){  
    	  flagShow="验证码不能为空！";
      }else if(userName.length<6||userName.length>20){  
    	  flagShow="用户名长度应在6到20个字符之间！";
      }else if(pwd.length<6||pwd.length>20){  
    	  flagShow="密码或重复密码长度应在6到20个字符之间！"; 
      }else{
    	  matchResult=true;
      }
      
      if(matchResult==true){
      	  $.post("/TP/usersAction?method=login", {usersName:userName,password:pwd, validcode:validcode},function(data,status){
      	 	 var error=data.error;
      	 	 var result=data.result;  
  	     if(error=="error"){
  	         flagShow="验证码错误，请重新输入！";
      	 	 getPic();
  	         $("#flagShow").html(flagShow);
  	     }else{
  	    	 if(result=="3"){
  	  	     	location.href="indexInfo.html";
  	  	     }	else{
  	  	    	flagShow="登陆失败，请重新登录！";
  	      	 	 getPic();
  	  	    	$("#flagShow").html(flagShow);
  	  	     } 
  	     }
        },"json");
      }else{
    	  $("#flagShow").html(flagShow);
      }
  }
     
     $("#verifycode").click(function () {
         getPic();
     })
     
     function getPic(){ 
         $("#verifycode").attr("src","/TP/codePic?flag="+Math.random()); 
     }
     
     $(".reg_btn").click(function () {
         login();
     })