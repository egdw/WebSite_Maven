package com.website.test;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.core.NestedIOException;

import java.io.IOException;

/**
 * Created by hdy on 2017/8/13.
 */
public class BeanFactory extends SqlSessionFactoryBean {
    @Override
    protected SqlSessionFactory buildSqlSessionFactory() throws IOException {
        try {
            return super.buildSqlSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
            throw new NestedIOException("Failed to parse mapping resource:", e.getCause());
        }
    }
}
