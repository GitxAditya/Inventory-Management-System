create database inventory_management_system;
use inventory_management_system;
SELECT DATABASE();

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);

create table products(
	prod_id int auto_increment primary key,
    prod_name varchar(100) not null,
    category varchar(50),
    price decimal(10,2) not null,
    stock int default 0,
    supplier_id int,
    foreign key(supplier_id) references suppliers(supplier_id)
)

create table purchases(
	purchase_id int auto_increment primary key,
    supplier_id int not null,
    purchase_date date not null,
    foreign key(supplier_id) references suppliers(supplier_id)
);

create table purchase_items(
	item_id int auto_increment primary key,
    purchase_id int not null,
    prod_id int not null, 
    quantity int not null,
    purchase_price decimal(10,2) not null,
    foreign key(purchase_id) references purchases(purchase_id),
    foreign key(prod_id) references products(prod_id)
);

create table sales(
	sale_id int auto_increment primary key,
    cust_name varchar(100),
    sale_date date not null
);

create table sales_items(
	item_id int auto_increment primary key,
    sale_id int not null,
    prod_id int not null,
    quantity int not null,
    selling_price decimal(10,2) not null,
    foreign key(sale_id) references sales(sale_id),
    foreign key(prod_id) references products(prod_id)
);

create table inventory_audit(
	audit_id int auto_increment primary key,
    prod_id int not null,
    old_stock int,
    new_stock int,
    action varchar(30),
    changed_at datetime default current_timestamp,
    foreign key(prod_id) references products(prod_id)
);

INSERT INTO suppliers (supplier_name, phone, email, city) VALUES
('TechSource Pvt Ltd','9876500001','contact@techsource.com','Mumbai'),
('Global Electronics','9876500002','sales@globalelectronics.com','Delhi'),
('Prime Distributors','9876500003','info@primedistributors.com','Bengaluru'),
('Future Supplies','9876500004','support@futuresupplies.com','Hyderabad'),
('National Traders','9876500005','contact@nationaltraders.com','Chennai'),
('Elite Wholesale','9876500006','sales@elitewholesale.com','Pune'),
('Metro Suppliers','9876500007','info@metrosuppliers.com','Ahmedabad'),
('Sunrise Enterprises','9876500008','sales@sunriseent.com','Jaipur'),
('Vertex Distribution','9876500009','contact@vertexdist.com','Lucknow'),
('Reliable Imports','9876500010','support@reliableimports.com','Kolkata'),
('Smart Retail Supply','9876500011','sales@smartretail.com','Surat'),
('NextGen Traders','9876500012','info@nextgentraders.com','Indore'),
('City Wholesale','9876500013','contact@citywholesale.com','Nagpur'),
('Modern Distributors','9876500014','sales@moderndist.com','Patna'),
('Galaxy Suppliers','9876500015','info@galaxysuppliers.com','Bhopal'),
('Rapid Supply Chain','9876500016','support@rapidsupply.com','Kanpur'),
('Royal Agencies','9876500017','sales@royalagencies.com','Ludhiana'),
('Shree Enterprises','9876500018','info@shreeent.com','Agra'),
('Apex Distribution','9876500019','contact@apexdist.com','Nashik'),
('Pioneer Traders','9876500020','sales@pioneertraders.com','Vadodara'),
('Bright Supply','9876500021','info@brightsupply.com','Coimbatore'),
('Dynamic Wholesale','9876500022','sales@dynamicws.com','Visakhapatnam'),
('Infinity Traders','9876500023','contact@infinitytraders.com','Ranchi'),
('Capital Suppliers','9876500024','info@capitalsuppliers.com','Noida'),
('United Distribution','9876500025','sales@uniteddist.com','Ghaziabad'),
('Sigma Enterprises','9876500026','info@sigmaent.com','Faridabad'),
('Evergreen Supply','9876500027','sales@evergreensupply.com','Meerut'),
('BlueSky Traders','9876500028','contact@blueskytraders.com','Rajkot'),
('SilverLine Wholesale','9876500029','info@silverlinews.com','Jodhpur'),
('Eastern Agencies','9876500030','sales@easternagencies.com','Guwahati'),
('Western Distributors','9876500031','contact@westerndist.com','Amritsar'),
('Northern Traders','9876500032','info@northerntraders.com','Dehradun'),
('Southern Supply','9876500033','sales@southernsupply.com','Mysuru'),
('Central Wholesale','9876500034','contact@centralws.com','Raipur'),
('Nova Enterprises','9876500035','info@novaent.com','Jabalpur'),
('Peak Distributors','9876500036','sales@peakdist.com','Aurangabad'),
('Orbit Supply','9876500037','contact@orbitsupply.com','Gwalior'),
('Value Traders','9876500038','info@valuetraders.com','Allahabad'),
('Starline Agencies','9876500039','sales@starlineagencies.com','Udaipur'),
('Supreme Suppliers','9876500040','contact@supremesuppliers.com','Siliguri'),
('FastTrack Distribution','9876500041','sales@fasttrackdist.com','Kochi'),
('Om Enterprises','9876500042','info@omenterprises.com','Trichy'),
('Sai Wholesale','9876500043','sales@saiwholesale.com','Vijayawada'),
('Crystal Traders','9876500044','contact@crystaltraders.com','Madurai'),
('Zenith Distributors','9876500045','info@zenithdist.com','Hubli'),
('Universal Supply','9876500046','sales@universalsupply.com','Mangalore'),
('Platinum Agencies','9876500047','contact@platinumagencies.com','Bareilly'),
('Mega Traders','9876500048','info@megatraders.com','Jammu'),
('Quality Suppliers','9876500049','sales@qualitysuppliers.com','Shimla'),
('Vision Distribution','9876500050','contact@visiondist.com','Chandigarh');

