create table if not exists jhi_date_time_wrapper (
    id bigserial not null,
    instant timestamp,
    local_date_time timestamp,
    offset_date_time timestamp,
    zoned_date_time timestamp,
    local_time time,
    offset_time time,
    local_date date,
    primary key (id)
);

create table if not exists product (
    id bigserial not null,
    name varchar(255) not null,
    description varchar(255) not null,
    price decimal(21,2) not null,
    item_size varchar(255) not null,
    image bytea,
    image_content_type varchar(255) not null,
    product_category_id bigint,
    primary key (id)
    );

create sequence if not exists product_category_id_seq start 1535;

create table if not exists product_category (
	id bigint not null default nextval('product_category_id_seq'),
	name varchar(255) not null,
	description varchar(255) not null,
	primary key (id)
	
);

create table if not exists product_order (
	 id bigserial not null,
	 placed_date datetime not null,
	 status varchar(255) not null,
	 code varchar(255) not null,
	 invoice_id bigint,
	 customer varchar(255) not null, 
	 primary key (id)
);

create sequence if not exists order_item_id_seq start 1535;

create table if not exists order_item (
	id bigint not null default nextval('order_item_id_seq'),
	quantity integer not null,
	total_price decimal(21,2) not null,
	status varchar(255) not null,
	product_id bigint not null,
	order_id bigint not null,
	primary key (id),
);

alter table product add foreign key fk_product__product_category_id(product_category_id) references product_category(id);

alter table order_item add foreign key fk_order_item__product_id(product_id) references product(id);

alter table order_item add foreign key fk_order_item__product_id(order_id) references product_order(id);
