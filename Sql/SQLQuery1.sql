-- CREAR BASE DE DATOS SI NO EXISTE
USE master
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'OISHI')
BEGIN
    CREATE DATABASE OISHI;
    PRINT 'La base de datos OISHI ha sido creada correctamente.';
END
ELSE
BEGIN
    PRINT 'La base de datos OISHI ya existe.';
END

USE OISHI;



CREATE TABLE CLIENT (
    id_client int  NOT NULL,
    name varchar(100)  NOT NULL,
    address varchar(80)  NOT NULL,
    phone varchar(15)  NOT NULL,
    email varchar(50)  NOT NULL,
    registration_date date  NOT NULL,
    CONSTRAINT CLIENT_pk PRIMARY KEY  (id_client)
);

-- Table: DISH
CREATE TABLE DISH (
    id_dish int  NOT NULL,
    dish_name varchar(50)  NOT NULL,
    description text  NOT NULL,
    price decimal(8,2)  NOT NULL,
    CONSTRAINT DISH_pk PRIMARY KEY  (id_dish)
);

-- Table: EMPLOYEE
CREATE TABLE EMPLOYEE (
    id_employee int  NOT NULL,
    name varchar(50)  NOT NULL,
    position varchar(30)  NOT NULL,
    hire_date date  NOT NULL,
    CONSTRAINT EMPLOYEE_pk PRIMARY KEY  (id_employee)
);

-- Table: MENU
CREATE TABLE MENU (
    id_menu int  NOT NULL,
    name_menu int  NOT NULL,
    description text  NOT NULL,
    CONSTRAINT MENU_pk PRIMARY KEY  (id_menu)
);

-- Table: ORDER
CREATE TABLE "ORDER" (
    id_order int  NOT NULL,
    id_client int  NOT NULL,
    datetime datetime  NOT NULL,
    total decimal(10,2)  NOT NULL,
    status varchar(50)  NOT NULL,
    employee_id int  NOT NULL,
    CONSTRAINT ORDER_pk PRIMARY KEY  (id_order)
);

-- Table: ORDER_DETAILS
CREATE TABLE ORDER_DETAILS (
    id_details_order int  NOT NULL,
    id_order int  NOT NULL,
    id_dish int  NOT NULL,
    quantity int  NOT NULL,
    unit_price decimal(10,2)  NOT NULL,
    CONSTRAINT ORDER_DETAILS_pk PRIMARY KEY  (id_details_order)
);

-- Table: PAYMENT_METHOD
CREATE TABLE PAYMENT_METHOD (
    id_method int  NOT NULL,
    payment_type varchar(100)  NOT NULL,
    description text  NOT NULL,
    CONSTRAINT PAYMENT_METHOD_pk PRIMARY KEY  (id_method)
);

-- foreign keys
-- Reference: DETALLE_PEDIDO_PEDIDO (table: ORDER_DETAILS)
ALTER TABLE ORDER_DETAILS ADD CONSTRAINT DETALLE_PEDIDO_PEDIDO
    FOREIGN KEY (id_order)
    REFERENCES "ORDER" (id_order);

-- Reference: DETALLE_PEDIDO_PLATO (table: ORDER_DETAILS)
ALTER TABLE ORDER_DETAILS ADD CONSTRAINT DETALLE_PEDIDO_PLATO
    FOREIGN KEY (id_dish)
    REFERENCES DISH (id_dish);

-- Reference: ORDER_EMPLOYEE (table: ORDER)
ALTER TABLE "ORDER" ADD CONSTRAINT ORDER_EMPLOYEE
    FOREIGN KEY (employee_id)
    REFERENCES EMPLOYEE (id_employee);

-- Reference: PEDIDO_Cliente (table: ORDER)
ALTER TABLE "ORDER" ADD CONSTRAINT PEDIDO_Cliente
    FOREIGN KEY (id_client)
    REFERENCES CLIENT (id_client);