INSERT INTO products (prod_name, category, price, stock, supplier_id) VALUES

-- Electronics (1-35)

('Wireless Mouse','Electronics',799.00,120,1),
('Mechanical Keyboard','Electronics',2499.00,80,1),
('Gaming Headset','Electronics',3299.00,60,2),
('Bluetooth Speaker','Electronics',1999.00,75,2),
('USB Flash Drive 64GB','Electronics',699.00,200,3),
('Power Bank 10000mAh','Electronics',1499.00,110,3),
('Smart Watch','Electronics',5999.00,40,4),
('Laptop Cooling Pad','Electronics',1299.00,55,4),
('Webcam HD','Electronics',1799.00,70,5),
('Monitor 24 Inch','Electronics',11999.00,30,5),
('Wireless Earbuds','Electronics',3499.00,90,6),
('Phone Charger','Electronics',499.00,180,6),
('HDMI Cable','Electronics',399.00,250,7),
('Router WiFi 6','Electronics',4499.00,35,7),
('SSD 512GB','Electronics',4299.00,60,8),
('External Hard Disk','Electronics',5499.00,45,8),
('Graphics Tablet','Electronics',6999.00,20,9),
('Laptop Stand','Electronics',999.00,100,9),
('Microphone USB','Electronics',2899.00,50,10),
('Wireless Presenter','Electronics',1599.00,40,10),
('Tablet 10 Inch','Electronics',14999.00,25,11),
('Projector Mini','Electronics',8999.00,18,11),
('Printer Inkjet','Electronics',7999.00,22,12),
('Scanner','Electronics',6499.00,18,12),
('Smartphone','Electronics',24999.00,28,13),
('Laptop','Electronics',58999.00,15,13),
('Desktop PC','Electronics',47999.00,12,14),
('UPS','Electronics',4999.00,32,14),
('Action Camera','Electronics',18999.00,20,15),
('Drone Mini','Electronics',34999.00,8,15),
('LED TV 43 Inch','Electronics',32999.00,16,16),
('Soundbar','Electronics',9999.00,20,16),
('Wireless Charger','Electronics',1499.00,70,17),
('Digital Camera','Electronics',42999.00,9,17),
('VR Headset','Electronics',25999.00,10,18),

-- Furniture (36-60)

('Office Chair','Furniture',6999.00,35,19),
('Study Table','Furniture',8999.00,22,19),
('Bookshelf','Furniture',4999.00,28,20),
('Computer Desk','Furniture',7499.00,20,20),
('Dining Table','Furniture',18999.00,10,21),
('Sofa 3 Seater','Furniture',35999.00,8,21),
('Coffee Table','Furniture',4999.00,15,22),
('Wooden Wardrobe','Furniture',24999.00,12,22),
('TV Cabinet','Furniture',10999.00,18,23),
('Bed Queen Size','Furniture',27999.00,10,23),
('Mattress','Furniture',14999.00,16,24),
('Plastic Chair','Furniture',999.00,100,24),
('Bean Bag','Furniture',2499.00,35,25),
('Dining Chair','Furniture',2999.00,45,25),
('Corner Table','Furniture',1999.00,50,26),
('Shoe Rack','Furniture',3499.00,40,26),
('Folding Table','Furniture',3999.00,30,27),
('Office Cabinet','Furniture',8999.00,18,27),
('Wooden Stool','Furniture',1499.00,60,28),
('Computer Chair','Furniture',5999.00,25,28),
('Reception Sofa','Furniture',45999.00,5,29),
('Conference Table','Furniture',55999.00,3,29),
('Wall Shelf','Furniture',1899.00,45,30),
('Study Chair','Furniture',2999.00,38,30),
('Storage Rack','Furniture',5499.00,20,18),

-- Grocery (61-90)

