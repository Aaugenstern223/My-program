<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aa.studentmanagement.model.Student" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.aa.studentmanagement.config.DatabaseConfig" %>
<%@ page import="com.aa.studentmanagement.mapper.StudentMapper" %>
<%@ page import="java.util.stream.Collectors" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生列表</title>
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
    <a href="student_add.jsp">添加学生</a>
    <a href="../dashboard/teacher_dashboard.jsp">返回首页</a>
</div>

<div class="container">
    <h2>学生列表</h2>
    <table class="table">
        <tr>
            <th>ID</th>
            <th>中文姓名</th>
            <th>英文姓名</th>
            <th>电话</th>
            <th>班级</th>
            <th>学期</th>
            <th>状态[A,在校;L,离校]</th>
            <th>操作</th>
        </tr>
        <%
            String tcrClass = (String) session.getAttribute("tcrClass");
            try (SqlSession sqlSession = DatabaseConfig.openSession()) {
                StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
                List<Student> students = studentMapper.getAllStudents();

                List<Student> filteredStudents = students.stream()
                        .filter(student -> tcrClass.equals(student.getStuClass()))
                        .collect(Collectors.toList());

                for (Student student : filteredStudents) {
        %>
        <tr>
            <td><%= student.getStudentId() %></td>
            <td><%= student.getChineseName() %></td>
            <td><%= student.getEnglishName() %></td>
            <td><%= student.getTel() %></td>
            <td><%= student.getStuClass() %></td>
            <td><%= student.getSemester() %></td>
            <td><%= student.getStuStatus() %></td>
            <td>
                <form action="student_edit.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
                    <button type="submit">编辑</button>
                </form>
                <form action="../Student" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
                    <button type="submit">删除</button>
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
<% } %>
</html>
