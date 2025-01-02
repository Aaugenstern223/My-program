package com.aa.studentmanagement.mapper;

import com.aa.studentmanagement.model.Score;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScoreMapper {
    // 查询所有成绩
    List<Score> getScores();

    // 添加成绩
    void addScore(@Param("score") Score score);

    // 更新成绩
    void updateScore(@Param("score") Score score);
}