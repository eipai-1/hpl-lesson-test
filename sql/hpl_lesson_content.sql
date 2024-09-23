create table course_audit
(
    id           bigint auto_increment
        primary key,
    course_id    bigint       not null comment '课程id',
    audit_mind   varchar(255) null comment '审核意见',
    audit_status varchar(10)  not null comment '审核状态',
    audit_people varchar(50)  null comment '审核人',
    audit_date   datetime     null comment '审核时间'
)
    collate = utf8mb4_general_ci
    row_format = DYNAMIC;

create table course_base
(
    id            bigint auto_increment comment '主键'
        primary key,
    company_id    bigint                  not null comment '机构ID',
    company_name  varchar(255)            null comment '机构名称',
    name          varchar(100)            not null comment '课程名称',
    users         varchar(500)            null comment '适用人群',
    tags          varchar(50)             null comment '课程标签',
    mt            varchar(20)             not null comment '大分类',
    st            varchar(20)             not null comment '小分类',
    grade         varchar(32)             not null comment '课程等级',
    teachmode     varchar(32)             not null comment '教育模式(common普通，record 录播，live直播等）',
    description   text                    null comment '课程介绍',
    pic           varchar(500)            null comment '课程图片',
    create_date   datetime                null comment '创建时间',
    change_date   datetime                null comment '修改时间',
    create_people varchar(50)             null comment '创建人',
    change_people varchar(50)             null comment '更新人',
    audit_status  varchar(10)             not null comment '审核状态',
    status        varchar(10) default '1' not null comment '课程发布状态 未发布  已发布 下线'
)
    comment '课程基本信息' charset = utf8mb3
                           row_format = DYNAMIC;

create table course_category
(
    id       varchar(20)             not null comment '主键'
        primary key,
    name     varchar(32)             not null comment '分类名称',
    label    varchar(32)             null comment '分类标签默认和名称一样',
    parentid varchar(20) default '0' not null comment '父结点id（第一级的父节点是0，自关联字段id）',
    is_show  tinyint                 null comment '是否显示',
    orderby  int                     null comment '排序字段',
    is_leaf  tinyint                 null comment '是否叶子'
)
    comment '课程分类' charset = utf8mb3
                       row_format = DYNAMIC;

create table course_market
(
    id             bigint       not null comment '主键，课程id'
        primary key,
    charge         varchar(32)  not null comment '收费规则，对应数据字典',
    price          float(10, 2) null comment '现价',
    original_price float(10, 2) null comment '原价',
    qq             varchar(32)  null comment '咨询qq',
    wechat         varchar(64)  null comment '微信',
    phone          varchar(32)  null comment '电话',
    valid_days     int          null comment '有效期天数'
)
    comment '课程营销信息' charset = utf8mb3
                           row_format = DYNAMIC;

create table course_publish
(
    id             bigint                  not null comment '主键'
        primary key,
    company_id     bigint                  not null comment '机构ID',
    company_name   varchar(255)            null comment '公司名称',
    name           varchar(100)            not null comment '课程名称',
    users          varchar(500)            not null comment '适用人群',
    tags           varchar(32)             null comment '标签',
    username       varchar(32)             null comment '创建人',
    mt             varchar(20)             not null comment '大分类',
    mt_name        varchar(255)            not null comment '大分类名称',
    st             varchar(20)             not null comment '小分类',
    st_name        varchar(255)            not null comment '小分类名称',
    grade          varchar(32)             not null comment '课程等级',
    teachmode      varchar(32)             not null comment '教育模式',
    pic            varchar(500)            not null comment '课程图片',
    description    text                    null comment '课程介绍',
    market         text                    null comment '课程营销信息，json格式',
    teachplan      text                    null comment '所有课程计划，json格式',
    teachers       text                    null comment '教师信息，json格式',
    create_date    datetime                null comment '发布时间',
    online_date    datetime                null comment '上架时间',
    offline_date   datetime                null comment '下架时间',
    status         varchar(10) default '1' null comment '发布状态',
    remark         varchar(500)            null comment '备注',
    charge         varchar(32)             null comment '收费规则，对应数据字典--203',
    price          float(10, 2)            null comment '现价',
    original_price float(10, 2)            null comment '原价',
    valid_days     int                     null comment '课程有效期天数'
)
    comment '课程发布' charset = utf8mb3
                       row_format = DYNAMIC;

create table course_publish_pre
(
    id             bigint                  not null comment '主键'
        primary key,
    company_id     bigint                  not null comment '机构ID',
    company_name   varchar(255)            null comment '公司名称',
    name           varchar(100)            not null comment '课程名称',
    users          varchar(500)            not null comment '适用人群',
    tags           varchar(32)             null comment '标签',
    username       varchar(32)             null comment '创建人',
    mt             varchar(20)             not null comment '大分类',
    mt_name        varchar(255)            not null comment '大分类名称',
    st             varchar(20)             not null comment '小分类',
    st_name        varchar(255)            not null comment '小分类名称',
    grade          varchar(32)             not null comment '课程等级',
    teachmode      varchar(32)             not null comment '教育模式',
    pic            varchar(500)            not null comment '课程图片',
    description    text                    null comment '课程介绍',
    market         text                    null comment '课程营销信息，json格式',
    teachplan      text                    null comment '所有课程计划，json格式',
    teachers       text                    null comment '教师信息，json格式',
    create_date    datetime                null comment '提交时间',
    audit_date     datetime                null comment '审核时间',
    status         varchar(10) default '1' null comment '状态',
    remark         varchar(500)            null comment '备注',
    charge         varchar(32)             null comment '收费规则，对应数据字典--203',
    price          float(10, 2)            null comment '现价',
    original_price float(10, 2)            null comment '原价',
    valid_days     int                     null comment '课程有效期天数'
)
    comment '课程发布' charset = utf8mb3
                       row_format = DYNAMIC;

