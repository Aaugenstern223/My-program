<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aa.studentmanagement.model.Score" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.aa.studentmanagement.config.DatabaseConfig" %>
<%@ page import="com.aa.studentmanagement.mapper.ScoreMapper" %>
<!DOCTYPE html>
<html>
<head>
    <title>成绩列表</title>
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
    <a href="admin_score_add.jsp">添加成绩</a>
    <a href="../dashboard/admin_dashboard.jsp">返回首页</a>
</div>
<div class="container">
    <h2>成绩列表</h2>
    <table class="table">
        <tr>
            <th>ID</th>
            <th>学生ID</th>
            <th>期中成绩</th>
            <th>期末成绩</th>
            <th>操作</th>
        </tr>
        <%
            try (SqlSession sqlSession = DatabaseConfig.openSession()) {
                ScoreMapper scoreMapper = sqlSession.getMapper(ScoreMapper.class);
                List<Score> scores = scoreMapper.getScores();

                for (Score score : scores) {
        %>
        <tr>
            <td><%= score.getId() %></td>
            <td><%= score.getStudentId() %></td>
            <td><%= score.getMidMarks() %></td>
            <td><%= score.getEndMarks() %></td>
            <td>
                <form action="admin_score_edit.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<%= score.getId() %>">
                    <button type="submit">编辑</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</div>
</body>
<!-- 修改成功消息 -->
<div id="success-message" class="success-message"></div>
<%-- 显示提示信息（如果存在） --%>
<% if (request.getParameter("success") != null) { %>
<script>
    showMessage("操作成功!");
</script>
<% } else { %>
<script>
    showMessage("该学生不存在，操作失败!");
</script>
<% } %>
</html>