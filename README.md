# springboot-LAB

#### 介绍

实验室管理系统，无框架，spring boot

#### 软件架构

：某学校拟开发一套实验室助理工作管理系统，实现实验室助理工作信息的
管理。需求描述如下：第 3 页 共 4 页
（1）学校实验室分为公共基础实验室和专业技术实验室，专业技术实验室由各二
级学院负责管理，公共基础实验室由教务处负责管理。一个部门有多名实验技术员，
一名实验技术员只属于一个部门，实验技术员可以管理多个实验室，但是一个实验
室只有一名实验技术员。
（2）实验技术员先填写实验室助理招聘计划并提交到学生工作处审核，学生工作
处审核过程中可以修改招聘人数，招聘计划信息包括招聘计划编号、计划名称、岗
位要求、招聘人数、申请部门、申请人等。
（3）学生在线应聘实验助理岗位需要先注册成为系统用户，注册用户信息包括学
号、密码、姓名、专业、学院、班级、年级、手机号、邮箱、个人照片。
（4）学生注册用户成功并登录系统后，可以在线查看实验室助理招聘计划信息和
填写报名信息。报名信息包括报名编号、岗位名称、技能描述、申请人、申请时间
等。每个学生只能应聘一个岗位，如果应聘的人数超过岗位招聘人数，系统拒绝报
名请求。
（5）实验技术员可以查看应聘本实验室助理岗位的报名信息并筛选进入面试环节
的人员名单。学生可以在线查看自己是否进入面试环节。面试结束后，实验技术员
录入面试结果并建立录用人员的档案信息，录入人员档案信息包括人员编号、学号、
密码、姓名、专业、学院、班级、年级、手机号、邮箱、个人照片，所属实验室等。
学生可以查看面试结果。
（6）实验室助理可以记录每天工作内容，工作内容包括安全卫生检查情况和设备
运行情况。工作内容信息包括周次、时间（年/月/日）、星期、人员编号、工作内
容、系统时间。实验技术员可以按日期查询实验室助理的工作内容。实验室助理可
以在线填写实验教学仪器设备维修申请，申请信息包括设备名称、设备编号、型号、
故障现象描述、报修时间、报修人。实验室技术员可以查看本实验室的设备维修申
请并导出实验教学仪器设备维修申报表

#### 安装教程

1. IDE运行
2. 修改数据库密码账号

#### 运行效果

