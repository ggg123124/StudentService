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
	String tableName="teacher"; 
	//联结字符串 
	String url="jdbc:mysql://localhost/"+dbName+"?useUnicode=true&characterEncoding=utf-8&user="+userName+"&password="+userPasswd; 
	
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	Connection connection=DriverManager.getConnection(url); 
	Statement statement = connection.createStatement(); 
	String sql1 = "SELECT * FROM "+tableName;
	ResultSet rs1 = statement.executeQuery(sql1);
	rs1.last();
	int length = rs1.getRow();
	int page2 = length/12;
	System.out.println("数据量为："+length+" 页面数为"+page2+1);
	System.out.println("请求的页面为："+request.getParameter("id"));
	Integer id =  Integer.parseInt(request.getParameter("id"))-1;
	rs1.absolute(12*id+1);
	ResultSet rs = statement.executeQuery(sql1);
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
                        
                        <form class="box-s100 ib fr" action = "teacherFind.jsp?id=1" method="post" id="formId">
                            <ul class="form" >
                                <li><span>查询:</span><div><input  type="text" name = "keyward"></div></li>
                                <li><button type="submit" class="btn xs">查询</button></li>
                            </ul>
                        </form>
                        
                        <!-- order begin -->
                        <div class="table-scroll nowrap">
                            <table class="table hover">
                                <thead>
                                    <tr>
                                     
                                     <th>教师姓名</th>
            						 <th>教师工号</th>
           					 		 <th>教师邮箱</th>
           				 			 <th>联系电话</th>       							 
           							 <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                              
                                <%while(rs.next()&&rs.getRow()<=13*(id+1)){ 
                                	
                                	a=rs.getRow()-1;%>
                                    <tr>
                                        
                                        <td id=<%=rs.getString("id")%>>
                                        			<input type="checkbox" name = "check" value = "<%=rs.getString("id") %>">
                                        			<input type="hidden" name = "tab" value = "teacher"/>					
                                        <%=rs.getString("teacher_name") %></td>
                     
            							<td id=<%="address"+a%>><%=rs.getString("teacher_number") %></td>
           								<td id=<%="contacts"+a%>><%=rs.getString("teacher_mail") %></td>
            							<td id=<%="contacts_phone"+a%>><%=rs.getString("teacher_phone_number") %></td>
            							         							
                                      <!--   <td><button id="edit_dialog_btn" href="#edit_dialog" type="button" class="btn xs" >修改</button>--> 

										<td>
                                        <a class="btn xs bg-333"href="Delete.jsp?tab=organization&check=<%=rs.getString("id") %>">删除</a>

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
                <li><span>单位名称</span><div><input name="orgName" type="text" id = "orgNameId" value = ></div></li>
                <li><span>单位地址</span><div><input type="text" name = "address" id = "addressId"></div></li>
        		<li><span>联系人姓名</span><div><input type="text" name = "contacts" id = "contactsId"></div></li>
       		 	<li><span>联系方式</span><div><input type="text" name = "contactsPhone" id = "contactsPhoneId"></div></li>
        		<li><span>银行账户</span><div><input type="text" name = "account" id = "accountId"></div></li>
        		<li><span>再次输入银行账户</span><div><input type="text" name = "accountAga" id = "accountAgaId"></div></li>
        		<li><span>备注</span><div><textarea name = "remarks"></textarea></div></li>
                
                <li class="tc"><button type="button" class="btn">Submit</button></li>
            </ul>
        </form>
    </div>
    
    <div id="del_confirm" class="mask">
        <div class="content">
            <p class="c-fff fs3">Please confirm that you want to delete this content.</p>
            <button type="button" class="btn xs" onclick = "checkData()">Confirm</button>
            <button type="button" class="btn xs" data-close="mask">Cancel</button>
        </div>
        <i data-close="mask" class="flaticon-cross89"></i>
    </div>
    <div id="hidden" align="center" style="display:'none'">
	<form id="deleteformId"  action = "Delete.jsp" method="post">
	<input type="hidden" id="a" name = "check"/>
	<input type="hidden" name = "tab" value = "teacher"/>	
	</form>
	</div>

            
            <!-- panel end -->
<!-- wrapper end -->

<script src="js/jquery.js"></script>
<script src="js/diquick.js"></script>
<script src="js/fancybox/jquery.fancybox.pack.js"></script>
<!-- 此页面修改功能还未实现，以后再慢慢更新，这里有点懒得写了
<script>
function modify(string id){
	var name = document.getElementById("name"+id);
	var address = document.getElementById("address"+id);
	var contacts = document.getElementById("contacts"+id);
	var contacts_phone = document.getElementById("contacts_phone"+id);
	var account = document.getElementById("account"+id);
	var remarks = document.getElementById("remarks"+id);
	//TODO 数据传入
	
	
}--> 
<script type="text/javascript">
function submit(){
	document.getElementById("deleteformId").submit();
}
function checkData(){ 
	var arr=document.getElementsByName("check");
	for(i=0;i<arr.length;i++){
		if(arr[i].checked){
			document.getElementById("a").value += arr[i].value+",";
		}
	}
	
	
	document.getElementById("deleteformId").submit();
}	
	
	
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