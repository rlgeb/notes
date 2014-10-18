# Design Patterns & Idioms

## 1. Observer Pattern

Defines a one-to many dependency between objects so that when one object changes state, all of its dependents are notified and updated automatically.

Example: bulding a station display for diffenet weather measurements.

Notes:
+ One of the most commonly used patterns in the JDK

## 2. Decorator Pattern

Attaches additional responsibilities to an object dynamically.  Decorators provide a flexible alternative to subclassing for extending functionality.

Example: Starbucks cost calculation system for there beverages and all the options for them.

## 3. The Factory Idiom

Defines an interface for creating an object, but lets subclasses decide which class to instantiate.  Factor method lets a class defer instantiation to subclasses.

Example: Pizza shop ordering different types of pizza from different franchises.

## 4. Singleton Pattern
Ensures a class one has one instance, and provides a global point to access it.


## 5. Command Pattern: Encapsulating Invocation
Encapsulates a request as an object thereby letting you parameterize other objects with different requests, queue or log requests, and support undoable operations.

Example: A remote controll with on/off/undo that needs to be designed to work with multiple appliances in a house.

Notes:
+ [An example implimentation](https://github.com/rlgeb/misc-code/tree/master/c%2B%2B/design-patterns/command-pattern)
+ Other uses include queuing requests(job queue, schedulers, thread pools) & logging requests

## 6. Adapter Pattern
Converts the interface of a class into another interface that the client expects.  Adapter lets classes work together that wouldn't otherwise because they have incompatible interfaces.  


Notes:
+ Analogy -> The AC power adapter you need to plug a us laptop in when you visit europe.
+ There are 2 types of adapters object and class.  Class adapters require multiple inheritence.

## 7. Facade Pattern
Provides a unitfied interface to a set of interfaces into a subsystem. Facade defines a higher-level interfaces that make the subsystem easier to use.

## 8. Template Method Pattern
Defines the skeleton of an algorithm in a method, deferring some steps to subclasses.  Template method lets subclasses redefine certain ssteps of an algorithm without changing the algorithm's structure.

Example: brewing coffee and brewing tea.  Another example is a framework.  The framework controls how things gte done, but leave the person using the framework to specify what is actually happening at each step of the algorithm.

## 9. The Iterator Pattern
Provides a way to access the elements of an aggregate obejct sequentially w/o exposing its underlying representation.

Notes:
+ Allows you to remove the rask of iteration away from objects

## 10. Composite Pattern
Allows you to compose objects into tree structures to represent part-whole hierarchies.  Composite lets clients treat individual oject and composition of objects uniformly.

## 11. State Pattern
Alloes an object to alter its behavior when its internal state changes.  The object appear to change its class.

Example: Gumball machine

Notes:
+ Like coding up a state machine
+ Flexible alternative to subclassing

## 12. The Proxy Pattern
Provides a surrogate or placeholder for another object to control access to it.  Types include remote, virtual, protection.

Example: firwall

Notes:
+ firewall proxy - controls access to a set of network resources.
+ smart reference proxy - provides additional actions whenever a subject is referenced, such as counting the number of references to an object.
+ caching proxy - provides temp storage for results of operations that are expensive. It can also allow multiple clients to shar the results to reduce computation or network latency.
+ synchronization proxy - provides safe access to a subject from multiple threads.
+ complexity hiding proxy - hide complexity of and controls access to a complex set of classes. aka facade proxy.
+ copy-on-write-pattern - controls the copying of an object by defering the copyting of an object until it is required by a client.

## 13. MVC - Model View Controller
Pattern used for implimenting user interfaces

Example: Django

Notes:
+ Compound pattern: observer, strategy, composite
+ moodel & observer: keep view/controller updated on state changes
+ view/controller & strategy

# OO Principles

+ Encapsulate what varies 
+ Favor composition over inheritance
+ Program to an interface, not implimentations
+ Strive for loosely coupled designs between objects that interact
+ Classes should be open for extension but closed for modification


