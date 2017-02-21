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

	String org_name =new String((request.getParameter("orgName")).getBytes("ISO-8859-1"),"UTF-8");	
	String address =new String((request.getParameter("address")).getBytes("ISO-8859-1"),"UTF-8");
	String contacts =new String((request.getParameter("contacts")).getBytes("ISO-8859-1"),"UTF-8");
	String contacts_phone =new String((request.getParameter("contactsPhone")).getBytes("ISO-8859-1"),"UTF-8");
	String account =new String((request.getParameter("account")).getBytes("ISO-8859-1"),"UTF-8");
	String remarks =new String((request.getParameter("remarks")).getBytes("ISO-8859-1"),"UTF-8");


	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	Connection connection=DriverManager.getConnection(url); 
	Statement statement = connection.createStatement(); 
	String sql1 = "SELECT * FROM "+tableName+" WHERE org_name='"+org_name+"'";
	ResultSet rs = statement.executeQuery(sql1);
	if(rs.next()){
		out.print("数据库中已有此单位");
		response.setHeader("Refresh","2;url=addOrganization.html");
	}else{
		String sql="INSERT INTO "+tableName+
			"(org_name,address,contacts,contacts_phone,account,remarks)"+
				" values('"+org_name+"','"+address+"','"+contacts+"','"+contacts_phone+"','"+account+"','"+remarks+"')";
		Statement stmt = connection.createStatement();
		stmt.executeUpdate(sql);


		stmt.close();
		statement.close(); 
		connection.close(); 
		out.print("保存成功！正在页面跳转！");
		response.setHeader("Refresh","2;url=addOrganization.html");
	}
 

%> 