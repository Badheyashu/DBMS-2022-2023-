delimiter $$
create procedure inc_bpr(IN n varchar(20))
Begin
declare r int;
select bprise into r from bike where bmodel = n;
set r=r+r*0.2;
update bike set bprise=r where bmodel = n;
end $$
delimiter ;
