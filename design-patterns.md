# Design Patterns & Idioms

## Observer Pattern

Defines a one-to many dependency between objects so that when one object changes state, all of its dependents are notified and updated automatically.

Example: bulding a station display for diffenet weather measurements.

Notes:
+ One of the most commonly used patterns in the JDK

## Decorator Pattern

Attaches additional responsibilities to an object dynamically.  Decorators provide a flexible alternative to subclassing for extending functionality.

Example: Starbucks cost calculation system for there beverages and all the options for them.

## The Factory Idiom

Defines an interface for creating an object, but lets subclasses decide which class to instantiate.  Factor method lets a class defer instantiation to subclasses.

Example: Pizza shop ordering different types of pizza from different franchises.

## Command Pattern: Encapsulating Invocation

Encapsulates a request as an object thereby letting you parameterize other objects with different requests, queue or log requests, and support undoable operations.

Example: A remote controll with on/off/undo that needs to be designed to work with multiple appliances in a house.

# OO Principles

+ Encapsulate what varies 
+ Favor composition over inheritance
+ Program to an interface, not implimentations
+ Strive for loosely coupled designs between objects that interact
+ Classes should be open for extension but closed for modification


