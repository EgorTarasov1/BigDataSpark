create table dim_suppliers (
    supplier_id serial primary key,
    supplier_name text,
    contact_name text,
    country text,
    city text
);


create table dim_customers (
    customer_id serial primary key,
    email text unique,
    first_name text,
    last_name text,
    age int,
    pet_type text,
    country text,
    postal_code text
);


create table dim_sellers (
    seller_id serial primary key,
    email text unique,
    first_name text,
    last_name text,
    country text,
    postal_code text
);


create table dim_stores (
    store_id serial primary key,
    store_name text,
    country text,
    city text,
    state text
);


create table dim_products (
    product_id serial primary key,
    original_product_id int,
    product_name text,
    brand text,
    price decimal(12, 2),
    product_category text,
    pet_category text,
    supplier_id int references dim_suppliers(supplier_id)
);


create table fact_sales (
    sale_id serial primary key,
    sale_date date,
    customer_id int references dim_customers(customer_id),
    seller_id int references dim_sellers(seller_id),
    product_id int references dim_products(product_id),
    store_id int references dim_stores(store_id),
    supplier_id int references dim_suppliers(supplier_id),
    quantity int,
    total_price decimal(12, 2)
);