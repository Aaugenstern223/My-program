<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生控制台</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <style>
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
    <a href="../student/studentInfo.jsp?userId=<%= session.getAttribute("studentId") %>">个人信息</a>
    <a href="../index.jsp">退出登录</a>
</div>
<div class="container">
    <h2>欢迎，<%= session.getAttribute("studentName") != null ? session.getAttribute("studentName") + "学生" : "学生" %>！</h2>
    <p>请使用上方导航链接查看您的信息。</p>
</div>
<!-- 修改成功消息 -->
<div id="success-message" class="success-message"></div>
<%-- 显示提示信息（如果存在） --%>
<% if (request.getParameter("success") != null) { %>
<script>
    showMessage("操作成功!");
</script>
<% } %>
</body>
</html>
