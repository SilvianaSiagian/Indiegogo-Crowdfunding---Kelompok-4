--CREATE DATABASE IndiegogoCF

--USE IndiegogoCF

-- Create Dimension Tables

CREATE TABLE Dim_Category (
    category_id INT PRIMARY KEY,
    category VARCHAR(255)
);

CREATE TABLE Dim_Currency (
    currency_id INT PRIMARY KEY,
    currency VARCHAR(255)
);

CREATE TABLE Dim_Product (
    product_id INT PRIMARY KEY,
    product_stage VARCHAR(255)
);

CREATE TABLE Dim_Project (
    project_id INT PRIMARY KEY,
    project_type VARCHAR(255),
	category VARCHAR(255),
	tag VARCHAR(255),
    funds_raised_percent DECIMAL(5, 2)
);

CREATE TABLE Dim_Tag (
    tag_id INT PRIMARY KEY,
    tag VARCHAR(255)
);

CREATE TABLE Dim_Time (
    time_id INT PRIMARY KEY,
    open_date DATE,
    open_time TIME,
    close_date DATE,
    close_time TIME
);

-- Create Fact Table

CREATE TABLE Fact_Indiegogo (
    project_id INT, -- Foreign key to Dim_Project
    category_id INT, -- Foreign key to Dim_Category
    currency_id INT, -- Foreign key to Dim_Currency
    product_id INT, -- Foreign key to Dim_Product
	tag_id INT, -- Foreign key to Dim_Tag
	time_id INT, -- Foreign key to Dim_Time
    open_date DATE,
    funds_raised_amount DECIMAL(10, 2),
    close_date DATE,
	
    FOREIGN KEY (project_id) REFERENCES Dim_Project(project_id),
    FOREIGN KEY (category_id) REFERENCES Dim_Category(category_id),
    FOREIGN KEY (currency_id) REFERENCES Dim_Currency(currency_id),
    FOREIGN KEY (product_id) REFERENCES Dim_Product(product_id),
    FOREIGN KEY (tag_id) REFERENCES Dim_Tag(tag_id),
	FOREIGN KEY (time_id) REFERENCES Dim_Time(time_id)
);