package com.aa.studentmanagement.servlet;

import com.aa.studentmanagement.config.DatabaseConfig;
import com.aa.studentmanagement.mapper.UserMapper;
import com.aa.studentmanagement.model.User;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (SqlSession sqlSession = DatabaseConfig.openSession()) {
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

            if ("register".equals(action)) {
                try{
                    // 注册功能
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String role = request.getParameter("role");
                    String tcrClass = request.getParameter("tcrClass");

                    userMapper.addUser(username, password, role, tcrClass);
                    sqlSession.commit();

                    // 注册成功后跳转到登录页面并附带成功提示参数
                    response.sendRedirect("index.jsp?success=true");
                    return;
                }catch (Exception e) {
                    // 注册失败
                    response.sendRedirect("index.jsp?register=false");
                    return;
                }


            }

            // 登录功能
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = userMapper.getUserByUsernameAndPassword(username, password);

            if (user != null) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("username", user.getUsername());
                httpSession.setAttribute("role", user.getRole());

                // 根据角色跳转到不同的控制台
                switch (user.getRole()) {
                    case "admin":
                        httpSession.setAttribute("adminName", user.getUsername());
                        httpSession.setAttribute("adminId", user.getId());
                        response.sendRedirect("dashboard/admin_dashboard.jsp");
                        break;
                    case "teacher":
                        httpSession.setAttribute("teacherName", user.getUsername());
                        httpSession.setAttribute("teacherId", user.getId());
                        httpSession.setAttribute("tcrClass", user.getTcrClass());
                        response.sendRedirect("dashboard/teacher_dashboard.jsp");
                        break;
                    case "student":
                        httpSession.setAttribute("studentName", user.getUsername());
                        httpSession.setAttribute("studentId", user.getId());
                        response.sendRedirect("dashboard/student_dashboard.jsp");
                        break;
                }
            } else {
                // 登录失败
                response.sendRedirect("index.jsp?error=true");
            }
        }
    }
}