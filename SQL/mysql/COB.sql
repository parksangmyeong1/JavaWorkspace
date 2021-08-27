create table member1(
memIdx int not null auto_increment primary key,
memId varchar(20) not null,
nickName varchar(20) unique key not null,
memPassword varchar(20) not null,
memName varchar(20) not null,
memBirth timestamp,
memGender boolean,
memAddress varchar(255),
memTel varchar(15) not null,
memEmail varchar(40) not null,
memPhoto varchar(255) default 'photo.png',
memAuth int default 1
);
drop table member1;

insert into member1 (memId, nickName, memPassword, memName, memBirth, memTel, memEmail) 
values('park', 'park', '1111', 'park', '950324', '010-3903-5854','park@gmail.com');
insert into member1 (memId, nickName, memPassword, memName, memBirth, memTel, memEmail) 
values('test1', 'nick1', '1111', 'test1', '111111', '010-1111-1111','test1@gmail.com');
insert into member1 (memId, nickName, memPassword, memName, memBirth, memTel, memEmail) 
values('test2', 'nick2', '2222', 'test2', '121212', '010-2222-2222','test2@gmail.com');
insert into member1 (memId, nickName, memPassword, memName, memBirth, memTel, memEmail) 
values('test3', 'nick3', '3333', 'test3', '131113', '010-3333-3333','test3@gmail.com');
insert into member1 (memId, nickName, memPassword, memName, memBirth, memTel, memEmail) 
values('test4', 'nick4', '4444', 'test4', '161013', '010-4444-4444','test4@gmail.com');

create table post(
postIdx int not null auto_increment primary key,
memIdx int not null,
postWriter varchar(20) not null,
views int not null,
postTitle varchar(20) not null,
postContent text not null,
postSort varchar(20) not null,
postRegDate timestamp default current_timestamp not null,
postLike int not null default 0,
postDislike int not null default 0,
postRep int not null default 0,
constraint fk_memIdx foreign key(memIdx) references member1(memIdx),
constraint fk_nickname foreign key(postWriter) references member1(nickName)
);

drop table post;

insert into post (memIdx, views, postWriter, postTitle, postContent, postSort, postLike, postDisLike, postRep) 
values(1, 20, 'nick1', '첫번째 테스트 게시글', '첫번째 게시글의 내용', '잡담', 20, 1, 2);
insert into post (memIdx, views, postWriter, postTitle, postContent, postSort, postLike, postDisLike, postRep) 
values(1, 20, 'nick2', '두번째 테스트 게시글', '두번째 게시글의 내용', '잡담', 2032, 16, 2);
insert into post (memIdx, views, postWriter, postTitle, postContent, postSort, postLike, postDisLike, postRep) 
values(2, 20, 'nick3', '세번째 테스트 게시글', '세번째 게시글의 내용', '잡담', 2016, 12, 20);
insert into post (memIdx, views, postWriter, postTitle, postContent, postSort, postLike, postDisLike, postRep) 
values(3, 20, 'nick4', '네번째 테스트 게시글', '네번째 게시글의 내용', '잡담', 2320, 100, 22);
insert into post (memIdx, views, postWriter, postTitle, postContent, postSort, postLike, postDisLike, postRep) 
values(4, 20, 'nick1', '다섯번째 테스트 게시글', '다섯번째 게시글의 내용', '잡담', 200, 10, 20);
insert into post (memIdx, views, postWriter, postTitle, postContent, postSort, postLike, postDisLike, postRep) 
values(4, 20, 'park', '검색용 가나다라', '마바사아', '잡담', 200, 10, 20);
insert into post (memIdx, views, postWriter, postTitle, postContent, postSort, postLike, postDisLike, postRep) 
values(5, 10, 'park', '검색용 자차카', '타파하', '잡담', 200, 10, 20);

select * from post limit 2; -- 제한 2개
select * from post where postTitle like '%가%';	-- 제목으로 찾기
select * from post where postTitle like '%두%' or postContent like '%파%';	-- 제목, 내용으로 검색
select * from member1 where nickName like '%3%';	-- 닉네임으로 검색
select * from post where postRep>=20;	-- 신고 20이상 찾기
select * from member1 where nickName = 'park';	-- 닉네임으로 정보 찾기
select * from member1 where nickName = (select postWriter from post where postIdx=2);	-- 게시글 번호로 닉네임찾고 정보찾기
update post set postLike=30 where postIdx=1;	-- 싫어요가 얼마 이상이면 리스트 출력
update post set views = views + 1 where postIdx=2;	-- 뷰 좋아요 싫어요 신고 증가 
delete from post where postIdx=1;	-- 삭제

create table comment(
commIdx int auto_increment primary key,
postIdx int not null,
commContent text not null,
commRegDate timestamp default current_timestamp,
commLike int not null default 0,
commDislike int not null default 0,
commRep int not null default 0,
foreign key(postIdx) references post(postIdx)
);

drop table comment;

insert into comment(postIdx, commContent) 
values(2, '첫번째 댓글');
insert into comment(postIdx, commContent) 
values(3, '2번째 댓글');
insert into comment(postIdx, commContent, commLike) 
values(4, '3번째 댓글', 20);
insert into comment(postIdx, commContent, commLike, commDislike) 
values(5, '테스트 댓글', 100, 2);
insert into comment(postIdx, commContent, commLike, commDislike, commRep) 
values(6, '안녕하세요', 500, 30, 5);