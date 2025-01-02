<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.aa.studentmanagement.model.Score" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.aa.studentmanagement.config.DatabaseConfig" %>
<%@ page import="com.aa.studentmanagement.mapper.ScoreMapper" %>
<!DOCTYPE html>
<html>
<head>
    <title>编辑成绩</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
<div class="navbar">
    <a href="admin_score_list.jsp">返回列表</a>
</div>
<div class="container">
    <%
        int scoreId = Integer.parseInt(request.getParameter("id"));
        Score score = null;

        try (SqlSession sqlSession = DatabaseConfig.openSession()) {
            ScoreMapper mapper = sqlSession.getMapper(ScoreMapper.class);
            score = mapper.getScores().stream()
                    .filter(s -> s.getId() == scoreId)
                    .findFirst()
                    .orElse(null);
        }
    %>
    <% if (score != null) { %>
    <h2>编辑成绩</h2>
    <form action="../Score?flag=2" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= score.getId() %>">
        学生ID: <input type="number" name="studentId" value="<%= score.getStudentId() %>" readonly><br>
        期中成绩: <input type="number" step="0.01" name="midMarks" value="<%= score.getMidMarks() %>" required><br>
        期末成绩: <input type="number" step="0.01" name="endMarks" value="<%= score.getEndMarks() %>" required><br>
        <button type="submit">更新成绩</button>
    </form>
    <% } else { %>
    <h2>未找到成绩信息</h2>
    <a href="admin_score_list.jsp">返回成绩列表</a>
    <% } %>
</div>
</body>
</html>