('Rice 5kg','Grocery',450.00,300,1),
('Wheat Flour 5kg','Grocery',320.00,250,2),
('Sugar 1kg','Grocery',55.00,500,3),
('Salt 1kg','Grocery',30.00,450,4),
('Cooking Oil 1L','Grocery',160.00,220,5),
('Tea 500g','Grocery',280.00,180,6),
('Coffee 250g','Grocery',350.00,160,7),
('Biscuits Pack','Grocery',40.00,600,8),
('Milk Powder','Grocery',420.00,90,9),
('Corn Flakes','Grocery',210.00,120,10),
('Noodles Pack','Grocery',25.00,500,11),
('Pasta','Grocery',85.00,200,12),
('Ketchup','Grocery',110.00,150,13),
('Jam','Grocery',140.00,120,14),
('Honey','Grocery',390.00,90,15),
('Peanut Butter','Grocery',320.00,85,16),
('Green Tea','Grocery',220.00,130,17),
('Chocolate','Grocery',80.00,350,18),
('Soft Drink','Grocery',45.00,500,19),
('Mineral Water','Grocery',20.00,700,20),
('Juice','Grocery',95.00,250,21),
('Oats','Grocery',160.00,180,22),
('Butter','Grocery',260.00,110,23),
('Cheese','Grocery',340.00,95,24),
('Yogurt','Grocery',70.00,200,25),
('Eggs 12 Pack','Grocery',95.00,150,26),
('Frozen Peas','Grocery',140.00,100,27),
('Frozen Corn','Grocery',150.00,95,28),
('Black Pepper','Grocery',180.00,80,29),
('Turmeric Powder','Grocery',90.00,120,30),

-- Clothing (91-120)

('Men T-Shirt','Clothing',699.00,180,1),
('Women T-Shirt','Clothing',749.00,160,2),
('Men Jeans','Clothing',1499.00,120,3),
('Women Jeans','Clothing',1699.00,110,4),
('Formal Shirt','Clothing',1299.00,90,5),
('Casual Shirt','Clothing',999.00,130,6),
('Jacket','Clothing',2499.00,70,7),
('Sweater','Clothing',1899.00,60,8),
('Hoodie','Clothing',1799.00,80,9),
('Track Pants','Clothing',999.00,120,10),
('Shorts','Clothing',699.00,150,11),
('Kurta','Clothing',1199.00,90,12),
('Saree','Clothing',3499.00,50,13),
('Dress','Clothing',2499.00,65,14),
('Skirt','Clothing',1199.00,80,15),
('Leggings','Clothing',599.00,170,16),
('Socks','Clothing',199.00,500,17),
('Cap','Clothing',299.00,220,18),
('Belt','Clothing',499.00,180,19),
('Tie','Clothing',399.00,150,20),
('Blazer','Clothing',3999.00,30,21),
('Raincoat','Clothing',1899.00,45,22),
('Winter Gloves','Clothing',599.00,100,23),
('Scarf','Clothing',499.00,110,24),
('Sports Jersey','Clothing',999.00,85,25),
('Sports Shorts','Clothing',799.00,95,26),
('Night Suit','Clothing',1499.00,60,27),
('Kids T-Shirt','Clothing',499.00,130,28),
('Kids Jeans','Clothing',799.00,100,29),
('School Uniform','Clothing',1299.00,75,30),

-- Stationery (121-140)

('Notebook A4','Stationery',120.00,500,1),
('Ball Pen','Stationery',20.00,1000,2),
('Gel Pen','Stationery',35.00,700,3),
('Pencil HB','Stationery',10.00,1200,4),
('Marker','Stationery',50.00,300,5),
('Eraser','Stationery',8.00,900,6),
('Sharpener','Stationery',12.00,800,7),
('Geometry Box','Stationery',180.00,200,8),
('Calculator','Stationery',499.00,120,9),
('File Folder','Stationery',60.00,400,10),
('Stapler','Stationery',150.00,140,11),
('Staple Pins','Stationery',30.00,500,12),
('Highlighter','Stationery',70.00,300,13),
('Whiteboard Marker','Stationery',45.00,350,14),
('Sticky Notes','Stationery',90.00,250,15),
('Drawing Book','Stationery',140.00,180,16),
('Color Pencils','Stationery',220.00,160,17),
('Sketch Pens','Stationery',280.00,140,18),
('Glue Stick','Stationery',40.00,260,19),
('Scissors','Stationery',120.00,180,20),

-- Sports (141-160)

('Cricket Bat','Sports',2499.00,40,21),
('Cricket Ball','Sports',250.00,180,22),
('Football','Sports',899.00,90,23),
('Basketball','Sports',999.00,70,24),
('Badminton Racket','Sports',1499.00,65,25),
('Shuttlecock','Sports',450.00,140,26),
('Tennis Racket','Sports',2999.00,40,27),
('Table Tennis Bat','Sports',899.00,80,28),
('Skipping Rope','Sports',250.00,200,29),
('Yoga Mat','Sports',999.00,90,30),
('Dumbbell 5kg','Sports',1499.00,60,1),
('Kettlebell','Sports',1999.00,50,2),
('Cycling Helmet','Sports',1799.00,45,3),
('Swimming Goggles','Sports',699.00,90,4),
('Sports Bottle','Sports',399.00,150,5),
('Treadmill','Sports',45999.00,8,6),
('Exercise Bike','Sports',39999.00,10,7),
('Punching Bag','Sports',7999.00,15,8),
('Chess Board','Sports',699.00,100,9),
('Carrom Board','Sports',2499.00,35,10),

-- Home Appliances + Beauty

