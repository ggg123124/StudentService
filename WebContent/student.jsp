<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% 
    if(!session.getAttribute("type").equals("student")){
    	response.sendRedirect("diquick.jsp");
    	return;
    }
    if(!session.getAttribute("login").equals("ok")){
    	response.sendRedirect("diquick.jsp");
    }
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>Title</title>
<meta name="keywords" content="Keywords">
<meta name="description" content="Description"> 

<link rel="stylesheet" href="css/diquick.css">
<link rel="stylesheet" href="js/fancybox/jquery.fancybox.css">

</head>

<style>
/*--panel--*/
.panel {border:0;border-radius:.375rem;}
.panel>.title {background-color:#fff;color:#333;}
.panel>.content {border-top:1px solid #f1f2f4;}
.panel>.action {color:#333;}

</style>

<body>

<!-- wrapper begin -->

<i data-click="togglenavigation" class="toggle-nav-btn flaticon-four92"></i>


<div id="togglenavigation" class="toggle-nav relative active">
    <div class="media tc">
        <span class="box35 fc"><img src="./img/user.png" class="radius"></span>
        <dl>
            <dt><%= session.getAttribute("uname") %></dt>
            <dd id = "hours">Wellcome！</dd>
            <dd><a href="logout.jsp" class="btn xs" >退出登录</a></dd>
        </dl>
    </div>
    <div class="menu accordion">
        <div><a href="#">主页</a></div>
        <div><a>实习管理</a>
            <ul>
                <li><a href="#">查看实习信息</a></li>
                <li><a href="#">填写实习报告</a></li>
                <li><a href="#">我的实习成绩</a></li>
            </ul>
        </div>
        <div><a>软件信息和权利声明</a>
            <ul>
                <li><a href="#">软件信息</a></li>
                <li><a href="#">权利声明</a></li>
            </ul>
        </div>
    </div>
    <i data-close="togglenavigation" class="flaticon-cross89"></i>
</div>
<div>
<iframe src = "home.jsp" FrameBorder = 0 width=100% height=100%></iframe>
</div>
<!-- wrapper end -->

<script src="js/jquery.js"></script>
<script src="js/diquick.js"></script>
<script src="js/fancybox/jquery.fancybox.pack.js"></script>



</body>

</html>