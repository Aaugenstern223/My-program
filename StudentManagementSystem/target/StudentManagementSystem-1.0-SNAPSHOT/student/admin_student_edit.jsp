<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.aa.studentmanagement.model.Student" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.aa.studentmanagement.config.DatabaseConfig" %>
<%@ page import="com.aa.studentmanagement.mapper.StudentMapper" %>
<!DOCTYPE html>
<html>
<head>
    <title>编辑学生</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
<div class="navbar">
    <a href="admin_student_list.jsp">返回学生列表</a>
</div>
<div class="container">
    <%
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        Student student = null;
        try (SqlSession sqlSession = DatabaseConfig.openSession()) {
            StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
            student = mapper.getAllStudents().stream()
                    .filter(s -> s.getStudentId() == studentId)
                    .findFirst()
                    .orElse(null);
        }
    %>
    <% if (student != null) { %>
    <h2>编辑学生信息</h2>
    <form action="../Student?flag=2" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
        中文姓名: <input type="text" name="chineseName" value="<%= student.getChineseName() %>" required><br>
        英文姓名: <input type="text" name="englishName" value="<%= student.getEnglishName() %>" required><br>
        电话: <input type="text" name="tel" value="<%= student.getTel() %>" required><br>
        班级: <input type="text" name="stuClass" value="<%= student.getStuClass() %>" required><br>
        学期: <input type="number" name="semester" value="<%= student.getSemester() %>" required><br>
        状态:
        <select name="stuStatus">
            <option value="A" <%= "A".equals(student.getStuStatus()) ? "selected" : "" %>>在校</option>
            <option value="L" <%= "L".equals(student.getStuStatus()) ? "selected" : "" %>>离校</option>
        </select><br>
        <button type="submit">更新</button>
    </form>
    <% } else { %>
    <h2>未找到学生信息</h2>
    <% } %>
    <a href="admin_student_list.jsp">返回学生列表</a>
</div>
</body>
</html>