Alter table projects ADD Costs INT;
commit;
update projects SET costs = 30000 where id< 5;
update projects SET costs = 55000 where id>= 5 and id <9 ;
update projects SET costs = 48000 where id between 9 and 13;
update projects SET costs = 65000 where id > 13;
commit;