('Mixer Grinder','Home Appliances',3499.00,40,11),
('Electric Kettle','Home Appliances',1499.00,80,12),
('Microwave Oven','Home Appliances',8999.00,20,13),
('Induction Cooktop','Home Appliances',2999.00,35,14),
('Ceiling Fan','Home Appliances',2499.00,55,15),
('Hair Dryer','Beauty',1499.00,70,16),
('Face Wash','Beauty',299.00,220,17),
('Body Lotion','Beauty',399.00,180,18),
('Shampoo','Beauty',450.00,200,19),
('Perfume','Beauty',1999.00,60,20),

-- Home Appliances (161-175)

('Electric Iron','Home Appliances',1499.00,55,11),
('Vacuum Cleaner','Home Appliances',5499.00,25,12),
('Air Purifier','Home Appliances',7999.00,18,13),
('Water Heater','Home Appliances',4999.00,30,14),
('Sewing Machine','Home Appliances',7999.00,15,15),
('Food Processor','Home Appliances',4499.00,28,16),
('Toaster','Home Appliances',1299.00,60,17),
('Coffee Maker','Home Appliances',3999.00,22,18),
('Juicer','Home Appliances',2999.00,35,19),
('Hand Blender','Home Appliances',1899.00,45,20),
('Washing Machine','Home Appliances',25999.00,12,21),
('Refrigerator','Home Appliances',32999.00,10,22),
('Air Conditioner','Home Appliances',38999.00,8,23),
('Dishwasher','Home Appliances',44999.00,6,24),
('Tumble Dryer','Home Appliances',29999.00,5,25),

-- Beauty & Personal Care (176-190)

('Face Cream','Beauty',399.00,180,16),
('Sunscreen Lotion','Beauty',499.00,150,17),
('Lipstick','Beauty',599.00,200,18),
('Foundation','Beauty',799.00,120,19),
('Mascara','Beauty',499.00,140,20),
('Nail Polish','Beauty',199.00,250,21),
('Hair Oil','Beauty',299.00,220,22),
('Conditioner','Beauty',499.00,180,23),
('Hair Serum','Beauty',699.00,130,24),
('Face Mask','Beauty',249.00,160,25),
('Body Scrub','Beauty',349.00,120,26),
('Deodorant','Beauty',199.00,300,27),
('Hand Sanitizer','Beauty',150.00,250,28),
('Shaving Kit','Beauty',699.00,90,29),
('Eyeliner','Beauty',349.00,150,30),

-- Kitchen & Dining (191-200)

('Non-Stick Pan','Kitchen',899.00,80,1),
('Pressure Cooker','Kitchen',2499.00,45,2),
('Cookware Set','Kitchen',4999.00,30,3),
('Knife Set','Kitchen',1499.00,50,4),
('Cutting Board','Kitchen',399.00,120,5),
('Water Bottle','Kitchen',299.00,200,6),
('Lunch Box','Kitchen',249.00,180,7),
('Tiffin Box','Kitchen',399.00,150,8),
('Utensil Set','Kitchen',1999.00,40,9),
('Storage Jars','Kitchen',1499.00,35,10);

create view product_stock_summary as(
	select
		p.prod_id,
        p.prod_name,
        p.category,
        s.supplier_id,
        p.price as current_price,
        p.stock as current_stock,
        case
			when p.stock = 0 then "Out of stock"
            when p.stock < 25 then "Low stock"
            when p.stock < 50 then "Medium stock"
            else "In stock"
		end as stock_status
        from products p
        left join suppliers s on s.supplier_id = p.supplier_id
);

create view supplier_summary as (
	select
		s.supplier_id,
        s.supplier_name,
        s.city,
        count(prod_id) as product_supplied,
        sum(p.stock) as total_stock,
        round(sum(p.price*p.stock),2) as inventory_values
	from suppliers s
    left join products p on 
        s.supplier_id = p.supplier_id
	group by s.supplier_id, s.supplier_name, s.city
);

create view monthly_purchase_inventory as(
	select
		date_format(p.purchase_date,"%Y-%m") as month,
        count(distinct p.purchase_id) as total_purchase,
        sum(pi.quantity) as unit_purchase,
        round(sum(pi.quantity * pi.purchase_price),2) as purchase_price
        from purchases p
        inner join purchase_items pi on p.purchase_id = pi.purchase_id
	group by date_format(p.purchase_date,"%Y-%m")
    order by month
);

create view monthly_sales_summary as(
	select
		date_format(s.sale_date,"%Y-%m") as sale_date,
        count(distinct s.sale_id) as total_sales,
        sum(si.quantity) as unit_sales,
        sum(si.selling_price*si.quantity) as revenue
	from sales s
    inner join sales_items si on s.sale_id = si.sale_id
    group by date_format(s.sale_date,"%Y-%m")
    order by sale_date
);

