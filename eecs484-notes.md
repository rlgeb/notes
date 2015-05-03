# EECS 484 Database Management Systems

## Intro
***DBMS*** - Database Management system

Levels of abstraction
1. conceptual schema - defines logical structure.
2. physical schema - defines the files and indexes used
3. external schema - defines how users see the data, views

***DDL*** - Data Definiation Language. language schemas are defined in.

***DML*** - Data Manipulation Language. describes how data is modified/queried.

## ER Model

***Entity*** - Distinguishable real-world object 
***Key*** -  minimal set of attributes whose values uniquely identify an entity

***Relationship*** - Association among two or more entities

## Relational Model

***SQL*** - Structured Query Language. declarative

Basic Usage

Query
<pre>
SELECT O.year
FROM Athletes A, Olympics O, Compete C
WHERE A.aid = C.aid AND O.oid = C.oid
 AND A.name = ʻMichael Phelpsʼ
</pre>

Destroy/Alter
<pre>
DROP TABLE Olympics 

ALTER TABLE Athlete
 ADD COLUMN age: INTEGER 
</pre>

Adding and Deleting
<pre>
INSERT INTO Athlete (aid, name, country, sport)
VALUES (4, ʻJohann Kossʼ, ʻNorwayʼ, ʻSpeedskatingʼ) 

DELETE
FROM Athlete A
WHERE A.name = ʻSmithʼ
</pre>

Primary and Candidate Keys
<pre>
CREATE TABLE Athlete
(aid INTEGER,
 name CHAR(30) NOT NULL,
 country CHAR(20),
 sport CHAR(20),
UNIQUE (name, country),
PRIMARY KEY (aid)) 
</pre>

Foreign Key
<pre>
CREATE TABLE Compete
 (aid INTEGER, oid INTEGER,
 PRIMARY KEY (aid, oid),
 FOREIGN KEY (aid) REFERENCES Athlete) 
</pre>

Referential Integrity
<pre>
CREATE TABLE Compete
 (aid INTEGER, oid INTEGER,
 PRIMARY KEY (aid, oid),
 FOREIGN KEY (aid)
REFERENCES Athlete
ON DELETE CASCADE
ON UPDATE NO ACTION) 
</pre>
+ Default is NO ACTION (action is rolled back); Similar to RESTRICT (action is disallowed)
+ CASCADE (also delete all tuples that refer to deleted tuple)
+ SET NULL / SET DEFAULT (sets foreign key value of referencing tuple)
