CREATE TABLE region (
    r_regionkey  decimal(2,0)  not null,
    r_name       char(25)      not null,
    r_comment    varchar(152)
);

CREATE TABLE nation (
    n_nationkey  decimal(3,0)  not null,
    n_name       char(25)      not null,
    n_regionkey  decimal(2,0)  not null,
    n_comment    varchar(152)
);