delimiter //
create procedure add_new_supplier(
in p_supplier_name varchar(100),
in p_city varchar(50),
in p_phone varchar(15),
in p_email varchar(100)
)
begin
	if p_supplier_name is null or trim(p_supplier_name) = "" then
		signal sqlstate "45000"
        set message_text = "Supplier name cannot be empty";
	end if;
	if p_city is null or trim(p_city) = "" then
		signal sqlstate "45000"
        set message_text = "City cannot be empty";
	end if;
    if p_phone is null or trim(p_phone) = "" then
		signal sqlstate "45000"
        set message_text = "Phone number cannot be empty";
    end if;
    if p_email is null or trim(p_email) = "" then
		signal sqlstate "45000"
        set message_text = "Email cannot be empty";
    end if;
    
    if exists(select 1 from supplier where p_supplier_name = supplier_name) then
		signal sqlstate "45000"
        set message_text = "Supplier already exists";
	end if;
	if exists (select 1 from supplier where p_phone = phone) then
		signal sqlstate "45000"
        set message_text = 'Phone number already exists';
	end if;
	if exists(select 1 from supplier where p_email = email) then
		signal sqlstate "45000"
        set message_text = 'email already exists';
	end if;
    
    insert into suppliers(supplier_name, city, phone, email)
    values (p_supplier_name, p_city, p_phone, p_email);
    
    select
		last_insert_id() as supplier_id,
        'Supplier added successfully' AS message;
end //
delimiter ;

delimiter //
create procedure add_new_product(
in p_prod_name varchar(100),
in p_category varchar(100),
in p_price decimal(10,2),
in p_stock int,
in p_supplier_id int)

begin
	if p_prod_name is null or trim(p_prod_name) = "" then
		signal sqlstate '45000'
        set message_text = 'Product name cannot be empty' ;
	end if ;

    if  p_category is null or trim( p_category) = "" then
		signal sqlstate '45000'
        set message_text = 'category cannot be empty';
	end if ;

	if  p_price <= 0 then
		signal sqlstate '45000'
        set message_text = 'price must be greater than 0';
	end if ;
	
    if  p_stock < 0 then
		signal sqlstate '45000'
        set message_text = 'stock cannot be negative';
	end if ;

	if not exists(select 1 from suppliers where supplier_id = p_supplier_id) then
		signal sqlstate "45000"
		set message_text = "Supplier not found";
	end if;
    
    insert into products(prod_name, category, price, stock, supplier_id)
    values(p_prod_name, p_category, p_price, p_stock, p_supplier_id);
    
    select 
		last_insert_id() as product_id,
        'Product Added Successfully' AS message;
end //
delimiter ;

delimiter //
create procedure record_new_sale(
in p_cust_name varchar(100),
in p_prod_id int,
in p_quantity int,
in p_selling_price decimal(10,2),
in p_sale_date date
)
begin
	declare v_current_stock int;
    declare v_sale_id int;
    
	if p_cust_name is null or trim(p_cust_name) = "" then
		signal sqlstate '45000'
        set message_text ='Customer name cannot be empty';
	end if;
    
    if p_quantity <= 0 then
		signal sqlstate '45000'
        set message_text ='Quantity must be greater than 0';
	end if;
	
    if p_selling_price <= 0 then
		signal sqlstate '45000'
        set message_text = 'selling price must be greater than 0';
	end if;
    
    select stock into v_current_stock 
    from products
    where prod_id = p_prod_id;
    
    if v_current_stock is null then
		signal sqlstate '45000'
        set message_text ='Product not found';
	end if;
    
    if v_current_stock < p_quantity then
		signal sqlstate '45000'
		set message_text = 'Not enough stock. Available: ';
	end if;
    
    start transaction;
    insert into sales(cust_name, sale_date)
	values (p_cust_name, p_sale_date);
    
    set  v_sale_id = LAST_INSERT_ID();
    
    insert into sales_items(sale_id, prod_id, quantity, selling_price)
    VALUES (v_sale_id, p_prod_id, p_quantity, p_selling_price);
    
	update products
    set stock = stock - p_quantity
    where prod_id = p_prod_id;
    
    INSERT INTO inventory_audit (prod_id, old_stock, new_stock, action)
    VALUES (p_prod_id, v_current_stock, v_current_stock - p_quantity, 'Sale');
    
    commit;
    
    SELECT 
        v_sale_id AS sale_id,
        p_prod_id AS product_id,
        p_quantity AS quantity_sold,
        (p_quantity * p_selling_price) AS total_amount,
        'Sale completed successfully' AS message;
end //
delimiter ;

delimiter //
create procedure GetLowStockProducts(
in p_threshold int
)
begin
	if p_threshold is null or p_threshold < 0 then
		signal sqlstate "45000"
        set message_text = "min_stock not be zero and neg";
	end if;
	select 
		p.prod_name as product,
        p.stock as current_stock,
        p.category,
        s.supplier_name,
        (p_threshold - p.stock) as reorder_qantity,
        case 
			when p.stock = 0 then "out of stock"
            when p.stock <= p_threshold then "low stock"
            else "In stock"
		end as stock_status
	from products p
    left join suppliers s on p.supplier_id = s.supplier_id
    where p.stock <= p_threshold
    order by stock;

end //
delimiter ;

