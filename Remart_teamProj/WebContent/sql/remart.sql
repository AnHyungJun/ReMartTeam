
/* Drop Tables */

DROP TABLE basket CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE feed CASCADE CONSTRAINTS;
DROP TABLE feed_food CASCADE CONSTRAINTS;
DROP TABLE follow CASCADE CONSTRAINTS;
DROP TABLE food CASCADE CONSTRAINTS;
DROP TABLE food_order CASCADE CONSTRAINTS;
DROP TABLE hashtag CASCADE CONSTRAINTS;
DROP TABLE img CASCADE CONSTRAINTS;
DROP TABLE likely_bookmark CASCADE CONSTRAINTS;
DROP TABLE mart_order CASCADE CONSTRAINTS;
DROP TABLE offline_mart CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE reple CASCADE CONSTRAINTS;
DROP TABLE r_member CASCADE CONSTRAINTS;
DROP TABLE sale CASCADE CONSTRAINTS;
DROP TABLE staff CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE basket
(
	basket_id number NOT NULL,
	id varchar2(50),
	food_id varchar2(50),
	food_num number,
	PRIMARY KEY (basket_id)
);


CREATE TABLE category
(
	category_id number NOT NULL,
	category_name varchar2(50),
	category_group varchar2(50),
	PRIMARY KEY (category_id)
);


CREATE TABLE feed
(
	feed_id number NOT NULL,
	id varchar2(50),
	like_num number,
	reg_date date,
	recipe_name varchar2(100),
	PRIMARY KEY (feed_id)
);


CREATE TABLE feed_food
(
	feed_food_id number NOT NULL,
	feed_id varchar2(50),
	food_id varchar2(50),
	PRIMARY KEY (feed_food_id)
);


CREATE TABLE follow
(
	follow_id number NOT NULL,
	my_id varchar2(50),
	other_id varchar2(50),
	PRIMARY KEY (follow_id)
);


CREATE TABLE food
(
	food_id number NOT NULL,
	category_id varchar2(50),
	name varchar2(150),
	price number,
	qty number(10,0),
	PRIMARY KEY (food_id)
);


CREATE TABLE food_order
(
	food_order_id number NOT NULL,
	id varchar2(50),
	order_date date,
	request varchar2(150),
	order_state varchar2(10),
	post_number number,
	zip1 varchar2(10),
	zip2 varchar2(10),
	address varchar2(100),
	phone varchar2(50),
	name varchar2(50),
	all_price number,
	food_name varchar2(3000),
	p_company varchar2(100),
	order_number varchar2(100),
	PRIMARY KEY (food_order_id)
);


CREATE TABLE hashtag
(
	hashtag_id number NOT NULL,
	hashtag_content varchar2(50),
	feed_id varchar2(50),
	PRIMARY KEY (hashtag_id)
);


CREATE TABLE img
(
	img_id number NOT NULL,
	feed_id varchar2(50),
	image_name varchar2(50),
	content varchar2(3000),
	PRIMARY KEY (img_id)
);


CREATE TABLE likely_bookmark
(
	likely_bookmark_id number NOT NULL,
	id varchar2(50),
	feed_id varchar2(50),
	type varchar2(10),
	PRIMARY KEY (likely_bookmark_id)
);


CREATE TABLE mart_order
(
	mart_order_id number NOT NULL,
	food_id varchar2(50),
	qty number,
	-- 
	-- 
	re_date date,
	or_date date,
	offline_mart_id varchar2(50),
	status varchar2(50),
	PRIMARY KEY (mart_order_id)
);


CREATE TABLE offline_mart
(
	offline_mart_id number NOT NULL,
	password varchar2(50),
	tel varchar2(50),
	location varchar2(200),
	PRIMARY KEY (offline_mart_id)
);


CREATE TABLE product
(
	product_id number NOT NULL,
	food_id varchar2(50),
	price number,
	qty number,
	offline_mart_id varchar2(50),
	PRIMARY KEY (product_id)
);


CREATE TABLE reple
(
	reple_id number NOT NULL,
	feed_id varchar2(50),
	id varchar2(50),
	content varchar2(200),
	reg_date date,
	PRIMARY KEY (reple_id)
);


CREATE TABLE r_member
(
	id varchar2(50) NOT NULL,
	passwd varchar2(50),
	name varchar2(50),
	phone varchar2(50),
	address1 varchar2(100),
	address2 varchar2(100),
	zip1 varchar2(10),
	zip2 varchar2(10),
	grade varchar2(10),
	point number,
	use_like number,
	sex varchar2(5),
	email varchar2(50),
	jumin1 varchar2(10),
	info varchar2(100),
	profileImg varchar2(100),
	PRIMARY KEY (id)
);


CREATE TABLE sale
(
	sale_id number NOT NULL,
	product_id varchar2(50),
	staff_id varchar2(50),
	s_date date,
	qty number,
	offline_mart_id varchar2(50),
	PRIMARY KEY (sale_id)
);


CREATE TABLE staff
(
	staff_id number NOT NULL,
	password varchar2(50),
	name varchar2(50),
	offline_mart_id varchar2(50),
	position varchar2(50),
	PRIMARY KEY (staff_id)
);



/* Comments */

COMMENT ON COLUMN mart_order.re_date IS '
';



