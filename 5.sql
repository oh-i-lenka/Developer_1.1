DELIMITER //

CREATE PROCEDURE clients()
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
	DECLARE min_customer INT DEFAULT 0;
	DECLARE max_cost INT DEFAULT 0;
	DECLARE tempJ INT DEFAULT 0;
	DECLARE temp_custom INT DEFAULT 0;
	
	SET j := (SELECT MAX(id) FROM customers);
	SET i := (SELECT MAX(id) FROM companies);
	SET max_cost := (SELECT MAX(Costs) FROM projects);
	SET tempJ := j;
	
	WHILE i>0 DO
		set min_customer := max_cost;
		WHILE j>0 DO
				SET temp_custom := (SELECT SUM(costs) FROM projects WHERE proj_customers = j AND proj_company = i);
				if ( temp_custom < min_customer AND temp_custom != 0) then 
						SET min_customer := temp_custom;
						end if;
							
				set j := j-1;
		END WHILE;
		SELECT i;
		SELECT min_customer;		
		set i := i-1;
		SET j := tempJ;
	END WHILE;

END //

DELIMITER //

CALL clients();