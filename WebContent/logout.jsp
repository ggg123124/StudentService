<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %> 
<% 
 session.invalidate();
 response.setHeader("Refresh", "0;url = diquick.jsp");
%>