delimiter //
create procedure supplier_performance_report()
begin
	select
		s.supplier_id,
		s.supplier_name,
        s.phone,
        s.email,
        s.city,
        count(distinct p.prod_id) as product_supplied,
        count(distinct pu.purchase_id) as total_purchase,
		coalesce(sum(pi.quantity),0) as total_unit_purchased,
        coalesce(round(sum(pi.quantity* pi.purchase_price),2),0)  AS total_purchase_value,
        coalesce(round(avg(pi.quantity* pi.purchase_price),2),0)  AS avg_order_value,
        case
			when count(distinct pu.purchase_id) = 0 then "No activity"
			when count(distinct pu.purchase_id) >= 10 then "top supplier"
            when count(distinct pu.purchase_id) >= 5 then "regular supplier"
            else "Ocassional supplier"
		end as supplier_rating
        from suppliers s
        left join products p on s.supplier_id = p.supplier_id
        left join purchases pu on pu.supplier_id = s.supplier_id
        left join purchase_items pi on pu.purchase_id = pi.purchase_id
        group by s.supplier_id, s.supplier_name, s.phone, s.email, s.city
        ORDER BY total_purchase_value DESC;
	end //
    delimiter ;

delimiter //
create trigger auto_inc_stock
AFTER INSERT
on purchase_items
for each row
begin
	declare v_old_stock int;
    
    select stock into v_old_stock
    from products
    where prod_id = new.prod_id;
    
    update products
    set stock = stock + new.quantity
    where prod_id = new.prod_id;
    
    insert into inventory_audit (prod_id, old_stock, new_stock, action)
    values(NEW.prod_id, v_old_stock, v_old_stock + NEW.quantity, 'Purchase');
end//
delimiter ;

SELECT prod_id, prod_name, stock FROM products WHERE prod_id = 1;
INSERT INTO purchase_items (purchase_id, prod_id, quantity, purchase_price)
VALUES (101, 1, 20, 700.00);
SELECT prod_id, prod_name, stock FROM products WHERE prod_id = 1;
SELECT * FROM inventory_audit WHERE prod_id = 1 ORDER BY changed_at DESC;

delimiter //
create trigger prevent_neg_stock
before insert
on sales_items
for each row
begin
	declare v_current_stock int;
    
    select stock into v_current_stock
    from products
    where prod_id = new.prod_id;
    
    if v_current_stock < NEW.quantity then
		signal sqlstate '45000'
        set message_text = 'Not enough stock. Available';
	end if;
end//
delimiter ;

SELECT prod_id, prod_name, stock FROM products WHERE prod_id = 1;
INSERT INTO sales_items (sale_id, prod_id, quantity, selling_price)
VALUES (102, 1, 150, 799.00);

delimiter //
create trigger auto_reduce_stock
after insert
on sales_items
for each row
begin
	declare v_old_stock  int;
    
    select stock into v_old_stock 
    from products
    where prod_id  = new.prod_id;
    
    update products
    set stock = stock - new.quantity
    where prod_id = new.prod_id;

	INSERT INTO inventory_audit (prod_id, old_stock, new_stock, action)
    VALUES (NEW.prod_id, v_old_stock, v_old_stock - NEW.quantity, 'Sale');
end //
delimiter ;

SELECT * FROM inventory_audit;

delimiter //
create trigger prevent_duplicate
before insert
on purchase_items
for each row
begin
	declare v_count int;
    
    select count(*) into v_count
    from purchase_items
    where purchase_id = new.purchase_id and prod_id = new.prod_id;
    
    if v_count >0 then
		signal sqlstate "45000"
        set message_text = 'Product already exists in this purchase';
	end if;

end //
delimiter ;

create table low_stock_alerts(
	alert_id int auto_increment primary key,
    prod_id int not null,
    stock int,
    alert_date datetime default current_timestamp,
    resolved boolean default false,
    FOREIGN KEY (prod_id) REFERENCES products(prod_id)
);

delimiter //
create trigger auto_low_stock_warning
after update
on products
for each row
begin
	if new.stock < 20 and old.stock >= 20 then
		insert into low_stock_alerts(prod_id, stock, alert_date)
        values(NEW.prod_id, NEW.stock, NOW());
	end if;
end //
delimiter ;

-- Report -1 Inventory Valuation Reports
select
	p.prod_name,
    p.category,
    p.stock,
    round(coalesce(avg(pi.purchase_price),0),2) as avg_purchase_price,
    p.price AS selling_price,
    p.price as selling_price,
    round(coalesce(p.stock * avg(pi.purchase_price),0),2) as inventory_cost,
    round(p.stock*p.price) as inventory_selling_value,
    round(p.stock*p.price) - round(coalesce(p.stock * avg(pi.purchase_price),0),2)  as potential_profit
from products p
left join purchase_items pi on p.prod_id = pi.prod_id
group by p.prod_id, p.prod_name, p.category, p.stock, pi.purchase_price, p.price
order by  potential_profit desc

-- Report 2 — Low Stock & Reorder Report
select
	p.prod_name,
	p.category,
    p.stock as current_stock,
    s.supplier_name,
    case
		when p.stock = 0  then "out of stock"
        when p.stock <= 10  then "critical - reorder now"
        when p.stock <= 20  then "low- reorder soon"
        else "In stock"
	end as stock_status,
    case
        when p.stock <= 10 THEN 50
        when p.stock <= 20 THEN 30
        else 0
    end as reorder_quantity,
    coalesce(avg(pi.purchase_price), 0) AS avg_purchase_price,
    round(
		case
			when p.stock <= 10 THEN 50
            when p.stock <= 20 THEN 30
            else 0
        end * coalesce(avg(pi.purchase_price), 0), 2
    ) AS estimated_purchase_cost
