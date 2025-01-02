<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        .login-card {
            width: 300px;
            margin: 0 auto;
            margin-top: 15%;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .success-message {
            width: 300px;
            margin: 10px auto;
            padding: 10px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            text-align: center;
            display: none; /* 默认隐藏 */
        }
    </style>
    <script>
        function showMessage(message) {
            const messageBox = document.getElementById("success-message");
            messageBox.innerText = message;
            messageBox.style.display = "block";

            // 5秒后隐藏消息
            setTimeout(() => {
                messageBox.style.display = "none";
            }, 5000);
        }
    </script>
</head>
<body>
<div class="navbar">
    <a href="#">主页</a>
</div>

<!-- 成功消息 -->
<div id="success-message" class="success-message"></div>

<div class="login-card">
    <h2 style="text-align: center;">用户登录</h2>
    <form action="Login" method="post">
        用户名: <input type="text" name="username" required><br>
        密码: <input type="password" name="password" required><br>
        <button type="submit" style="width: 100%;">登录</button>
    </form>
    <button onclick="window.location.href='register.jsp'" style="width: 100%; margin-top: 10px;">注册</button>
</div>

<%-- 显示提示信息（如果存在） --%>
<% if (request.getParameter("success") != null) { %>
<script>
    showMessage("注册成功！请登录");
</script>
<% } %>

<%-- 显示提示信息（如果存在） --%>
<% if (request.getParameter("register") != null) { %>
<script>
    showMessage("注册失败，用户名不可重复！");
</script>
<% } %>

<%-- 错误提示信息（如果存在） --%>
<% if (request.getParameter("error") != null) { %>
<script>
    alert("用户名或密码错误，请重试！");
</script>
<% } %>
</body>
</html>