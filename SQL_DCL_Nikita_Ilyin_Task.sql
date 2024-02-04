create user rentaluser with password 'rentalpassword';
grant connect on database dvdrental to rentaluser;
--////////////////
grant select on customer to rentaluser;
--///////////////////
create role rental;
grant rental to rentaluser;
--//////////////////////
set role rentaluser;
show role;
insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values (current_date, 111, 222, current_date, 3, now());
update rental set return_date = '2024-02-04' where rental_id = 1;
reset role;
--///////////////////////////
revoke insert on rental from rental;
set role rentaluser;
show role;
insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values (current_date, 333, 444, current_date, 3, now());
reset role;
--/////////////////////////////////
create role client_STANLEY_SCROGGINS login password 'password_for_STANLEY_SCROGGINS';
create policy select_own_data_policy on rental
for select
to client_STANLEY_SCROGGINS
using (customer_id = 404);
create policy select_own_data_policy on payment
for select
to client_STANLEY_SCROGGINS
using (customer_id = 404);
create policy select_own_data_policy on customer
for select
to client_STANLEY_SCROGGINS
using (customer_id = 404);
grant select on table rental, payment, customer to client_STANLEY_SCROGGINS;
set role client_STANLEY_SCROGGINS;

