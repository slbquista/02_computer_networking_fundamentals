-- Outputs 50 random numbers between 1 and 50

begin
	for i in 1 .. 50
	loop
		dbms_output.put_line (
			round(dbms_random.value(1,50), 0)
		);
	end loop;
end;


-- Outputs 12 rnadom hex numbers

declare
	digit varchar2(1) := '';
	tempint number := 0;

begin
	for i in 1 .. 12
	loop
		tempint := round(dbms_random.value(0,15),0);
		case
			when tempint = 10 then digit := 'a';
			when tempint = 11 then digit := 'b';
			when tempint = 12 then digit := 'c';
			when tempint = 13 then digit := 'd';
			when tempint = 14 then digit := 'e';
			when tempint = 15 then digit := 'f';
			else digit := to_char(tempint);
		end case;
		dbms_output.put_line(digit);
	end loop;
end;


-- Collect 12 hex numbers in a varchar2(17)

declare
	digit varchar2(1) := '';
	mac_address varchar2(17) := '';
	mac_length constant number := 12;
	seperator constant varchar2(1) := '-';
	tempint number := 0;

begin
	for i in 1 .. 12
	loop
		tempint := round(dbms_random.value(0,15),0);
		case
			when tempint = 10 then digit := 'a';
			when tempint = 11 then digit := 'b';
			when tempint = 12 then digit := 'c';
			when tempint = 13 then digit := 'd';
			when tempint = 14 then digit := 'e';
			when tempint = 15 then digit := 'f';
			else digit := to_char(tempint);
		end case;

		mac_address := mac_address || digit;

		if mod (i,2) = 0 and i < mac_length then
			mac_address := mac_address || seperator;
		end if;

	end loop;

	dbms_output.put_line(mac_address);
end;


-- Creates the mac address as a function

create or replace function generate_mac_address
return varchar2
as
	digit varchar2(1) := '';
	mac_address varchar2(17) := '';
	mac_length constant number := 12;
	seperator constant varchar2(1) := '-';
	tempint number := 0;

begin
	for i in 1 .. 12
	loop
		tempint := round(dbms_random.value(0,15),0);
		case
			when tempint = 10 then digit := 'a';
			when tempint = 11 then digit := 'b';
			when tempint = 12 then digit := 'c';
			when tempint = 13 then digit := 'd';
			when tempint = 14 then digit := 'e';
			when tempint = 15 then digit := 'f';
			else digit := to_char(tempint);
		end case;

		mac_address := mac_address || digit;

		if mod (i,2) = 0 and i < mac_length then
			mac_address := mac_address || seperator;
		end if;

	end loop;
	return mac_address;
end;


-- Calls function created above

select generate_mac_address() from dual;


-- Repeats function call 100 times

begin
	for i in 1 .. 100
	loop
		dbms_output.put_line(generate_mac_address());
	end loop;
end;

-- test
