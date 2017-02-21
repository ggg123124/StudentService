<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    if(!session.getAttribute("type").equals("admin")){
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


<!-- wrapper begin -->
<div class="wrapper">
    <!-- header begin -->
    <div class="header">
        <div class="shell">
        <!-- 这个菜单按钮非常愚蠢，妈的劳资写的什么捷豹玩意儿？之后将其改为一个更小的并且绘制在侧边栏上的小三角形按钮 -->
    	<input type="button" value="菜单" class="btn"  data-click="togglenavigation" style=" border:0px none">
        </div>
    </div>
    <!-- header end -->
    <!-- main begin -->
    <div class="main">
        <div class="shell">
      
            <div class="sidebar">

				


<div id="togglenavigation" class="toggle-nav relative active">
    <div class="media tc">
        <span class="box35 fc"><img src="./img/user.png" class="radius"></span>
        <dl>
            <dt><%= session.getAttribute("uname") %></dt>
  <dd id = "hours">Welcome！</dd>
            <dd><a href="logout.jsp" class="btn xs" >退出登录</a></dd>
        </dl>
    </div>
    <div class="menu accordion">
        <div><a href="home.jsp" target = "iframetab">主页</a></div>
        <div><a>实习单位管理</a>
            <ul>
                <li><a href="addOrganization.html" target = "iframetab">添加实习单位</a></li>
                <li><a href="manageOrg.jsp?id=1" target = "iframetab">管理现有实习单位</a></li>
            </ul>
        </div>
        <div><a>教师管理</a>
            <ul>
                <li><a href="addTeacher.html" target = "iframetab">添加新的教师账号</a></li>
                <li><a href="#">管理现有的教师账号</a></li>
                <li><a href="#">教师实习任务分配</a></li>
                <!-- TODO -->
            </ul>
        </div>
         <div><a>学生管理</a>
            <ul>
                <li><a href="#">学生成绩查询</a></li>
                <li><a href="#">学生作业查询</a></li>
                <li><a href="#">学生账号管理</a></li>
            </ul>
        </div>
      
         <div><a>管理员账号设置</a>
            <ul>
                <li><a href="#">修改当前管理员账号密码</a></li>
                <li><a href="#">添加管理员账号</a></li>
                <li><a href="#">删除</a></li>
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
			</div>
            <div class="container" >
            
            </div>
        </div>
    </div>
    <!-- main end -->
    
    <div class="main">
       
        <div class="container fl">
        <iframe id ="iframetabID" src = "home.jsp"  name = "iframetab"  frameBorder=0 scrolling=no width="100%" onLoad="iFrameHeight()" ></iframe>
        
        </div>
    </div>
    <!-- footer end -->
    <div class="footer">
        <div class="shell">
        
        </div>
    </div>
    <!-- footer end -->
</div>
<!-- wrapper end -->




<!-- wrapper end -->

<script src="js/jquery.js"></script>
<script src="js/diquick.js"></script>
<script src="js/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" language="javascript"> 
function iFrameHeight() { 
var ifm= document.getElementById("iframetabID"); 
var subWeb = document.frames ? document.frames["iframetabID"].document : ifm.contentDocument; 
if(ifm != null && subWeb != null) { 
ifm.height = subWeb.body.scrollHeight; 
} 
} 
</script>

</body>

</html>