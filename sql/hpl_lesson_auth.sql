create table company
(
    id          varchar(32)  not null
        primary key,
    linkname    varchar(64)  null comment '联系人名称',
    name        varchar(128) not null comment '名称',
    mobile      varchar(11)  not null,
    email       varchar(128) not null,
    intro       varchar(512) null comment '简介',
    logo        varchar(128) null comment 'logo',
    identitypic varchar(128) null comment '身份证照片',
    worktype    varchar(32)  null comment '工具性质',
    businesspic varchar(128) null comment '营业执照',
    status      varchar(32)  null comment '企业状态'
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table menu
(
    id          varchar(64)  not null
        primary key,
    code        varchar(255) null comment '菜单编码',
    p_id        varchar(255) null comment '父菜单ID',
    menu_name   varchar(255) null comment '名称',
    url         varchar(255) null comment '请求地址',
    is_menu     char         null comment '是否是菜单',
    level       int          null comment '菜单层级',
    sort        int          null comment '菜单排序',
    status      char         null,
    icon        varchar(255) null,
    create_time datetime     null,
    update_time datetime     null,
    constraint FK_CODE
        unique (code)
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table oauth_access_token
(
    token_id          varchar(256) null,
    token             blob         null,
    authentication_id varchar(48)  not null
        primary key,
    user_name         varchar(256) null,
    client_id         varchar(256) null,
    authentication    blob         null,
    refresh_token     varchar(256) null
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table oauth_approvals
(
    userId         varchar(256)                        null,
    clientId       varchar(256)                        null,
    scope          varchar(256)                        null,
    status         varchar(10)                         null,
    expiresAt      timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    lastModifiedAt timestamp                           not null
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table oauth_client_details
(
    client_id               varchar(48)   not null
        primary key,
    resource_ids            varchar(256)  null,
    client_secret           varchar(256)  null,
    scope                   varchar(256)  null,
    authorized_grant_types  varchar(256)  null,
    web_server_redirect_uri varchar(256)  null,
    authorities             varchar(256)  null,
    access_token_validity   int           null,
    refresh_token_validity  int           null,
    additional_information  varchar(4096) null,
    autoapprove             varchar(256)  null
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table oauth_client_token
(
    token_id          varchar(256) null,
    token             blob         null,
    authentication_id varchar(48)  not null
        primary key,
    user_name         varchar(256) null,
    client_id         varchar(256) null
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table oauth_code
(
    code           varchar(256) null,
    authentication blob         null
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table oauth_refresh_token
(
    token_id       varchar(256) null,
    token          blob         null,
    authentication blob         null
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table permission
(
    id          varchar(32)  not null
        primary key,
    role_id     varchar(32)  not null,
    menu_id     varchar(255) not null,
    create_time datetime     null,
    constraint xu_permission_unique
        unique (role_id, menu_id)
)
    charset = utf8mb3
    row_format = DYNAMIC;

create index fk_xc_permission_menu_id
    on permission (menu_id);

create table role
(
    id          varchar(32)  not null
        primary key,
    role_name   varchar(255) null,
    role_code   varchar(255) null,
    description varchar(255) null,
    create_time datetime     null,
    update_time datetime     null,
    status      char         not null,
    constraint unique_role_name
        unique (role_name),
    constraint unique_role_value
        unique (role_code)
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table user
(
    id          varchar(64)  not null
        primary key,
    username    varchar(45)  not null,
    password    varchar(96)  null,
    salt        varchar(45)  null,
    wx_unionid  varchar(128) null comment '微信unionid',
    nickname    varchar(255) null comment '昵称',
    name        varchar(45)  not null,
    userpic     varchar(255) null comment '头像',
    company_id  varchar(32)  null,
    utype       varchar(32)  not null,
    birthday    datetime     null,
    sex         char         null,
    email       varchar(45)  null,
    cellphone   varchar(45)  null,
    qq          varchar(32)  null,
    status      varchar(32)  not null comment '用户状态',
    create_time datetime     not null,
    update_time datetime     null,
    constraint unique_user_username
        unique (username)
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table company_user
(
    id         varchar(32) not null
        primary key,
    company_id varchar(32) not null,
    user_id    varchar(32) not null,
    constraint xc_company_user_unique
        unique (company_id, user_id),
    constraint FK_xc_company_user_company_id
        foreign key (company_id) references company (id),
    constraint FK_xc_company_user_user_id
        foreign key (user_id) references user (id)
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table teacher
(
    id      varchar(32)   not null
        primary key,
    user_id varchar(32)   not null comment '用户id',
    name    varchar(64)   not null comment '称呼',
    intro   varchar(512)  null comment '个人简介',
    resume  varchar(1024) null comment '个人简历',
    pic     varchar(128)  null comment '老师照片',
    constraint xu_teacher_user_id
        unique (user_id),
    constraint fk_xc_teacher_user_id
        foreign key (user_id) references user (id)
)
    charset = utf8mb3
    row_format = DYNAMIC;

create table user_role
(
    id          varchar(64)  not null
        primary key,
    user_id     varchar(64)  null,
    role_id     varchar(32)  null,
    create_time datetime     null,
    creator     varchar(255) null
)
    charset = utf8mb3
    row_format = DYNAMIC;

create index index_role_id
    on user_role (role_id);


