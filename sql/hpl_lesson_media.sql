create table media_files
(
    id           varchar(32)             not null comment '文件id,md5值'
        primary key,
    company_id   bigint                  null comment '机构ID',
    company_name varchar(255)            null comment '机构名称',
    filename     varchar(255)            not null comment '文件名称',
    file_type    varchar(12)             null comment '文件类型（图片、文档，视频）',
    tags         varchar(120)            null comment '标签',
    bucket       varchar(128)            null comment '存储目录',
    file_path    varchar(512)            null comment '存储路径',
    file_id      varchar(32)             not null comment '文件id',
    url          varchar(1024)           null comment '媒资文件访问地址',
    username     varchar(60)             null comment '上传人',
    create_date  datetime                null comment '上传时间',
    change_date  datetime                null comment '修改时间',
    status       varchar(12) default '1' null comment '状态,1:正常，0:不展示',
    remark       varchar(32)             null comment '备注',
    audit_status varchar(12)             null comment '审核状态',
    audit_mind   varchar(255)            null comment '审核意见',
    file_size    bigint                  null comment '文件大小',
    constraint unique_fileid
        unique (file_id) comment '文件id唯一索引 '
)
    comment '媒资信息' charset = utf8mb3
                       row_format = DYNAMIC;

create table media_process
(
    id          bigint auto_increment
        primary key,
    file_id     varchar(120)  not null comment '文件标识',
    filename    varchar(255)  not null comment '文件名称',
    bucket      varchar(128)  not null comment '存储桶',
    file_path   varchar(512)  null comment '存储路径',
    status      varchar(12)   not null comment '状态,1:未处理，2：处理成功  3处理失败',
    create_date datetime      not null comment '上传时间',
    finish_date datetime      null comment '完成时间',
    url         varchar(1024) null comment '媒资文件访问地址',
    errormsg    varchar(1024) null comment '失败原因',
    constraint unique_fileid
        unique (file_id)
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table media_process_history
(
    id          bigint        not null
        primary key,
    file_id     varchar(120)  not null comment '文件标识',
    filename    varchar(255)  not null comment '文件名称',
    bucket      varchar(128)  not null comment '存储源',
    status      varchar(12)   not null comment '状态,1:未处理，2：处理成功  3处理失败',
    create_date datetime      not null comment '上传时间',
    finish_date datetime      not null comment '完成时间',
    url         varchar(1024) not null comment '媒资文件访问地址',
    file_path   varchar(512)  null comment '文件路径',
    errormsg    varchar(1024) null comment '失败原因'
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table mq_message
(
    id                 varchar(64)   not null comment '消息id'
        primary key,
    message_type       varchar(32)   not null comment '消息类型代码',
    business_key1      varchar(64)   null comment '关联业务信息',
    business_key2      varchar(255)  null comment '关联业务信息',
    business_key3      varchar(512)  null comment '关联业务信息',
    mq_host            varchar(32)   not null comment '消息队列主机',
    mq_port            int           not null comment '消息队列端口',
    mq_virtualhost     varchar(32)   not null comment '消息队列虚拟主机',
    mq_queue           varchar(32)   not null comment '队列名称',
    inform_num         int unsigned  not null comment '通知次数',
    state              char          not null comment '处理状态，0:初始，1:成功',
    returnfailure_date datetime      null comment '回复失败时间',
    returnsuccess_date datetime      null comment '回复成功时间',
    returnfailure_msg  varchar(2048) null comment '回复失败内容',
    inform_date        datetime      null comment '最近通知时间',
    stage_state1       char          null comment '阶段1处理状态, 0:初始，1:成功',
    stage_state2       char          null comment '阶段2处理状态, 0:初始，1:成功',
    stage_state3       char          null comment '阶段3处理状态, 0:初始，1:成功',
    stage_state4       char          null comment '阶段4处理状态, 0:初始，1:成功'
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table mq_message_history
(
    id                 varchar(64)           not null comment '消息id'
        primary key,
    message_type       varchar(32)           not null comment '消息类型代码',
    business_key1      varchar(64)           null comment '关联业务信息',
    business_key2      varchar(255)          null comment '关联业务信息',
    business_key3      varchar(512)          null comment '关联业务信息',
    mq_host            varchar(32)           not null comment '消息队列主机',
    mq_port            int                   not null comment '消息队列端口',
    mq_virtualhost     varchar(32)           not null comment '消息队列虚拟主机',
    mq_queue           varchar(32)           not null comment '队列名称',
    inform_num         int unsigned zerofill null comment '通知次数',
    state              int unsigned zerofill null comment '处理状态，0:初始，1:成功，2:失败',
    returnfailure_date datetime              null comment '回复失败时间',
    returnsuccess_date datetime              null comment '回复成功时间',
    returnfailure_msg  varchar(255)          null comment '回复失败内容',
    inform_date        datetime              null comment '最近通知时间',
    stage_state1       char                  null,
    stage_state2       char                  null,
    stage_state3       char                  null,
    stage_state4       char                  null
)
    charset = utf8mb3
    row_format = DYNAMIC;


