--liquibase formatted sql
--changeset User1:1
create table test1 (
                       id int primary key,
                       name varchar(255)
);
--rollback drop table test1;

--changeset User2:1
--preconditions onFail:CONTINUE onError:CONTINUE
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM test1
insert into test1 (id, name) values (1, 'User1');
--rollback delete from test1 where id = 1;