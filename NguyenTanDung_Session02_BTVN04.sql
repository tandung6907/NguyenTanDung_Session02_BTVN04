use homework;

create table users(
	user_id int primary key,
    phone int(11) not null
);

-- Phân tích & Đề xuất: 2 giải pháp DDL
-- Giải pháp 1 — ALTER TABLE ... MODIFY COLUMN
-- Thay đổi trực tiếp kiểu dữ liệu của cột tại chỗ (in-place). MySQL sẽ rebuild lại toàn bộ bảng trong quá trình này.
-- Giải pháp 2 — ALTER TABLE ... CHANGE COLUMN (online, không downtime)
-- Thêm cột mới, migrate dữ liệu dần dần, rồi swap — nhưng cách nhanh nhất trong 1 câu lệnh với ALGORITHM=INPLACE, LOCK=NONE (MySQL 5.6+ / InnoDB):

-- Câu lệnh tôi chọn:
alter table users
modify column phone varchar(15),
algorithm = inplace,
lock = none;