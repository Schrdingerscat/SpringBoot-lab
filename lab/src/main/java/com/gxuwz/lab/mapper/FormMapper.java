package com.gxuwz.lab.mapper;

import com.gxuwz.lab.entry.Form;
import com.gxuwz.lab.entry.Recruitment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;


/**
 * 实验室技术人数据层
 * 
 * 
 */
@Mapper
@Component
public interface FormMapper {

    /**
     * 获取全部招聘列表
     */


    public void signup(Integer planId, String userId);

    public Form isExist(Integer planId, String userId);

//    @Select("SELECT f.*, u.user_name, r.plan_name " +
//            "FROM " +
//            "USER u, " +
//            "form f, recruitment r " +
//            "WHERE " +
//            "f.user_id = u.user_id " +
//            "AND f.plan_id = r.id AND plan_id=#{planId} ")
//    @Results(id = "FormResult",value ={
//            @Result(property = "id", column = "id", id = true),
//            @Result(property = "planId", column = "plan_id"),
//            @Result(property = "planName", column = "plan_name"),
//            @Result(property = "userId", column = "user_id"),
//            @Result(property = "userName", column = "user_name"),
//            @Result(property = "status", column = "status")
//    }
//    )
    List<Form> getReviewByRecruitId(Integer planId);

    void interview(Integer planId, String userId, Integer status);
}
