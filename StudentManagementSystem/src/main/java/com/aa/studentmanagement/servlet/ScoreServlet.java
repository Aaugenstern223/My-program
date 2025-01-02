package com.aa.studentmanagement.servlet;

import com.aa.studentmanagement.config.DatabaseConfig;
import com.aa.studentmanagement.mapper.ScoreMapper;
import com.aa.studentmanagement.model.Score;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Score")
public class ScoreServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String flag = request.getParameter("flag");

        try (SqlSession session = DatabaseConfig.openSession()) {
            ScoreMapper mapper = session.getMapper(ScoreMapper.class);

            if ("add".equals(action)) {
                Score score = new Score();
                score.setStudentId(Integer.parseInt(request.getParameter("studentId")));
                score.setMidMarks(Float.parseFloat(request.getParameter("midMarks")));
                score.setEndMarks(Float.parseFloat(request.getParameter("endMarks")));

                mapper.addScore(score);
                session.commit();
                if("2".equals(flag)){
                    response.sendRedirect("score/admin_score_list.jsp?success=true");
                }else{
                    response.sendRedirect("score/score_list.jsp?success=true");
                }
            } else if ("update".equals(action)) {
                Score score = new Score();
                score.setId(Integer.parseInt(request.getParameter("id")));
                score.setMidMarks(Float.parseFloat(request.getParameter("midMarks")));
                score.setEndMarks(Float.parseFloat(request.getParameter("endMarks")));

                mapper.updateScore(score);
                session.commit();
                if("2".equals(flag)){
                    response.sendRedirect("score/admin_score_list.jsp?success=true");
                }else{
                    response.sendRedirect("score/score_list.jsp?success=true");
                }
            }
        }catch(Exception e){
            if("2".equals(flag)){
                response.sendRedirect("score/admin_score_list.jsp?success=false");
            }else{
                response.sendRedirect("score/score_list.jsp?success=false");
            }
        }
    }
}