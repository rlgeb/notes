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

Query
<code>
SELECT O.year
FROM Athletes A, Olympics O, Compete C
WHERE A.aid = C.aid AND O.oid = C.oid
 AND A.name = ʻMichael Phelpsʼ
</code>
 
