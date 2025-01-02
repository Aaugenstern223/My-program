package com.aa.studentmanagement.config;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.Reader;

public class DatabaseConfig {
    private static SqlSessionFactory sqlSessionFactory;

    static {
        try {
            sqlSessionFactory = new org.apache.ibatis.session.SqlSessionFactoryBuilder()
                    .build(DatabaseConfig.class.getClassLoader().getResourceAsStream("mybatis-config.xml"));
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("初始化 SqlSessionFactory 失败");
        }
    }

    public static SqlSession openSession() {
        return sqlSessionFactory.openSession();
    }
}