<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.regex.*" %> 
<%@ page import="java.math.*" %> 
<% 
    if(!session.getAttribute("type").equals("admin")){
    	response.sendRedirect("diquick.jsp");
    	return;
    }
    if(!session.getAttribute("login").equals("ok")){
    	response.sendRedirect("diquick.jsp");
    }
     %>
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
	String tableName= request.getParameter("tab"); 
	//联结字符串 
	String url="jdbc:mysql://localhost/"+dbName+"?useUnicode=true&characterEncoding=utf-8&user="+userName+"&password="+userPasswd; 

	
	String id = request.getParameter("check");
	
	System.out.println(id);
	String regex = "\\d*";
	Pattern p = Pattern.compile(regex);

	Matcher m = p.matcher(id);
	
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	Connection connection=DriverManager.getConnection(url); 
	Statement statement = connection.createStatement(); 

	while (m.find()) {
	if (!"".equals(m.group())){
    String sql1 = "DELETE  FROM "+tableName+" WHERE id="+m.group();
	System.out.println(sql1);
	statement.executeUpdate(sql1);}
	}

	
	
	


	
		statement.close(); 
		connection.close(); 
		System.out.println("删除成功");
		response.setHeader("Refresh","2;url=manageOrg.jsp?id=1");
	
 

%>