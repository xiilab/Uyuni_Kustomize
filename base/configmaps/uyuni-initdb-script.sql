create table if not exists TB_CODE
(
    ID           bigint auto_increment
        primary key,
    CONSTRUCTOR  varchar(255)  null,
    MOD_DATE     datetime(6)   null,
    REG_DATE     datetime(6)   null,
    DESCRIPTION  varchar(255)  null,
    DOWNLOAD_WAY varchar(255)  null,
    EXECUTE      varchar(2048) null,
    FILE_SIZE    bigint        null,
    NAME         varchar(255)  null,
    NODETYPE     varchar(255)  null,
    PATH         varchar(255)  null,
    REAL_PATH    varchar(255)  null,
    STATUS       varchar(255)  null,
    URL          varchar(255)  null
);
create table if not exists TB_CONFIG
(
    id               bigint auto_increment
        primary key,
    AUTO_CONFIG      varchar(255) null,
    LANGUAGE         varchar(255) null,
    NETWORK_TYPE     varchar(255) null,
    PROJECT_DEL_AUTH varchar(255) null
);
create table if not exists TB_DATASET
(
    ID           bigint auto_increment
        primary key,
    CONSTRUCTOR  varchar(255) null,
    MOD_DATE     datetime(6)  null,
    REG_DATE     datetime(6)  null,
    DESCRIPTION  varchar(255) null,
    DOWNLOAD_WAY varchar(255) null,
    FILE_SIZE    bigint       null,
    NAME         varchar(255) null,
    PATH         varchar(255) null,
    REAL_PATH    varchar(255) null,
    STATUS       varchar(255) null,
    URL          varchar(255) null
);
create table if not exists TB_IMAGE
(
    ID                    bigint auto_increment
        primary key,
    CONSTRUCTOR           varchar(255) null,
    MOD_DATE              datetime(6)  null,
    REG_DATE              datetime(6)  null,
    IMAGE_AUTHORITY       varchar(255) null,
    DESCRIPTION           varchar(255) null,
    LOG                   varchar(255) null,
    IMAGE_NAME            varchar(255) null,
    NODE_TYPE             varchar(255) null,
    IMAGE_REPOSITORY_TYPE varchar(255) null,
    SECRET_NAME           varchar(255) null,
    STATUS                varchar(255) null,
    TAG                   varchar(255) null,
    URL                   varchar(255) null
);
create table if not exists TB_IMAGE_COMMAND
(
    id       bigint auto_increment
        primary key,
    command  varchar(255) null,
    image_ID bigint       null,
    constraint FKco60uanpw5aky32co1cfpt5ee
        foreign key (image_ID) references TB_IMAGE (ID)
);
create table if not exists TB_IMAGE_LIBRARY
(
    id       bigint auto_increment
        primary key,
    name     varchar(255) null,
    version  varchar(255) null,
    image_ID bigint       null,
    constraint FKbyuy8f3fpfio6cfjkgcg8dkty
        foreign key (image_ID) references TB_IMAGE (ID)
);
create table if not exists TB_NODE
(
    id       bigint auto_increment
        primary key,
    gpuCount int          not null,
    gpuYN    bit          not null,
    nodeIp   varchar(255) null,
    nodeName varchar(255) null,
    priority int          not null
);
create table if not exists TB_NODE_GPU
(
    id               bigint auto_increment
        primary key,
    gpuIndex         bigint       null,
    gpuInstanceIndex bigint       null,
    gpuMem           varchar(255) null,
    gpuStatus        varchar(255) null,
    migStrategy      varchar(255) null,
    productName      varchar(255) null,
    node_id          bigint       null,
    constraint FKrl0yywwwficd419gp8s4imbsy
        foreign key (node_id) references TB_NODE (id)
);
create table if not exists TB_NOTI
(
    id                bigint auto_increment
        primary key,
    dateTime          datetime(6)  null,
    message           varchar(255) null,
    messageLevel      varchar(255) null,
    readYN            bit          not null,
    receiverFirstName varchar(255) null,
    receiverLastName  varchar(255) null,
    receiverUserName  varchar(255) null,
    senderFirstName   varchar(255) null,
    senderLastName    varchar(255) null,
    senderUserName    varchar(255) null,
    serviceType       varchar(255) null
);
create table if not exists TB_PORT
(
    id       bigint auto_increment
        primary key,
    execute  varchar(255) null,
    name     varchar(255) null,
    port     int          null,
    image_ID bigint       null,
    constraint FKi29kx0hqfu7427k5qiuoyr86h
        foreign key (image_ID) references TB_IMAGE (ID)
);
create table if not exists TB_PROJECT
(
    ID          bigint auto_increment
        primary key,
    CONSTRUCTOR varchar(255) null,
    MOD_DATE    datetime(6)  null,
    REG_DATE    datetime(6)  null,
    CMD         varchar(255) null,
    CODE_CMD    varchar(255) null,
    END_DATE    datetime(6)  null,
    LIMIT_CPU   varchar(255) null,
    LIMIT_MEM   varchar(255) null,
    NAME        varchar(255) null,
    NODE_PORT   int          null,
    OUTPUT_PATH varchar(255) null,
    REAL_NAME   varchar(255) null,
    REQUEST_CPU varchar(255) null,
    REQUEST_MEM varchar(255) null,
    START_DATE  datetime(6)  null,
    STATUS      varchar(255) null,
    code_ID     bigint       null,
    image_ID    bigint       null,
    constraint FK24srqtx4ttjbwrqud20o69aow
        foreign key (image_ID) references TB_IMAGE (ID),
    constraint FK8on4ok820a48cwi0g6xnug69g
        foreign key (code_ID) references TB_CODE (ID)
);
create table if not exists TB_ENV
(
    ID          bigint auto_increment
        primary key,
    CONSTRUCTOR varchar(255) null,
    MOD_DATE    datetime(6)  null,
    REG_DATE    datetime(6)  null,
    NAME        varchar(255) null,
    VALUE       varchar(255) null,
    project_ID  bigint       null,
    constraint FKpyts369729u6d56310a5d15ao
        foreign key (project_ID) references TB_PROJECT (ID)
);
create table if not exists TB_PROJECT_DATASET
(
    ID         bigint auto_increment
        primary key,
    mountPath  varchar(255) null,
    dataset_ID bigint       null,
    project_ID bigint       null,
    constraint FKpw2mgf6e3glpx0p5svxux97ko
        foreign key (dataset_ID) references TB_DATASET (ID),
    constraint FKrt7gu7e4xbalhwm8rj9wvka7g
        foreign key (project_ID) references TB_PROJECT (ID)
);
create table if not exists TB_PROJECT_GPU
(
    id         bigint auto_increment
        primary key,
    endDate    datetime(6)  null,
    gpuStatus  varchar(255) null,
    startDate  datetime(6)  null,
    gpu_id     bigint       null,
    project_ID bigint       null,
    constraint FK8609egoc7baq2lv4lyhiapdpk
        foreign key (gpu_id) references TB_NODE_GPU (id),
    constraint FKfhlgnx0ynqtuvwtvnexhbh5vr
        foreign key (project_ID) references TB_PROJECT (ID)
);
create table if not exists TB_PROJECT_PORT
(
    id          bigint auto_increment
        primary key,
    CONSTRUCTOR varchar(255) null,
    MOD_DATE    datetime(6)  null,
    REG_DATE    datetime(6)  null,
    name        varchar(255) null,
    nodePort    int          not null,
    port        int          not null,
    project_ID  bigint       null,
    constraint FKrnguiu9li72notswi8dqr7wpi
        foreign key (project_ID) references TB_PROJECT (ID)
);
create table if not exists TB_TOOL
(
    id       bigint auto_increment
        primary key,
    execute  varchar(255) null,
    port     int          not null,
    toolName varchar(255) null
);
create table if not exists TB_USER
(
    userId    varchar(255) not null
        primary key,
    firstName varchar(255) null,
    lastName  varchar(255) null,
    userName  varchar(255) null
);

