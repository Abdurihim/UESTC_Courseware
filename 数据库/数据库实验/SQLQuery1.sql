Use STUD;

/* 
alter table SC
add constraint CS_SCORE check(SCORE between 0 and 100);
*/

/*
insert into STUD(StudID,DEPID,SNAME,sex,BIRTHD,EMAIL,HOMEADDR)
values('2017060201009','603','����','��','1998/04/22','111@gmail.com','���ӿƼ���ѧѧ֪Է������');
*/

/*
insert into SC(StudID,CID,TID,SCORE)
values('2017060201009','6004','T05',90);
select cname from SC inner join COURSE on(SC.CID=COURSE.CID) where(StudID='2017060201009');
*/

/*
update SC set SCORE=95 where(StudID='2017060201009')
*/

/*
select COURSE.CID courseId, cname courseName, SCORE from SC inner join COURSE on(SC.CID=COURSE.CID) 
where(StudID='2017060201009')
*/

/*
select * from STUD where(StudID='101');
*/

/*
alter table SC drop constraint FK_sc_stud;
alter table SC add constraint FK_sc_stud foreign key(StudID) references STUD(StudID) on update cascade;
*/

/*
update STUD set StudID='020060101' where(StudID='101')
*/

/*
select SNAME from STUD where(year(getdate())-year(STUD.BIRTHD)between 20 and 28); 
*/

/*
select StudID,SNAME,EMAIL from STUD where(SNAME like '��%');
*/

/*
select STUD.StudID ѧ��,SNAME ����,count(CID) ѡ������,sum(SCORE)��ѧ����
from STUD inner join SC on(STUD.StudID=SC.StudID)
group by STUD.StudID,SNAME
*/

/*
select COURSE.CID �γ�,max(SCORE) ��߷�,min(SCORE) ��ͷ�,avg(SCORE) ƽ����
from COURSE inner join SC on(COURSE.CID=SC.CID)
group by COURSE.CID
*/

/*
select * from COURSE;
*/

/*
select * from COURSE,SC,STUD where(COURSE.CID=SC.CID and SC.StudID=STUD.StudID)
order by CNAME
*/

/*
select COURSE.CID �γ̺�,CNAME �γ���,SCORE ��߷�,STUD.StudID ѧ��,SNAME ����
from COURSE inner join SC on(COURSE.CID=SC.CID) inner join STUD on(SC.StudID=STUD.StudID)
where(SCORE in (select max(SCORE) from SC where(COURSE.CID=SC.CID)))
group by COURSE.CID,COURSE.CNAME,SC.SCORE,STUD.StudID,STUD.SNAME
*/

/*
select distinct STUD.StudID ѧ��,STUD.SNAME ѧ������
from STUD inner join SC on(STUD.StudID=SC.StudID)
where (SC.CID='6001' or SC.CID='6002');
*/

/*
select STUD.StudID,STUD.SNAME from STUD inner join SC on(STUD.StudID=SC.StudID)
group by STUD.StudID,STUD.SNAME
having count(CID)=10
*/