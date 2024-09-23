create table dictionary
(
    id          bigint auto_increment comment 'id标识'
        primary key,
    name        varchar(32) null comment '数据字典名称',
    code        varchar(32) null comment '数据字典代码',
    item_values text        null comment '数据字典项--json格式
  ',
    constraint tb_code_unique
        unique (code)
)
    comment '数据字典' collate = utf8mb4_general_ci
                       row_format = DYNAMIC;


