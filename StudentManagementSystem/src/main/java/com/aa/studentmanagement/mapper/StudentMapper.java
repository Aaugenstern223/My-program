package com.aa.studentmanagement.mapper;

import com.aa.studentmanagement.model.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    // 查询所有学生
    List<Student> getAllStudents();

    List<Student> getStudentByUserId(@Param("studentId") int studentId);

    // 添加学生
    void addStudent(@Param("student") Student student);

    // 更新学生
    void updateStudent(@Param("student") Student student);

    // 删除学生
    void deleteStudent(@Param("studentId") int studentId);
}