![
](https://images.gitee.com/uploads/images/2021/0627/161255_1cfe664a_5479964.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/0627/161315_4ee44041_5479964.png "屏幕截图.png")

![输入图片说明](https://images.gitee.com/uploads/images/2021/0627/161324_a2388a71_5479964.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/0627/161332_fd056a3c_5479964.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/0627/161346_e7c167a8_5479964.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/0627/161409_9c9487ae_5479964.png "屏幕截图.png")



要求：

> 1）排课管理：实验室管理老师可以编辑实验室设备硬件配置信息、软件安装情况，上课老师可以线上预约实验室上课，并进一步给出实验环境要求。学生可以查询课表获取实验课安排情况及相关实验要求。
>
> 2）上课管理：学生进入实验室上课，需选择实验设备设定位置信息，老师或者助教通过位置信息可记录学生实验情况和相关问题，或者碰到设备问题可向管理员咨询或者反馈。
>
> 3）下课管理：学生实验结果保存及上交，下次实验可继续使用。
>
> 4) 系统定期（每日）汇总问题发送邮件知会管理员





# 项目运行指南：

## 后端

1. 用maven下载依赖

2. 在自己的数据库中先添加一个库hsj666

3. 使用命令行运行导入其lab.sql

4. 修改application.yaml有关数据库的url

```yaml
    url: jdbc:mysql://localhost:3306/lab?useSSL=false&autoReconnect=true&characterEncoding=UTF-8
```

修改为

```yaml
    url: jdbc:mysql://localhost:3306/hsj666?useSSL=false&autoReconnect=true&characterEncoding=UTF-8
```



## 前端

1. 卸载node.js
2. 参考这个博客[项目太多，node.js多版本环境解决方案 - 掘金 (juejin.cn)](https://juejin.cn/post/7094426560085639199)下载nvm

3. 运行``nvm install 16.0.0``
4. 运行``nvm use 16.0.0``
5. 工作目录移动到labui，执行``npm install``，``npm run serve``



# 项目后端API整理

- `GET /daily/timeSearchLog/{time}`: 根据日期查询日志。
- `GET /daily/list`: 获取日志列表。
- `GET /daily/list/{userId}`: 根据用户ID获取日志列表。
- `POST /daily/add/{userId}`: 添加日志。
- `POST /daily/update`: 更新日志。

- `GET /form/signUp/{id}/{userId}`: 用户报名。
- `GET /form/review/{id}`: 查看某招聘计划中的面试者。
- `GET /form/interview/{planId}/{userId}/{num}`: 面试。

- `GET /labs/getList`: 获取实验室列表。
- `POST /labs/save`: 保存实验室信息。
- `POST /labs/update`: 更新实验室信息。
- `DELETE /labs/deleteById/{id}`: 根据ID删除实验室。

- `POST /userlogin/login`: 用户登录。
- `POST /userlogin/upload`: 上传图片。
- `GET /userlogin/getImage/{name}`: 获取图片。

- `GET /recruit/list`: 获取招聘计划列表。
- `GET /recruit/studentgetlist`: 获取学生招聘计划列表。
- `POST /recruit/update`: 更新招聘计划。
- `POST /recruit/add`: 添加招聘计划。
- `DELETE /recruit/deleteById/{id}`: 根据ID删除招聘计划。
- `GET /recruit/check/{id}/{num}`: 审核招聘计划。

- `GET /repair/list`: 获取报修单列表。
- `GET /repair/list/{userId}`: 根据用户ID获取报修单列表。
- `POST /repair/add/{userId}`: 添加报修单。
- `POST /repair/update`: 更新报修单。

- `POST /User/reg`: 学生用户注册。
- `GET /User/getUserList`: 获取管理员用户列表。
- `GET /User/getUserList2`: 获取技术人员管理档案。
- `POST /User/save`: 保存用户信息。
- `DELETE /User/deleteById/{userId}`: 根据ID删除用户。
- `POST /User/update`: 更新用户信息。

# 数据库表设计：

实验室表（Lab）：包含实验室ID、名称、硬件配置信息和软件安装情况等字段。 

预约表（Reservation）：包含预约ID、实验室ID、上课老师ID、预约时间段、实验环境，预约情况要求等字段。

课程表（Course）：包含课程ID、预约ID、课程名称、预约时间段等字段。 

学生表（Student）：包含学生ID、姓名、班级ID等字段。 

实验结果表（ExperimentResult）：包含实验结果ID、学生ID等字段。

 问题反馈表（Issue）：包含问题反馈ID、选课ID、问题描述、反馈时间等字段。

```sql
-- 设置编码
SET NAMES utf8mb4;

-- 创建实验室表
CREATE TABLE Lab (
    id INT PRIMARY KEY COMMENT '实验室ID',
    name VARCHAR(255) COMMENT '实验室名称',
    hardware_info TEXT COMMENT '硬件配置信息',
    software_info TEXT COMMENT '软件安装情况'
) COMMENT='实验室表';

-- 创建预约表
CREATE TABLE Reservation (
    id INT PRIMARY KEY COMMENT '预约ID',
    lab_id INT COMMENT '实验室ID',
    teacher_id INT COMMENT '上课老师ID',
    reservation_time_slot_code INT COMMENT '预约时间段',
    requirements TEXT COMMENT '实验环境要求',
    reservation_status VARCHAR(255) COMMENT '预约情况',
    FOREIGN KEY (lab_id) REFERENCES Lab(id)
) COMMENT='预约表';

-- 创建课程表
CREATE TABLE Course (
    id INT PRIMARY KEY COMMENT '课程ID',
    reservation_id INT COMMENT '预约ID',
    name VARCHAR(255) COMMENT '课程名称',
    reservation_time_slot_code INT COMMENT '预约时间段',
    FOREIGN KEY (reservation_id) REFERENCES Reservation(id)
) COMMENT='课程表';

-- 创建学生表
CREATE TABLE Student (
    id INT PRIMARY KEY COMMENT '学生ID',
    name VARCHAR(255) COMMENT '学生姓名',
    class_id INT COMMENT '班级ID'
) COMMENT='学生表';

-- 创建实验结果表
CREATE TABLE ExperimentResult (
    id INT PRIMARY KEY COMMENT '实验结果ID',
    student_id INT COMMENT '学生ID',
    location VARCHAR(255) COMMENT '文件存放位置'
    FOREIGN KEY (student_id) REFERENCES Student(id)
) COMMENT='实验结果表';

-- 创建问题反馈表
CREATE TABLE Issue (
    id INT PRIMARY KEY COMMENT '问题反馈ID',
    enrollment_id INT,
    description TEXT COMMENT '问题描述',
    feedback_time DATETIME COMMENT '反馈时间'
) COMMENT='问题反馈表';


```

