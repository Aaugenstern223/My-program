<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        .register-card {
            width: 300px;
            margin: 0 auto;
            margin-top: 15%; /* 居中 */
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        #class-field {
            display: none; /* 默认隐藏班级字段 */
        }
    </style>
    <script>
        function toggleClassField() {
            // 获取角色下拉框的值
            var role = document.getElementById("role").value;
            // 获取班级输入框容器
            var classField = document.getElementById("class-field");
            // 如果角色是教师，则显示班级输入框，否则隐藏
            if (role === "teacher") {
                classField.style.display = "block";
            } else {
                classField.style.display = "none";
            }
        }
    </script>
</head>
<body>
<div class="navbar">
    <a href="index.jsp">返回登录</a>
</div>
<div class="register-card">
    <h2 style="text-align: center;">用户注册</h2>
    <form action="Login" method="post">
        <input type="hidden" name="action" value="register">
        用户名: <input type="text" name="username" required><br>
        密码: <input type="password" name="password" required><br>
        角色:
        <select name="role" id="role" onchange="toggleClassField()" required>
            <option value="student">学生</option>
            <option value="teacher">教师</option>
        </select><br>
        <div id="class-field">
            班级: <input type="text" name="tcrClass"><br>
        </div>
        <button type="submit" style="width: 100%;">注册</button>
    </form>
</div>
</body>
</html>