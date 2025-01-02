<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aa.studentmanagement.model.Score" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.aa.studentmanagement.config.DatabaseConfig" %>
<%@ page import="com.aa.studentmanagement.mapper.ScoreMapper" %>
<%@ page import="com.aa.studentmanagement.mapper.StudentMapper" %>
<%@ page import="com.aa.studentmanagement.model.Student" %>
<%@ page import="java.util.stream.Collectors" %>
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
    <a href="score_add.jsp">添加成绩</a>
    <a href="../dashboard/teacher_dashboard.jsp">返回首页</a>
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
            String tcrClass = (String) session.getAttribute("tcrClass");
            try (SqlSession sqlSession = DatabaseConfig.openSession()) {
                ScoreMapper scoreMapper = sqlSession.getMapper(ScoreMapper.class);
                StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
                List<Score> scores = scoreMapper.getScores();
                List<Student> students = studentMapper.getAllStudents();

                // 1. 获取 stuClass 等于 tcrClass 的学生的 studentId 集合
                List<Integer> studentIds = students.stream()
                        .filter(student -> tcrClass.equals(student.getStuClass())) // 过滤 stuClass 等于 tcrClass 的学生
                        .map(Student::getStudentId) // 提取 studentId
                        .collect(Collectors.toList()); // 收集为列表

                // 2. 筛选 scores 中 studentId 在上述集合内的 Score 实例
                List<Score> filteredScores = scores.stream()
                        .filter(score -> studentIds.contains(score.getStudentId())) // 过滤 studentId 在集合内的分数
                        .collect(Collectors.toList()); // 收集为列表

                for (Score score : filteredScores) {
        %>
        <tr>
            <td><%= score.getId() %></td>
            <td><%= score.getStudentId() %></td>
            <td><%= score.getMidMarks() %></td>
            <td><%= score.getEndMarks() %></td>
            <td>
                <form action="score_edit.jsp" method="post" style="display:inline;">
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