from products p
left join suppliers s on p.supplier_id = s.supplier_id
left join purchase_items pi on p.prod_id = pi.prod_id
group by p.prod_id, p.prod_name, p.stock, s.supplier_name, p.category
HAVING current_stock <= 20
ORDER BY p.stock ASC;

-- Report 3 — Supplier Performance Dashboard
select
	s.supplier_id,
    s.supplier_name,
    s.phone,
    s.email,
    s.city,
    count(distinct p.prod_id) as products_supplied,
    count(distinct pu.purchase_id) as total_purchases,
    coalesce(sum(pi.quantity),0) as total_units_purchased,
    coalesce(round(sum(pi.quantity * pi.purchase_price),2),0) as total_purchase_value,
	coalesce(round(avg(pi.quantity * pi.purchase_price),2),0) as avg_order_value,
    case
		when count(distinct pu.purchase_id) = 0 then "No Activity"
        when sum(pi.quantity * pi.purchase_price) >= 1000000 then "Top Supplier"
        when sum(pi.quantity * pi.purchase_price) >= 500000 then "Major Supplier"
        when sum(pi.quantity * pi.purchase_price) >= 100000 then "Regular Supplier"
        else "Occasional Supplier"
	end as supplier_rating
from suppliers s
left join products p on p.supplier_id = s.supplier_id
left join purchases pu on pu.supplier_id = p.supplier_id
left join purchase_items pi on pi.purchase_id = pu.purchase_id
group by s.supplier_id, s.supplier_name, s.phone, s.email, s.city
order by total_purchase_value desc;

-- Report 4 — Inventory Movement Analysis
with product_movement as(
	select
		p.prod_id,
        p.prod_name,
        p.category,
        p.stock as current_stock,
        coalesce(sum(pi.quantity),0) as purchased_units,
        coalesce(sum(si.quantity),0) as sold_units
	from products p
    left join purchase_items pi on pi.prod_id= p.prod_id
    left join sales_items si on si.prod_id = pi.prod_id
    group by p.prod_id, p.prod_name, p.category, p.stock
)
select
	prod_id,
    prod_name,
    category,
    current_stock,
    purchased_units,
    sold_units,
    case
		when sold_units = 0 and purchased_units = 0 then "No Movement"
        when sold_units = 0 then "No Sales (Dead Stock)"
        when purchased_units = 0 then "Stock Not Replenished"
        else " Active"
	end as movement_status,
    case 
		when sold_units = 0 then 0
        else round(purchased_units / sold_units, 2)
	END AS purchase_to_sale_ratio
from product_movement
order by sold_units DESC, purchased_units DESC;

-- Report 5 — Monthly Business Performance
with month_date as(
	select
		date_format(s.sale_date,"%Y-%m-01") as month_date,
        date_format(s.sale_date,"%Y-%m") as month_name,
        coalesce(sum(distinct s.sale_id),0) as total_sales,
        coalesce(sum(si.quantity),0) as total_unit_sold,
        coalesce(round(sum(si.quantity*si.selling_price),2),0) as revenue,
        coalesce(sum(distinct p.purchase_id),0) as total_purchase,
        coalesce(sum(pi.quantity*pi.purchase_price),0) as purchase_cost
	from sales s
    left join sales_items si on s.sale_id = si.sale_id
	cross join (
    select distinct date_format(sale_date,"%Y-%m-01") as sale_month
    from sales) as months
    left join purchases p on date_format(p.purchase_date,"%Y-%m-01") = months.sale_month
    left join purchase_items pi on p.purchase_id = pi.purchase_id
    where months.sale_month = date_format(s.sale_date,"%Y-%m-01") 
    group by date_format(s.sale_date,"%Y-%m-01") , date_format(s.sale_date,"%Y-%m")
)
select
	month_name,
    total_sales,
    total_unit_sold,
    revenue,
    total_purchase,
    purchase_cost,
    revenue - purchase_cost as gross_profit,
    round(
    100*(revenue-lag(revenue) over(order by month_date)) / nullif(lag(revenue) over(order by month_date),0),2 
    ) as revenue_growth_percent,
    round(
    100* ((revenue - purchase_cost) - LAG(revenue - purchase_cost) OVER(ORDER BY month_date)) / 
        NULLIF(LAG(revenue - purchase_cost) OVER(ORDER BY month_date), 0), 
        2
    ) AS profit_growth_percent,
    round((revenue - purchase_cost) / NULLIF(revenue, 0) * 100, 2) AS profit_margin_percent
from month_date
order by month_date

