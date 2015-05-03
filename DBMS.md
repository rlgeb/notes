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
A tabular representation of data.

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

***view*** - used just like a relation but we store a definition rather than a set of tuples.

<pre>
CREATE VIEW Athens_Olympians (aid, name, country)
AS SELECT A.aid, A.name, A.country
FROM Athlete A, Competes C, Olympics O
WHERE A.aid = C.aid AND C.oid = O.oid
 AND O.year = 2004 
</pre>

***assertion*** -  general constraint over multiple tables
<pre>
CREATE ASSERTION smallClub
CHECK
((SELECT COUNT (S.sid) FROM Sailors S) +
 (SELECT COUNT (B.bid) FROM Boats B) < 100)
</pre>

Trigger
<pre>
CREATE TRIGGER incr_count AFTER INSERT ON Student /* Event */
FOR EACH ROW
WHEN (new.age >= 18) /* Condition */
BEGIN /* Action */
count := count + 1;
END 
</pre>

Orderby - Attribute in order by must be in select. Adding multiple orderby 
items is a tie breaker
<pre>
SELECT S.sname, S.age
FROM Sailors S
ORDER BY S.age DESC
</pre>

Union
UNION ALL - keep duplicates
<pre>
SELECT S.sname
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid AND R.bid = B.bid
 AND (B.color = ʻredʼ OR B.color = ʻgreenʼ))
SELECT S.sname
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid AND R.bid = B.bid AND B.color = ʻredʼ
UNION
SELECT S.sname
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid and R.bid = B.bid AND B.color = ʻgreenʼ
</pre>

Intersection
<pre>
SELECT S.sid
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid AND R.bid = B.bid AND B.color = ʻredʼ
INTERSECT
SELECT S.sid
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid and R.bid = B.bid AND B.color = ʻgreenʼ
</pre>

Nested Queries
Operators -NOT IN, NOT EXISTS, NOT UNIQUE, ANY, op ALL, op is <, ≤, >, ≥, =, ≠
<pre>
SELECT S.sname
FROM Sailors S
WHERE S.sid IN (SELECT R.sid
 FROM Reserves R
 WHERE R.bid=103)
</pre>

Aggregate Operators
COUNT (*)
COUNT ( [DISTINCT] A)
SUM ( [DISTINCT] A)
AVG ( [DISTINCT] A)
MAX (A) Can use Distinct
MIN (A) Can use Distinct
<pre>
SELECT COUNT (*) FROM Sailors S
</pre>

GROUP BY and HAVING
<pre>
SELECT [DISTINCT] target-list
FROM relation-list
WHERE qualification
GROUP BY grouping-list
HAVING group-qualification 
</pre>


***SQL injection*** -  is a technique where malicious users can inject SQL commands into an SQL statement.

## Normalization
Redundancy Problems:
+Redundant storage
  + A supplier supplies multiple items
+ Update anomalies
  + Change address of a supplier
+ Insertion anomalies
 + Insert a supplier (nulls?) 
 + What if the supplier doesnʼt supply any items?
+ Deletion anomalies
 + What if we want to delete the last item tuple?