create table course_teacher
(
    id           bigint auto_increment comment '主键'
        primary key,
    course_id    bigint        null comment '课程标识',
    teacher_name varchar(60)   null comment '教师标识',
    position     varchar(255)  null comment '教师职位',
    introduction varchar(1024) null comment '教师简介',
    photograph   varchar(1024) null comment '照片',
    create_date  datetime      null comment '创建时间',
    constraint courseid_teacherId_unique
        unique (course_id, teacher_name)
)
    comment '课程-教师关系表' collate = utf8mb4_general_ci
                              row_format = DYNAMIC;

create table mq_message
(
    id                 bigint auto_increment comment '消息id'
        primary key,
    message_type       varchar(32)              not null comment '消息类型代码: course_publish ,  media_test',
    business_key1      varchar(64)              null comment '关联业务信息',
    business_key2      varchar(255)             null comment '关联业务信息',
    business_key3      varchar(512)             null comment '关联业务信息',
    execute_num        int unsigned default '0' not null comment '通知次数',
    state              char         default '0' not null comment '处理状态，0:初始，1:成功',
    returnfailure_date datetime                 null comment '回复失败时间',
    returnsuccess_date datetime                 null comment '回复成功时间',
    returnfailure_msg  varchar(2048)            null comment '回复失败内容',
    execute_date       datetime                 null comment '最近通知时间',
    stage_state1       char         default '0' not null comment '阶段1处理状态, 0:初始，1:成功',
    stage_state2       char         default '0' not null comment '阶段2处理状态, 0:初始，1:成功',
    stage_state3       char         default '0' not null comment '阶段3处理状态, 0:初始，1:成功',
    stage_state4       char         default '0' not null comment '阶段4处理状态, 0:初始，1:成功'
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table mq_message_history
(
    id                 bigint                not null comment '消息id'
        primary key,
    message_type       varchar(32)           not null comment '消息类型代码',
    business_key1      varchar(64)           null comment '关联业务信息',
    business_key2      varchar(255)          null comment '关联业务信息',
    business_key3      varchar(512)          null comment '关联业务信息',
    execute_num        int unsigned          null comment '通知次数',
    state              int unsigned zerofill null comment '处理状态，0:初始，1:成功，2:失败',
    returnfailure_date datetime              null comment '回复失败时间',
    returnsuccess_date datetime              null comment '回复成功时间',
    returnfailure_msg  varchar(255)          null comment '回复失败内容',
    execute_date       datetime              null comment '最近通知时间',
    stage_state1       char                  null,
    stage_state2       char                  null,
    stage_state3       char                  null,
    stage_state4       char                  null
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table teachplan
(
    id            bigint auto_increment
        primary key,
    pname         varchar(64)      not null comment '课程计划名称',
    parentid      bigint           not null comment '课程计划父级Id',
    grade         smallint         not null comment '层级，分为1、2、3级',
    media_type    varchar(10)      null comment '课程类型:1视频、2文档',
    start_time    datetime         null comment '开始直播时间',
    end_time      datetime         null comment '直播结束时间',
    description   varchar(500)     null comment '章节及课程时介绍',
    timelength    varchar(30)      null comment '时长，单位时:分:秒',
    orderby       int  default 0   null comment '排序字段',
    course_id     bigint           not null comment '课程标识',
    course_pub_id bigint           null comment '课程发布标识',
    status        int  default 1   not null comment '状态（1正常  0删除）',
    is_preview    char default '0' null comment '是否支持试学或预览（试看）',
    create_date   datetime         null comment '创建时间',
    change_date   datetime         null comment '修改时间'
)
    comment '课程计划' charset = utf8mb3
                       row_format = DYNAMIC;

create table teachplan_media
(
    id             bigint auto_increment comment '主键'
        primary key,
    media_id       varchar(32)  null comment '媒资文件id',
    teachplan_id   bigint       not null comment '课程计划标识',
    course_id      bigint       not null comment '课程标识',
    media_fileName varchar(150) not null comment '媒资文件原始名称',
    create_date    datetime     null,
    create_people  varchar(60)  null comment '创建人',
    change_people  varchar(60)  null comment '修改人'
)
    collate = utf8mb4_general_ci
    row_format = DYNAMIC;

create table teachplan_work
(
    id            bigint auto_increment comment '主键'
        primary key,
    work_id       bigint      not null comment '作业信息标识',
    work_title    varchar(60) not null comment '作业标题',
    teachplan_id  bigint      not null comment '课程计划标识',
    course_id     bigint      null comment '课程标识',
    create_date   datetime    null,
    course_pub_id bigint      null
)
    collate = utf8mb4_general_ci
    row_format = DYNAMIC;