-- Report 6 — Top Revenue Products (Pareto Analysis)
with product_revenue as (
	select
		p.prod_id,
        p.prod_name,
        p.category,
        coalesce(round(sum(si.selling_price*si.quantity),2),0) as revenue
	from products p
    left join sales_items si on si.prod_id = p.prod_id
	group by p.prod_id, p.prod_name, p.category
),
revenue_ranked as(
	select
		prod_id,
        prod_name,
        category,
        revenue,
        row_number() over(order by revenue desc) as rank_no,
        sum(revenue) over() as total_revenue,
        sum(revenue) over(order by revenue desc) as running_revenue,
        round(100* revenue/sum(revenue) over(),2) as contribution_percent,
        round(100* sum(revenue) over(order by revenue desc)/sum(revenue) over(),2) as cumulative_percent
	from product_revenue
    where revenue > 0
)
select
	rank_no,
	prod_name,
	category,
	revenue,
    running_revenue,
	contribution_percent,
    cumulative_percent,
    case
		when cumulative_percent <= 80 then " In Top 80%"
        else "Outside Top 80%"
	end as pareto_category
from revenue_ranked
order by rank_no

-- Report 7 — Unsold & Dead Inventory
select
	p.prod_id,
    p.prod_name,
    p.category,
    s.supplier_name,
    p.stock as current_stock,
    round(p.stock* p.price, 2) as inventory_value
from products p
left join suppliers s on p.supplier_id = s.supplier_id
left join sales_items si on p.prod_id = si.prod_id
where si.sale_id is null
order by inventory_value desc;
    
-- Report 8 — Category Profitability
select
    s.cust_name,
    count(distinct s.sale_id) as total_orders,
    count(distinct si.item_id) as total_items_purchased,
    sum(si.quantity) as total_units,
    round(sum(si.quantity * si.selling_price),2) as total_spending,
    round(avg(si.quantity * si.selling_price),2) as avg_order_value,
    max(s.sale_date) as last_purchase_date,
    datediff(curdate(), max(s.sale_date)) as days_since_last_purchase,
    case
		when count(distinct s.sale_id)>= 10 then "VIP"
        when count(distinct s.sale_id) >=5 then "Loyal"
        when count(distinct s.sale_id) >= 2 then "Regular"
        else "New"
	end as customer_segment
from sales s
left join sales_items si on s.sale_id = si.sale_id
where s.cust_name is not null
group by s.cust_name
order by total_spending desc;

-- Report 9 — Category Profitability
select
	p.category,
    count(distinct p.prod_id) as total_products,
    coalesce(round(sum(si.quantity * si.selling_price),2),0) as revenue,
    coalesce(round(sum(pi.purchase_price * pi.quantity),2),0) as purchase_cost,
    coalesce(round(sum(si.quantity * si.selling_price) - sum(pi.purchase_price * pi.quantity),2),0) as gross_profit,
    case
		when sum(si.quantity * si.selling_price) = 0 then 0
        else round(
        100* (sum(si.quantity * si.selling_price) - sum(pi.purchase_price * pi.quantity)) / nullif(sum(si.quantity * si.selling_price),0),2
        )
	end as profit_margin_percent,
    case
		when sum(si.quantity * si.selling_price) = 0 and sum(pi.purchase_price * pi.quantity) > 0 then "No sales"
        when sum(si.quantity * si.selling_price) > 0 and sum(pi.purchase_price * pi.quantity) = 0 then "No purchased data"
        when 100* (sum(si.quantity * si.selling_price) - sum(pi.purchase_price * pi.quantity)) / nullif(sum(si.quantity * si.selling_price),0)
         >=40 then "high margin"
        when 100* (sum(si.quantity * si.selling_price) - sum(pi.purchase_price * pi.quantity)) / nullif(sum(si.quantity * si.selling_price),0)
         >=20 then "Medium margin"
        when 100* (sum(si.quantity * si.selling_price) - sum(pi.purchase_price * pi.quantity)) / nullif(sum(si.quantity * si.selling_price),0)
         > 0 then "Low Margin"
        else "Negative margin"
	end as margin_category
from products p
left join sales_items si on si.prod_id = p.prod_id
left join purchase_items pi on pi.prod_id = p.prod_id
group by category
order by gross_profit desc;

-- Report 10 — Executive Business Dashboard
with executive_dashboard as(
	select
		(select count(*) from products) as total_products,
        (select count(*) from suppliers) as total_suppliers,
        (select count(*) from sales) as total_orders,
        
        round(sum(p.price * p.stock),2) as inventory_value,
        round(sum(pi.quantity * pi.purchase_price),2) as total_purchase_cost,
        
        coalesce(round(sum(si.quantity * si.selling_price),2),0) as total_revenue,
        coalesce(round(sum(si.quantity * si.selling_price)- sum(pi.quantity * pi.purchase_price),2),0) as gross_profit,
        
        (select count(*) from products where stock <=10 ) as low_stock_items,
        (select count(*) from products where stock = 0 ) as out_of_stock_items,
        
        (select count(*) from products p left join sales_items si on si.prod_id = p.prod_id where si.sale_id is null) as unsold_products
	from products p
    left join sales_items si on p.prod_id  = si.prod_id
    left join purchase_items pi on p.prod_id = pi.prod_id
)
select
	total_products,
    total_orders,
    inventory_value,
    total_purchase_cost,
    total_revenue,
    gross_profit,
    round(100 * gross_profit/ nullif(total_revenue,0),2) as gross_profit_margin,
    low_stock_items,
    out_of_stock_items,
    unsold_products
from executive_dashboard

