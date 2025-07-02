CREATE DATABASE TicketsSupport;
GO

CREATE TABLE OperatingSystem (
    id INT NOT NULL PRIMARY KEY,
    name_os NVARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(250) NOT NULL
);

CREATE TABLE Status (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Versions (
    id INT NOT NULL PRIMARY KEY,
    number_version NVARCHAR(10) NOT NULL
);

CREATE TABLE ProductVersionsOS (
    id INT NOT NULL PRIMARY KEY,
    product_id INT NOT NULL,
    version_id INT NOT NULL,
    operating_system_id INT NOT NULL,
    FOREIGN KEY (version_id) REFERENCES Versions(id),
    FOREIGN KEY (operating_system_id) REFERENCES OperatingSystem(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

CREATE TABLE Tickets (
id INT NOT NULL PRIMARY KEY,
date_create date NOT NULL,
date_end date NULL,
status_id INT NOT NULL,
productVersionsOS_id INT NOT NULL,
problem VARCHAR(250) NOT NULL,
resolution VARCHAR(250) NULL,
FOREIGN KEY (productVersionsOS_id) REFERENCES ProductVersionsOS(id),
FOREIGN KEY (status_id) REFERENCES Status(id)
);