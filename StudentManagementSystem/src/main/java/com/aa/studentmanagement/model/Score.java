package com.aa.studentmanagement.model;

public class Score {
    private int id;          // 成绩记录的唯一ID
    private int studentId;   // 学生ID（关联学生表）
    private float midMarks;  // 期中成绩
    private float endMarks;  // 期末成绩

    // Getters 和 Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public float getMidMarks() {
        return midMarks;
    }

    public void setMidMarks(float midMarks) {
        this.midMarks = midMarks;
    }

    public float getEndMarks() {
        return endMarks;
    }

    public void setEndMarks(float endMarks) {
        this.endMarks = endMarks;
    }
}