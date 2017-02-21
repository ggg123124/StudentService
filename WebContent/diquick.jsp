<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>DiQuick</title>
<meta name="keywords" content="Keywords">
<meta name="description" content="Description"> 

<link rel="stylesheet" href="css/diquick.css">
<link rel="stylesheet" href="js/fancybox/jquery.fancybox.css">

</head>
<style>

body {background-color:#f1f4f5;}
form {color:#333;}

/*--button--*/
.btn {background-color:#3f51b5;color:#fff;}
.btn:hover {color:#fff;}

/*--login--*/
.login {overflow:hidden;margin:8% auto 0 auto;max-width:450px;border-radius:.5rem;box-shadow:0 5px 25px 0 rgba(0, 0, 0, 0.16);}
.login>.title {padding:1.5rem 0;background-color:#3f51b5;color:#fff;text-align:center;font-size:1.75rem;}
.login>.content {padding:2rem;background-color:#fff;}

</style>

  


<body>

<!-- wrapper begin -->
<div class="wrapper">

    <!-- main begin -->
    <div class="main"> 
        <!-- login begin -->
        <div class="login">
            <div class="title">会计学院实习管理系统</div>
            <div class="content">
                <form action="NewFile.jsp" method="post" id="formId">
                    <ul class="form ratio100">
                        <li><span>学号/工号</span><div><i class="flaticon-user151"></i><input name="name" type="text" id = nameId></div></li>
                        <li><span>密码</span><div><i class="flaticon-locked44"></i><input name="pass" type="password" id = "passId"></div></li>
                    
                        <li><span>验证码<img src="Number.jsp"/> </span><div>  <input name="code" placeholder="请输入验证码" type="text" id = "codeId"></div></li>
                            
                         <span> 
                         	<select name = "type" id = "tpyeId" >
                    			<option value = "nul">登录身份</option>
                    			<option value="admin">管理员</option>
                    			<option value="teacher">教师</option>
                    			<option value="student">学生</option>
                			</select>
                		</span>
                        <span>   <a href="register.html" style="font-size:13px;">点击注册</a></span>
                        <li class="tc"><input type="button" value="登录" class="btn" onclick = "login()"></li>
                    </ul>
                </form>
            </div>
        </div>
        <!-- login end -->
    </div>

<!-- wrapper end -->

<script src="js/jquery.js"></script>
<script src="js/diquick.js"></script>
<script src="js/fancybox/jquery.fancybox.pack.js"></script>
<script src="js/md5.js"></script>
<script>
	function login(){
		var pass = document.getElementById("passId").value;
		var name = document.getElementById("nameId").value;
		var code = document.getElementById("codeId").value;
		var value = document.getElementById("tpyeId").value;
		if(pass == "" || name ==""){
			alert("用户名和密码不能为空")
		}else if(code == ""){
			alert("验证码不能为空")
		}else if(value == "nul"){
			alert("请选择身份")
		}else{
		document.getElementById("passId").value=hex_md5(pass); 
		document.getElementById("formId").submit();
		}
	}
</script>
</body>

</html>