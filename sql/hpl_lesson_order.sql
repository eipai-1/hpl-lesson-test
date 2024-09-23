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

create table orders
(
    id              bigint        not null comment '订单号'
        primary key,
    total_price     float(8, 2)   not null comment '总价',
    create_date     datetime      not null comment '创建时间',
    status          varchar(32)   not null comment '交易状态',
    user_id         varchar(32)   not null comment '用户id',
    order_type      varchar(32)   not null comment '订单类型',
    order_name      varchar(255)  null comment '订单名称',
    order_descrip   varchar(255)  not null comment '订单描述',
    order_detail    varchar(1024) not null comment '订单明细json',
    out_business_id varchar(64)   not null comment '外部系统业务id',
    constraint orders_unioue
        unique (out_business_id) comment '外部系统的业务id'
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table orders_goods
(
    id           bigint auto_increment
        primary key,
    order_id     bigint        not null comment '订单号',
    goods_id     varchar(64)   not null comment '商品id',
    goods_type   varchar(32)   null comment '商品类型',
    goods_name   varchar(100)  not null comment '商品名称',
    goods_price  float(10, 2)  not null comment '商品交易价，单位分',
    goods_detail varchar(1024) null comment '商品详情json'
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table pay_record
(
    id               bigint auto_increment comment '主键'
        primary key,
    pay_no           bigint       not null comment '本系统支付交易号',
    out_pay_no       varchar(64)  null comment '第三方支付交易流水号',
    out_pay_channel  varchar(255) null comment '第三方支付渠道编号',
    order_id         bigint       not null comment '商品订单号',
    order_name       varchar(255) not null comment '订单名称',
    total_price      float(8, 2)  not null comment '订单总价单位元',
    currency         varchar(50)  not null comment '币种CNY',
    create_date      datetime     not null comment '创建时间',
    status           varchar(32)  not null comment '支付状态',
    pay_success_time datetime     null comment '支付成功时间',
    user_id          varchar(32)  not null comment '用户id',
    constraint pay_order_unioue
        unique (out_pay_no) comment '第三方支付订单号',
    constraint pay_order_unioue2
        unique (pay_no) comment '本系统支付交易号'
)
    charset = utf8mb3
    row_format = DYNAMIC;


