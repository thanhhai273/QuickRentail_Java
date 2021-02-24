/*
trigger sử dụng 1 số quá trình cập nhật table liên quan
*/
/*
thêm uid cho bảng customer khi thêm mới khách hàng
*/
DELIMITER #
DROP TRIGGER IF EXISTS insert_guid
#
create trigger insert_guid 
before insert on customer
for each row
begin
	if NEW.customer_id is null then
	set NEW.customer_id = UUID();
    end if;
end
#
DELIMITER ;
/* uid for adminid*/
DELIMITER #
DROP TRIGGER IF EXISTS insert_adminId
#
create trigger insert_adminId 
before insert on admin
for each row
begin
	if NEW.admin_id is null then
		set NEW.admin_id = UUID();
    end if;
end
#
DELIMITER ;


/* uid for cartid*/
DELIMITER #
DROP TRIGGER IF EXISTS insert_cartId
#
create trigger insert_cartId
before insert on cart
for each row
begin
	if NEW.cart_id is null then
		set NEW.cart_id = UUID();
	end if;
end
#
DELIMITER ;


/* uid for processing_bill*/
DELIMITER #
DROP TRIGGER IF EXISTS insert_processingbillId
#
create trigger insert_processingbillId
before insert on processing_bill
for each row
begin
	if NEW.bill_id is null then
	set NEW.bill_id = UUID();
    end if;
end
#
DELIMITER ;

/* uid for product*/
DELIMITER #
DROP TRIGGER IF EXISTS insert_prodId
#
create trigger insert_prodId
before insert on product
for each row
begin
	if NEW.prod_id is null then
	set NEW.prod_id = UUID();
    end if;
end
#
DELIMITER ;

/* uid for success bill*/
DELIMITER #
DROP TRIGGER IF EXISTS insert_successbillId
#
create trigger insert_successbillId
before insert on succes_bill
for each row
begin
	if NEW.bill_id is null then
	set NEW.bill_id = UUID();
    end if;
end
#
DELIMITER ;






/*
cập nhật thêm mới hoặc xóa bản ghi warehouse khi tạo đơn, hoặc hoàn thành đơn
*/
DELIMITER #
DROP TRIGGER IF EXISTS update_warehouse_after_checkout
#
create trigger update_warehouse_after_checkout
after insert on processing_bill
for each row
begin
	update warehouse
	set `warehouse`.`amount` = `warehouse`.`amount` - NEW.`prod_amount`
	where `warehouse`.`prod_id` = NEW.`prod_id`;
end;
#
DELIMITER ;

DELIMITER #
DROP TRIGGER IF EXISTS update_warehouse_after_sucessbill
#
create trigger update_warehouse_after_sucessbill
after insert on succes_bill
for each row
begin
	update warehouse
	set warehouse.amount = warehouse.amount + NEW.prod_amount
	where warehouse.prod_id = NEW.prod_id;
end;
#
DELIMITER ;

/* auto fill time created_date proccessing bill*/
DELIMITER #
DROP TRIGGER IF EXISTS fill_createdtime_processing_bill
#
create trigger fill_createdtime_processing_bill
before insert on processing_bill
for each row
begin
	if NEW.created_date IS NULL and NEW.modify_date IS NULL THEN
		set NEW.created_date = curdate();
		set NEW.modify_date = curdate();
    end if;
end
#
DELIMITER ;

/* auto fill time modify_date proccessing bill*/
DELIMITER #
DROP TRIGGER IF EXISTS fill_modifytime_processing_bill
#
create trigger fill_modifytime_processing_bill
before update on processing_bill
for each row
begin
	set new.modify_date = curdate();
end
#
DELIMITER ;



