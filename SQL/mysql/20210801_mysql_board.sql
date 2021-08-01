SELECT * FROM project.board;

insert into project.board (title, id, content)
values ('제목', '아이디', '내용');

select * from project.board;

update project.board set id='아이디', title='수정제목', content='수정내용' where boardidx=1;

delete from project.board where boardidx=1;

DROP TABLE project.board;

create table project.board (
	boardidx int not null auto_increment primary key,
    id varchar(20),
    title varchar(20),
    content text,
    hit int default 0,
    boardregdate timestamp default current_timestamp
);