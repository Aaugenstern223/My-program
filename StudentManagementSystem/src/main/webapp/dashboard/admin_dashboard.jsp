<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员控制台</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
<div class="navbar">
    <a href="../student/admin_student_list.jsp">学生管理</a>
    <a href="../score/admin_score_list.jsp">成绩管理</a>
    <a href="../index.jsp">退出登录</a>
</div>
<div class="container">
    <h2>欢迎，<%= session.getAttribute("adminName") != null ? session.getAttribute("adminName") + "管理员" : "管理员" %>！</h2>
    <p>请使用上方导航链接管理系统。</p>
</div>
</body>
</html>
