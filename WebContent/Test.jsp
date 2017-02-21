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
	String tableName="student"; 
	//联结字符串 
	String url="jdbc:mysql://localhost/"+dbName+"?useUnicode=true&characterEncoding=utf-8&user="+userName+"&password="+userPasswd; 

	String student_name =new String((request.getParameter("user_name")).getBytes("ISO-8859-1"),"UTF-8");	
	String student_mail = request.getParameter("user_mail");
	String student_phone_number = request.getParameter("user_phone_number");
	String password = request.getParameter("user_pass");
	String student_number = request.getParameter("user_number");

	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	Connection connection=DriverManager.getConnection(url); 
	Statement statement = connection.createStatement(); 
	String sql1 = "SELECT * FROM "+tableName+" WHERE student_number ="+student_number;
	ResultSet rs = statement.executeQuery(sql1);
	if(rs.next()){
		out.print("此学号已被注册，请查证！");
		response.setHeader("Refresh","3;url=register.html");
	}else{
		String sql="INSERT INTO "+tableName+
			"(student_number,password,student_name,student_mail,student_phone_number)"+
				" values('"+student_number+"','"+password+"','"+student_name+"','"+student_mail+"','"+student_phone_number+"')";
		Statement stmt = connection.createStatement();
		stmt.executeUpdate(sql);


		stmt.close();
		statement.close(); 
		connection.close(); 
		out.print("注册成功！正在页面跳转！");
		response.setHeader("Refresh","3;url=diquick.jsp");
	}
 

%> 