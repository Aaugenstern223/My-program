<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.aa.studentmanagement.model.Student" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.aa.studentmanagement.config.DatabaseConfig" %>
<%@ page import="com.aa.studentmanagement.mapper.StudentMapper" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>编辑学生</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
<div class="navbar">
    <a href="../dashboard/student_dashboard.jsp">返回首页</a>
</div>
<div class="container">
    <%
        int studentId = Integer.parseInt(request.getParameter("userId"));
        List<Student> studentList = null;
        try (SqlSession sqlSession = DatabaseConfig.openSession()) {
            StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
            studentList = mapper.getStudentByUserId(studentId);
        }
        Student student = studentList.size() == 0 ? null : studentList.get(0);
    %>
    <h2>编辑学生信息</h2>
    <form action="../Student?flag=1" method="post">

    <% if (student != null) { %>
        <input type="hidden" name="action" value="update">
    <% } else { %>
        <input type="hidden" name="action" value="add">
    <% } %>
        <input type="hidden" name="userId" value="<%= request.getParameter("userId") %>">
        <input type="hidden" name="studentId" value="<%= student == null ? "" : student.getStudentId() %>">
        中文姓名: <input type="text" name="chineseName" value="<%= student == null ? "" : student.getChineseName() %>" required><br>
        英文姓名: <input type="text" name="englishName" value="<%= student == null ? "" : student.getEnglishName() %>" required><br>
        电话: <input type="text" name="tel" value="<%= student == null ? "" : student.getTel() %>" required><br>
        班级:
        <input type="text" name="stuClass" value="<%= student == null ? "" : student.getStuClass() %>" readonly style="background-color: #f0f0f0;"><br>
        学期:
        <input type="number" name="semester" value="<%= student == null ? "" : student.getSemester() %>" readonly style="background-color: #f0f0f0;"><br>
        状态:
        <select name="stuStatus" disabled style="background-color: #f0f0f0;">
            <option value="A" <%= "A".equals(student == null ? "" : student.getStuStatus()) ? "selected" : "" %>>在校</option>
            <option value="L" <%= "L".equals(student == null ? "" : student.getStuStatus()) ? "selected" : "" %>>离校</option>
        </select>
        <!-- 通过隐藏字段传递状态值 -->
        <input type="hidden" name="stuStatus" value="<%= student == null ? "" : student.getStuStatus() %>"><br>
        <button type="submit">更新</button>
    </form>
    <a href="../dashboard/student_dashboard.jsp">返回首页</a>
</div>
</body>
</html>
