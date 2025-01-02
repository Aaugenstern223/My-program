package com.aa.studentmanagement.model;

public class Student {
    private int studentId;
    private String chineseName;
    private String englishName;
    private String tel;
    private String stuClass;
    private int semester;
    private float midMarks;
    private float endMarks;
    private String stuStatus;
    private int userId;

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getChineseName() {
        return chineseName;
    }

    public void setChineseName(String chineseName) {
        this.chineseName = chineseName;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getStuClass() {
        return stuClass;
    }

    public void setStuClass(String stuClass) {
        this.stuClass = stuClass;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
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

    public String getStuStatus() {
        return stuStatus;
    }

    public void setStuStatus(String stuStatus) {
        this.stuStatus = stuStatus;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}