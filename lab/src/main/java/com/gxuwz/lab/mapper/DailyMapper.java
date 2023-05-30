package com.gxuwz.lab.mapper;

import com.gxuwz.lab.entry.Dailyjob;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import java.util.List;


/**
 * 实验室技术人数据层
 */
@Mapper
@Component
public interface DailyMapper {

    /**
     * 获取全部招聘列表
     */


    //@Select("select * from dailyjob where time = #{time}")
    List<Dailyjob> getListByAssitantId(String userId);

    //@Select("select * from dailyjob")
    List<Dailyjob> getList();

    //@Insert("INSERT INTO dailyjob(weekly, time, user_id, content,systemTime) VALUES (#{weekly}, #{time}, #{userId}, #{content},#{systemTime})")
    void save(Dailyjob dailyjob);

    //@Update("UPDATE dailyjob set weekly=#{weekly}, content = #{content}WHERE id=#{id}")
    void updateById(Dailyjob dailyjob);


    //查询日期
    //@Select("select * from dailyjob where time = #{time}")
    List<Dailyjob> getLogByDatetime(String time);

}
