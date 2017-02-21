<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %> 

<% 
	//驱动程序名 
	String driverName="com.mysql.jdbc.Driver"; 
	//数据库用户名 
	String userName="root"; 
	//密码 
	String userPasswd="Shady5630049"; 
	//数据库名 
	String dbName="student_sys"; 
	//表名 
	String tableName="organization"; 
	//联结字符串 
	String url="jdbc:mysql://localhost/"+dbName+"?useUnicode=true&characterEncoding=utf-8&user="+userName+"&password="+userPasswd; 
	
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	Connection connection=DriverManager.getConnection(url); 
	Statement statement = connection.createStatement(); 
	String sql1 = "SELECT * FROM "+tableName;
	ResultSet rs = statement.executeQuery(sql1);
	rs.last();
	int length = rs.getRow();
	rs.beforeFirst();
	int page2 = length/12;
	System.out.println("数据量为："+length+" 页面数为"+page2+1);
	System.out.println("请求的页面为："+request.getParameter("id"));
	Integer id =  Integer.parseInt(request.getParameter("id"))-1;
	rs.absolute(12*id+1);
	int a;
	
	
%>
<!DOCTYPE html>
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

<body>

<!-- wrapper begin -->



         <!-- panel begin -->
            <div class="box100 plr">
                <div class="panel">
                    <div class="title">管理单位信息</div>
                    <div class="content">
                    
                        <button type="button" class="btn xs mb5 bg-333" data-click="mask" data-target="del_confirm">删除选中</button>
                        
                        <form class="box-s100 ib fr">
                            <ul class="form">
                                <li><span>查询:</span><div><input name="search" type="text"></div></li>
                                <li><button type="submit" class="btn xs">查询</button></li>
                            </ul>
                        </form>
                        
                        <!-- order begin -->
                        <div class="table-scroll nowrap">
                            <table class="table hover">
                                <thead>
                                    <tr>
                                     
                                     <th>单位名称</th>
            						 <th>单位地址</th>
           					 		 <th>联系人</th>
           				 			 <th>联系电话</th>
           							 <th>银行账户</th>
           							 <th>备注</th>
           							 <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%while(rs.next()&&rs.getRow()<=13*(id+1)){ 
                                	String string = rs.getString("account");%>
                                    <tr>
                                        
                                        <td><input type="checkbox"><%=rs.getString("org_name") %></td>
            							<td><%=rs.getString("address") %></td>
           								<td><%=rs.getString("contacts") %></td>
            							<td><%=rs.getString("contacts_phone") %></td>
            							<td id=<%=rs.getRow()-1 %>><%=rs.getString("account") %></td>
            							<td><%=rs.getString("remarks") %></td>
                                        <td><button id="edit_dialog_btn" href="#edit_dialog" type="button" class="btn xs">Edit</button>


                                        <a class="btn xs bg-333"href="Delete.jsp?name=<%=string %>&tab=organization&column=org_name">删除</a>

                                        </td>
                                    </tr>
                                <%} 
      		
								statement.close(); 
								connection.close(); %>
                                </tbody>
                            </table>
                        </div>
                        <!-- order end -->
                        
                     
                        
                        <ul class="page fr">
                            <li class="disabled"><a href="#">Prev</a></li>
                            <li class="active"><%for(a = 0;a<=page2;a++){%><li><a href="manageOrg.jsp?id=<%=a+1 %>" id = "<%=a+1 %>"><%=a+1 %></a></li><%} %>
                            
                            <li><a href="#">Next</a></li>
                        </ul>

                    </div>
                </div>
            </div>
         <div id="edit_dialog" class="dialog hide">
        <h6 class="tc mb5">修改</h6>
        <div class="msg error"><i class="flaticon-exclamation26"></i>请输入修改的内容</div>
        <form name="edit_content">
            <ul class="form ratio100">       
                <li><span>Title</span><div><input name="title" type="text"></div></li>
                <li><span>Menu</span>
                    <div>
                        <select name="menu1">
                            <option value="1">menu1</option>
                        </select>
                        <select name="menu2">	
                            <option value="1">menu2</option>
                        </select>
                    </div>
                </li>
                <li><span>Content</span><div><textarea name="content"></textarea></div></li>
                <li class="tc"><button type="button" class="btn">Submit</button></li>
            </ul>
        </form>
    </div>
    
    <div id="del_confirm" class="mask">
        <div class="content">
            <p class="c-fff fs3">Please confirm that you want to delete this content.</p>
            <button type="button" class="btn xs">Confirm</button>
            <button type="button" class="btn xs" data-close="mask">Cancel</button>
        </div>
        <i data-close="mask" class="flaticon-cross89"></i>
    </div>

            
            <!-- panel end -->
<!-- wrapper end -->

<script src="js/jquery.js"></script>
<script src="js/diquick.js"></script>
<script src="js/fancybox/jquery.fancybox.pack.js"></script>
<script>
$(function(){
	
	//toggle nav small
	if ((document.body.clientWidth < 750)) {
		$("[data-click='togglenavigation']").click();
	}

	//dialog
	$("#edit_dialog_btn,#slider_img").fancybox({
	});
	
});
</script>


</body>

</html>