SELECT * from member1;
select * from post;
select * from comment;
select * from recomment;
select * from checklike;
select count(*) from post where postWriter like '%n%';
select * from post where postWriter like '%n%';
select count(*) from post where postTitle like '%테스트%' or postContent like '%테스트%';
select * from post order by postIdx desc limit 0,10;
select count(*) from post where postSort = '잡담' and postWriter like '%테스트%';

