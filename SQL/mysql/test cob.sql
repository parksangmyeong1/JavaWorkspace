create table member1(
memIdx int not null auto_increment primary key,
memId varchar(20) unique key not null,
nickName varchar(20) unique key not null,
memPassword varchar(20) not null,
memName varchar(20) not null,
memBirth timestamp,
memGender boolean,
memAddress varchar(255),
memTel varchar(15) not null,
memEmail varchar(40) not null,
memPhoto varchar(255) default 'photo.png',
memAuth varchar(10) not null default 'member' -- member, manager, ban, cafe
);
drop table member1;

select * from member1;

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
postSort varchar(20) not null,
postWriter varchar(20) not null,
postTitle varchar(20) not null,
postContent text not null,
postRegDate timestamp not null default current_timestamp,
views int not null default 0,
postLike int not null default 0,
postDislike int not null default 0,
postRep int not null default 0,
constraint fk_memIdx foreign key(memIdx) references member1(memIdx)
);

drop table post;

-- 게시글 작성
insert into post (memIdx, postWriter, postTitle, postContent, postSort) 
values(1, 'nick1', '첫번째 테스트 게시글', '첫번째 게시글의 내용', '잡담');
-- test
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

select * from post;
select * from post limit 2; -- 제한 2개
select * from post where postTitle like '%가%';	-- 제목으로 찾기
select * from post where postTitle like '%두%' or postContent like '%파%';	-- 제목, 내용으로 검색
select * from member1 where nickName like '%3%';	-- 닉네임으로 검색
select * from post where postRep>=20;	-- 신고 20이상 찾기
select * from post where postLike>=20;	-- 좋아요 20이상 찾기 / 인기게시글
select * from member1 where nickName = 'park';	-- 닉네임으로 쓴 글 리스트 보여주기
select * from member1 where nickName = (select postWriter from post where postIdx=2);	-- 게시글 번호로 닉네임찾고 정보찾기
update post set views = views + 1 where postIdx=2;	-- 뷰 좋아요 싫어요 신고 증가
update post set postTitle='수정하고 싶은 게시글 제목 수정', postContent='수정하고 싶은 게시글 내용 수정', postSort='카테고리 수정'
where postIdx = 5;	-- 해당 게시글 수정
delete from post where postIdx=43;	-- 해당 게시글 삭제

create table comment(
commIdx int auto_increment primary key,
postIdx int not null,
commWriter varchar(20) not null,
commContent text not null,
commRegDate timestamp not null default current_timestamp,
commLike int not null default 0,
commDislike int not null default 0,
commRep int not null default 0,
foreign key(postIdx) references post(postIdx)
);


drop table comment;

-- 댓글 작성
insert into comment(postIdx, commContent) 
values(1, '첫번째 댓글');
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
insert into comment(postIdx, commContent, commLike, commDislike, commRep) 
values(6, '같은글 댓글', 30, 10, 20);
insert into comment(postIdx, commContent, commLike, commDislike, commRep) 
values(6, '같은 글인데 댓글 222', 100, 20, 5);

select * from comment;
select * from comment where postIdx=6;	-- 해당 게시글 댓글 리스트
select count(*) from comment where postIdx=43;	-- 게시글 댓글 숫자
update comment set commContent = '수정된 댓글입니다.ㅎㅎㅎ' where commIdx=6;	-- 게시글 해당 댓글 수정
update comment set commLike = commLike + 1  where commIdx=6;	-- 좋아요 버튼 클릭시 증가
update comment set commDislike = commDislike + 1  where commIdx=6;	-- 싫어요 버튼 클릭시 증가
update comment set commRep = commRep + 1  where commIdx=6;	-- 신고 버튼 클릭시 증가
delete from comment where commIdx=4;	-- 해당 commIdx로 삭제

create table recomment(
recommIdx int auto_increment primary key,
commIdx int not null,
recommContent text not null,
recommRegDate timestamp not null default current_timestamp,
recommLike int not null default 0,
recommDislike int not null default 0,
recommRep int not null default 0,
foreign key(commIdx) references comment(commIdx)
);

drop table recomment;

-- 대댓글 작성
insert into recomment(commIdx, recommContent)
values(10, '해당 댓글에 대댓글 작성');
-- test
insert into recomment(commIdx, recommContent, recommLike, recommDislike, recommRep)
values(1, '첫번째 대댓글', 10, 5, 2);
insert into recomment(commIdx, recommContent, recommLike, recommDislike, recommRep)
values(2, '2번째 대댓글', 10, 5, 2);
insert into recomment(commIdx, recommContent, recommLike, recommDislike, recommRep)
values(3, '3번째 대댓글', 10, 5, 2);
insert into recomment(commIdx, recommContent, recommLike, recommDislike, recommRep)
values(5, '5번째 대댓글', 10, 5, 2);
insert into recomment(commIdx, recommContent, recommLike, recommDislike, recommRep)
values(6, '6번째 대댓글-1', 10, 5, 2);
insert into recomment(commIdx, recommContent, recommLike, recommDislike, recommRep)
values(6, '6번째 대댓글-2', 10, 5, 2);

select * from recomment;
select * from recomment where commIdx = 6;	-- commIdx 댓글 인덱스로 대댓글 찾기

update recomment set recommContent = '수정된 대댓글입니다.' where recommIdx=6;	-- 게시글 댓글 수정
update recomment set recommLike = recommLike + 1  where recommIdx=6;	-- 좋아요 버튼 클릭시 증가
update recomment set recommDislike = recommDislike + 1  where recommIdx=6;	-- 싫어요 버튼 클릭시 증가
update recomment set recommRep = recommRep + 1  where recommIdx=6;	-- 신고 버튼 클릭시 증가

delete from recomment where recommIdx=4;	-- 해당 recommIdx로 삭제


create table member2(
memIdx int not null auto_increment primary key,
memId varchar(20) unique key not null,
nickName varchar(20) unique key not null,
memPassword varchar(20) not null,
memName varchar(20) not null,
memBirth timestamp,
memGender boolean,
memAddress varchar(255),
memTel varchar(15) not null,
memEmail varchar(40) not null,
memPhoto varchar(255) default 'photo.png',
memAuth varchar(10) not null default 'member' -- member, manager, ban, cafe
);
create table post2(
postIdx int not null auto_increment primary key,
memIdx int not null,
postSort varchar(20) not null,
postWriter varchar(20) not null,
postTitle varchar(20) not null,
postContent text not null,
postRegDate timestamp not null default current_timestamp,
views int not null default 0,
postLike int not null default 0,
postDislike int not null default 0,
postRep int not null default 0,
constraint fk_memIdx1 foreign key(memIdx) references member1(memIdx) on delete cascade	-- fk있어도 지우게 하기 위해
);

insert into member2 (memId, nickName, memPassword, memName, memBirth, memTel, memEmail)
values('park', 'park', '1111', 'park', '950324', '010-3903-5854','park@gmail.com');
insert into member2 (memId, nickName, memPassword, memName, memBirth, memTel, memEmail) 
values('test1', 'nick1', '1111', 'test1', '111111', '010-1111-1111','test1@gmail.com');
insert into member2 (memId, nickName, memPassword, memName, memBirth, memTel, memEmail) 
values('test2', 'nick2', '2222', 'test2', '121212', '010-2222-2222','test2@gmail.com');

select * from member2;
insert into post2 (memIdx, postWriter, postTitle, postContent, postSort) 
values(1, 'nick1', '첫번째 테스트 게시글', '첫번째 게시글의 내용', '잡담');
select * from post2;
delete from member2 where memidx = 1;