delimiter $$
create function bike_colour (bprise int)
returns varchar(20) 
DETERMINISTIC
Begin 

Declare bike_colour varchar (20) ;

if bprise < 150000  then
set bike_colour = 'black' ;

elseif ( bprise > 150000 AND bprise < 300000 )then 
set bike_colour = 'white' ;

elseif bprise > 300000 then 
set bike_colour = 'gold' ;

end if ;

return (bike_colour);

End $$
delimiter ;
