package com.aa.studentmanagement.servlet;

import com.aa.studentmanagement.config.DatabaseConfig;
import com.aa.studentmanagement.mapper.StudentMapper;
import com.aa.studentmanagement.model.Student;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/Student")
public class StudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String flag = request.getParameter("flag");//1-学生;2管理员

        try (SqlSession session = DatabaseConfig.openSession()) {
            StudentMapper mapper = session.getMapper(StudentMapper.class);

            if ("add".equals(action)) {
                Student student = new Student();
                if("1".equals(flag)) {
                    student.setUserId(Integer.parseInt(request.getParameter("userId")));
                }


                student.setChineseName(request.getParameter("chineseName"));
                student.setEnglishName(request.getParameter("englishName"));
                student.setTel(request.getParameter("tel"));
                student.setStuClass(request.getParameter("stuClass"));
                student.setSemester(Integer.parseInt(request.getParameter("semester") == ""?"0":request.getParameter("semester")));
                student.setStuStatus("A");
                mapper.addStudent(student);
                session.commit();
                if("2".equals(flag)){
                    response.sendRedirect("student/admin_student_list.jsp?success=true");
                }else{
                    response.sendRedirect("student/student_list.jsp?success=true");
                }

            } else if ("update".equals(action)) {
                Student student = new Student();
                student.setStudentId(Integer.parseInt(request.getParameter("studentId")));
                student.setChineseName(request.getParameter("chineseName"));
                student.setEnglishName(request.getParameter("englishName"));
                student.setTel(request.getParameter("tel"));
                student.setStuClass(request.getParameter("stuClass"));
                student.setSemester(Integer.parseInt(request.getParameter("semester")));
                student.setStuStatus(request.getParameter("stuStatus"));

                mapper.updateStudent(student);
                session.commit();

                if("1".equals(flag)) {
                    response.sendRedirect("dashboard/student_dashboard.jsp?success=true");//返回学生首页
                }else if("2".equals(flag)) {
                    response.sendRedirect("student/admin_student_list.jsp?success=true");//返回管理员学生列表页面
                }else{
                    response.sendRedirect("student/student_list.jsp?success=true");//返回教师的学生列表页面
                }

            } else if ("delete".equals(action)) {
                int studentId = Integer.parseInt(request.getParameter("studentId"));
                mapper.deleteStudent(studentId);
                session.commit();
                if("2".equals(flag)) {
                    response.sendRedirect("student/admin_student_list.jsp?success=true");
                }else{
                    response.sendRedirect("student/student_list.jsp?success=true");
                }
            }
        }
    }
}