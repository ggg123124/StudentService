<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %> 
<%
	String code = request.getParameter("code");
	String type = request.getParameter("type");

	if(code.equals(session.getAttribute("rCode"))){
		out.print("验证码正确");
		//驱动程序名 
		String driverName="com.mysql.jdbc.Driver"; 
		//数据库用户名 
		String userName="root"; 
		//密码 
		String userPasswd="Shady5630049"; 
		//数据库名 
		String dbName="student_sys"; 
		//表名 
		String tableName = "";
		String fieldName = "";
		String element = "";
		switch(request.getParameter("type")){
			case "admin":
				tableName = "admin";
				fieldName = "admin_name";
				element = "admin_name";
			break;

			case "teacher":
				tableName = "teacher";
				fieldName = "teacher_number";
				element = "teacher_name";
			break;

			case "student":
				tableName = "student";
				fieldName = "student_number";
				element = "student_name";
			break;
		}
		//联结字符串 
		String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;

		String name = request.getParameter("name");
		String password = request.getParameter("pass");

		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		Connection connection=DriverManager.getConnection(url); 
		Statement statement = connection.createStatement(); 
		String sql="SELECT * FROM "+tableName+" WHERE "+fieldName+"="+name; 
		ResultSet rs = statement.executeQuery(sql); 
		//获得数据结果集合 
		ResultSetMetaData rmeta = rs.getMetaData(); 
		//确定数据集的列数，亦字段数 
		int numColumns=rmeta.getColumnCount(); 
		// 输出每一个数据值 

		if (rs.next()){
			if(password.equals(rs.getString("password"))){
				out.print("登录成功");
				session.setAttribute("login","ok");
				session.setAttribute("type", request.getParameter("type"));
				session.setAttribute("user", name);
        		session.setAttribute("uname",rs.getString(element));
				//TODO
				if(type.equals("admin")){
        			response.setHeader("Refresh","3;url=admin.jsp");   
				}else if(type.equals("teacher")){
					response.setHeader("Refresh", "3;url = teacher.jsp");
				}else if(type.equals("student")){
					response.setHeader("Refresh", "3;url = student.jsp");
				}else{
					out.print("发生身份异常，正在跳转");
					response.setHeader("Refresh", "3;url = diquick.jsp");
				}
			}else{
				out.print("用户名或密码错误");
				response.setHeader("Refresh","3;url=diquick.jsp");
			}
		}else{
			out.print("用户名或密码错误");
			response.setHeader("Refresh","3;url=diquick.jsp");
		}

		rs.close(); 
		statement.close(); 
		connection.close(); 
	}else{
		out.print("验证码错误");
		response.setHeader("Refresh","5;url=diquick.jsp");
	}
%> 


