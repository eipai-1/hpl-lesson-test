create table choose_course
(
    id              bigint auto_increment comment '主键'
        primary key,
    course_id       bigint       not null comment '课程id',
    course_name     varchar(32)  not null comment '课程名称',
    user_id         varchar(32)  not null comment '用户id',
    company_id      bigint       not null comment '机构id',
    order_type      varchar(32)  not null comment '选课类型',
    create_date     datetime     not null comment '添加时间',
    course_price    float(10, 2) not null comment '课程价格',
    valid_days      int          not null comment '课程有效期(天)',
    status          varchar(32)  not null comment '选课状态',
    validtime_start datetime     not null comment '开始服务时间',
    validtime_end   datetime     not null comment '结束服务时间',
    remarks         varchar(255) null comment '备注'
)
    collate = utf8mb4_general_ci
    row_format = DYNAMIC;

create table course_tables
(
    id               bigint auto_increment
        primary key,
    choose_course_id bigint       not null comment '选课记录id',
    user_id          varchar(64)  not null comment '用户id',
    course_id        bigint       not null comment '课程id',
    company_id       bigint       not null comment '机构id',
    course_name      varchar(64)  not null comment '课程名称',
    course_type      varchar(32)  null comment '课程类型',
    create_date      datetime     not null comment '添加时间',
    validtime_start  datetime     null comment '开始服务时间',
    validtime_end    datetime     not null comment '到期时间',
    update_date      datetime     null comment '更新时间',
    remarks          varchar(255) null comment '备注',
    constraint course_tables_unique
        unique (user_id, course_id)
)
    collate = utf8mb4_general_ci
    row_format = DYNAMIC;

create table learn_record
(
    id             bigint auto_increment
        primary key,
    course_id      bigint       not null comment '课程id',
    course_name    varchar(255) null comment '课程名称',
    user_id        varchar(64)  null comment '用户id',
    learn_date     datetime     null comment '最近学习时间',
    learn_length   bigint       null comment '学习时长',
    teachplan_id   bigint       null comment '章节id',
    teachplan_name varchar(255) null comment '章节名称',
    constraint learn_record_unique
        unique (course_id, user_id, teachplan_id)
)
    collate = utf8mb4_general_ci
    row_format = DYNAMIC;


