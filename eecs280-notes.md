(1,2. SKIP)

## RECURSION (3)

**Abstraction**:
+  hides uneccessay details
+  reduces complexity
+ types <br />
	* procedural: functions<br />
  	  Properties:<br />
  		- Local: can be understood w/o looking at other code
		- Substitutable: replace with about implimentation
	* data


**Recursive Functions**:<br />
1. what is the base case<br />
2. how can this problem be broken down into smaller ones


## TAIL RECURSION (4)

**Tail Recursion**: 
+ no pending computation
+ usually invol
+ a helper function with an additional parameter to keep track of state
+ requires constant stack space
+ bascially same as iteration

**Testing**:<br />
***testing***-discovering something is broken</br >
types<br />
+ incremental
+ testing smaller easier to understand units	
+ just wrote the code easier to fix

***debuging***-fixing something that is broken

## TESTING & FUNCTION POINTERS (5)

<pre>
testing steps
1. understand the spec
2. id req behaviors
3. write specific tests
4. know the test ans
5. stress test
</pre>

test case classes
+ simple
+ boundry
+ nonsense

***regression testing***-running tests to make sure new code didn not brake anything

***function pointer***-pointer to executable code in memory.  Useful if you want to make similar functoins such as max/min

## RECURSION & ITERATION (6)

***recursive problem***-defined in terms of itself
+ one or more base case
+ way to solve bigger problem by first solving a smaller problem

( ADD RECURSIVE STEP THROUGH EX )

## ARRAYS & POINTERS (6)

***list***-data structure that can grow as large as need be

***array***-data structure that is fixed size, homogeneous, indexed.  Passed by reference.


cstring example:<br />

<pre>
char a[] = "foo"
a[0] = 'f'
a[1] = 'o'
a[2] = 'o'
a[3] = '\0'
</pre>

***pointers***-address of an object. Dereference operator is * what is at the address store.

syntax:<br />
<pre>
int foo;
int *bar;
bar = &foo;
foo = 1;
</pre>

## ARRAY TRAVERSAL (7)

***pointer arithmatic***-just move this pointer to the by the amount of the reference type. <br /> 
syntax:<br />
<pre>
bar  + 1 //would just move to the next int in memory
</pre>

some additional pointer notes:

<pre>
const T *p; //T the pointer to obj cannot be changed
T *const p; //p the pointer cannont be changed
const T *const p //neither can be changed
</pre>

## STRUCTS AND ENUMS (9)
struct: compound object
<pre>
struct myStuct{
  int var1;
  char abc;
};
</pre>

<pre><code>const type name;
once the value is initialized it is never allowed to change
conts int would be a supertype of an int//this is backwards of what you would think</code></pre>

<pre><code>enum Rank = { BEST, AVG, WORST }</code></pre>

sometimes when working with enums you have to use

<pre><code>static_cast<Type>(value)</code></pre>

INPUT & OUTPUT  (10) 

int main(int argc, char* argv[]) is the type signature of the main program


1. compile
<pre>`g++ programm.cpp -o a.out`</pre>
2. run
<pre>`./a.out 2 3 4`</pre>

or 

./a.out > inputfile<br />
./aout < outputfile/ 


cin >>
cout <<

***template***-remember that they suck for trying to debug sometimes
syntax:<br />
<pre>
template <typename T>
T sum(T a[], int size)
</pre>

## EXCEPTIONS (11)
<pre>
try{
  if(...) throw x;

}
catch(type X){

}
</pre>


## ABSTRACT DATA TYPES (13)

talking about WHAT something does vs HOW it does something

***Abstract Data Tupe (ADT)***-description of values and operations
+ INFORMATION HIDDING: we do not need to know the representation or implimentation of the object
+ ECAPSULATION: the objects and their operations are defined in the same place
+ ABSTRACTION: both local and substitutable

syntax:<br />
<pre>
class Myclass{
	//OVERVIEW:

	int v;
	public: 
		int get_value();
		//RME

		void set_value();

};
`

</pre>
private: defualt of all the classes.  accessible only within the class and its members

public: accessible everywhere, within and outside the class scope

protected: accessible within the class and its methods and descendants

Constructor:call when you istantiate a new object of this type
syntax

<pre>`ClassName::ClassName(){}`</pre>


## ADT EFFICENCY & SUBTYPES (14)

***substitution principle***-a subtype may be provided where a supertype is expected

## SUBTYPES & SUBCLASSES (15)

3 ways to create a subtype:
1. weken the precondition of one or more operations
2. strengthen the postcondition of one or more operations
3. add one or more operations

syntax:
<pre>
class MaxIntSet : public IntSet{
	public:
		int max();
};
`
</pre>
***virtual functions***-virtual keyword tells c++ to choose at runtime which version of a member to use.  It maybe overridden by a subclass.  The compilier creates a virtual table for each virtual function inited to the appropriate implimentation.

