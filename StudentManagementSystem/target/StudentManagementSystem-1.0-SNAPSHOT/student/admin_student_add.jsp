<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
<div class="navbar">
    <a href="admin_student_list.jsp">返回列表</a>
</div>
<div class="container">
    <h2>添加学生</h2>
    <form action="../Student?flag=2" method="post">
        <input type="hidden" name="action" value="add">
        中文姓名: <input type="text" name="chineseName" required><br>
        英文姓名: <input type="text" name="englishName" required><br>
        电话: <input type="text" name="tel" required><br>
        班级: <input type="text" name="stuClass" required><br>
        学期: <input type="number" name="semester" required><br>
        <button type="submit">添加</button>
    </form>
</div>
</body>
</html>