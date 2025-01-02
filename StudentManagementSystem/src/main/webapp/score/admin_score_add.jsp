<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加成绩</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
<div class="navbar">
    <a href="score_list.jsp">返回列表</a>
</div>
<div class="container">
    <h2>添加成绩</h2>
    <form action="../Score?flag=2" method="post">
        <input type="hidden" name="action" value="add">
        学生ID: <input type="number" name="studentId" required><br>
        期中成绩: <input type="number" step="0.01" name="midMarks" required><br>
        期末成绩: <input type="number" step="0.01" name="endMarks" required><br>
        <button type="submit">添加成绩</button>
    </form>
</div>
</body>
</html>