syntax: <pre>`virtual void insert();`</pre>


## INERFACES & INVARIANTS (16)

***virtual base class/ abstact base class***:  interface only class from which implimentation can be dervied.

syntax: 

`virtual bool query() = 0;`

this is a ***pure virtual function*** meaning that the subclass MUST impliment this method.  You cannot create any instances of this.  So you must create references and pointers to them.

you derive a subclass from the abstract class and put the implimentation in it.  Note:  must include a constructor since the abc can not have one.


now all you need is a access function in the implimentation
<code><pre>
static ImpAClass i;
IntSet *getAClass(){
  return &i;
}
</code></pre>
so now for a user to access AClass:

`AClass *a = getAClass();`

***invarient***: a set of conditions, that evaluate to true or false, that must always be true for certain well defined points; otherwise the program is incorrect.  

3 types:
1. recursive
2. iterative
3. representation-applies to the data members comprising an impl of an adt

## MEMORY MODLES (17)
<pre>
3 types of objects:
1. global - space reserved at compile time
2. local - space reserved at runtime
3. dynamic - compilier does not need to know how big it will be or how long it will live
</pre>

syntax: 
`int *ip = new int; //allocates space on the heap`

`delete ip; //only objects created by new can be deleted`

***memory leak***- when you end up with dynamically allocated object that does not have anything pointing to it and can not be deleted.

<pre>
The address space:
stack
THE BIG VOID
Heap
Global 
Text
</pre>

## COPYING ARRAYS SLIDES (18)
to delete arrays use:
`delete[] ip;`


***destructor***-opposite of a constructor. if your class allocates dynamic memory then you need a destructor to deallocate that memory and avoid memory leaks.

syntax: `ClassName::~ClassName(){}`

copy contructor: passing arguments by-value
tasks:<br />
1. allocate an array of the same size as the source sets<br />
2. copy each element from the source to the new<br />
3. copy all the other members<br />

syntax:`AClass(const AClass &source);`

***assignment operator***-copies contents from one instance to another

## DEEP COPIES AND RESIZING (19)

***copy constructor***-Given a blob of memory and example, makes the blob a copy of the example. chases ptrs and copies what they are pointing to.
syntax: 
<pre><code>
AClass()::AClass(const AClass &source)
{
  //init member variables
  copy(source);

}
</code></pre>
***assignment operator***-given a target and a source makes the target a copy of the source.  allows for chained assignment.  
syntax: `AClass& operator= (const AClass& source)`

-generally both of these methods call the same "copy" method

## LINKED LISTS (20)

***linked list***-a structure of zero or more container connected by ptrs

## TEMPLATES (21)

***double-ended linked list***-there are both first and last ptrs

***doubly-linked list***-list has both next and previous ptrs

-when you have really big objects pass them by reference, and create a list of ptrs to them.

***Polymorphism***-literally many forms.  Re-using code for different types.There are 2 forms in C++: Templated containers and Polymorphic objects

syntax:<br />
<pre><code>
//class definition
template <class T>
class List{
  ...
};

//class implimentation
void List<T>::someMethod{}

//istansiation
List<int> int_list;
</code></pre>


## POLYMORPHISM & BUGS (22)

***polymorphic container***-can hold more than one type at once

need to create a base class with at least one virtual method. This will be our special container type and everything else will be a subtype of it.
but because this does not work both ways we must use dynamic_cast.
`dynamic_cast<type>(value);`

***named constructor idiom***-a method that copis the obj, returning a ptr to the generic base class.  this method is usually named clone and is a pure vitural function in the base class;

# Iterators (23)

***iterator***-provide an abstraction that can access each oject in the set. They are a seperate abstraction from the container becuase they may have a shorter lifetime and there also maybe more than one of them.  iterators have two main methods create and next.  

***friend***-allows you to expose the private state of a class to another. It is something that is given not taken.  This declaration is really important for iterators to be able to access them details of the class they provide access to.

syntax:

<pre><code>
class ListItr{
  friend class List;
  List *lp;
  node *next;
  bool valid;
 public:
  ListItr(List &l);
  ~ListItr();
  const Object *getNext();
};

class List{
  friend class ListItr;
  ListItr *i;
  ...
};
</code></pre>

# FUNCTORS (24)

reason:  two similar functions has_even and has_odd why should we have two almost identical functions?  Functions are not first class in c++ so we can create function objects.

We do this by overloading the () symbol in a class.  


# CONCURENCY (25)

running things in parallel.


