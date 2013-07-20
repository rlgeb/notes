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

testing steps
1. understand the spec
2. id req behaviors
3. write specific tests
4. know the test ans
5. stress test

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

***array***-data structure that is fixed size, homogeneous, indexed.  Passed by reference.<br />
syntax:<br />
<pre><code>
int myarray[4] = { 1,2,4,5 };
int myfunc(int myarray[], int my_array_size);
</code></pre>
cstring example:<br />
<pre><code>
char a[] = "foo"`
a[0] = 'f'
a[1] = 'o'
a[2] = 'o'
a[3] = '\0'
</code></pre>

***pointers***-address of an object. Dereference operator is * what is at the address store.<br />
syntax:<br />
<pre><code>int foo;
int *bar;
bar = &foo;
foo = 1;
</code></pre>

## ARRAY TRAVERSAL (7)
***pointer arithmatic***-just move this pointer to the by the amount of the reference type. <br /> 
syntax:<br />
<pre><code>bar  + 1 //would just move to the next int in memory</code></pre>

some additional pointer notes:

<pre><code>const T *p; //T the pointer to obj cannot be changed
T *const p; //p the pointer cannont be changed
const T *const p //neither can be changed</code></pre>

## STRUCTS AND ENUMS (9)
struct: compound object
<pre><code>
struct myStuct{
  int var1;
  char abc;
};</code></pre>

<pre><code>const type name;
once the value is initialized it is never allowed to change
conts int would be a supertype of an int//this is backwards of what you would think</code></pre>

<pre><code>enum Rank = { BEST, AVG, WORST }</code></pre>

sometimes when working with enums you have to use

<pre><code>static_cast<Type>(value)</code></pre>

INPUT & OUTPUT  (10) 

int main(int argc, char* argv[]) is the type signature of the main program

1. compile
`g++ programm.cpp -o a.out`
2. run
`./a.out 2 3 4`

or 
<pre><code>./a.out >inputfile
./aout < outputfile/code></pre>

cin >>
cout <<

***template***-remember that they suck for trying to debug sometimes
syntax:<br /><pre><code>
template <typename T>
T sum(T a[], int size)</code></pre>

EXCEPTIONS (11)
<pre><code>
try{
  if(...) throw x;

}
catch(type X){

}
`</code></pre>

12. SKIP

## ABSTRACT DATA TYPES aka classes (13)
talking about WHAT something does vs HOW it does something

***Abstract Data Tupe (ADT)***-description of values and operations
+ INFORMATION HIDDING: we do not need to know the representation or implimentation of the object
+ ECAPSULATION: the objects and their operations are defined in the same place
+ ABSTRACTION: both local and substitutable

syntax:<br />
<pre><code>
class Myclass{
	//OVERVIEW:

	int v;
	public: 
		int get_value();
		//RME

		void set_value();

};
`
</code></pre>
private: defualt of all the classes.  accessible only within the class and its members

public: accessible everywhere, within and outside the class scope

protected: accessible within the class and its methods and descendants

Constructor:call when you istantiate a new object of this type
syntax

`ClassName::ClassName(){}`


## ADT EFFICENCY & SUBTYPES (14)

***substitution principle***-a subtype may be provided where a supertype is expected

## SUBTYPES & SUBCLASSES (15)

3 ways to create a subtype:
1. weken the precondition of one or more operations
2. strengthen the postcondition of one or more operations
3. add one or more operations

syntax:
<pre><code>
class MaxIntSet : public IntSet{
	public:
		int max();
};
`
</code></pre>
***virtual functions***-virtual keyword tells c++ to choose at runtime which version of a member to use.  It maybe overridden by a subclass.  The compilier creates a virtual table for each virtual function inited to the appropriate implimentation.

syntax: `virtual void insert();`


## INERFACES & INVARIANTS (16)

***virtual base class/ abstact base class***:  interface only class from which implimentation can be dervied.

syntax: 
`
`virtual bool query() = 0;`
`
this is a ***pure virtual function***.  You cannot create any instances of this.  So you must create references and pointers to them.

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
3 types of objects:
1. global - space reserved at compile time
2. local - space reserved at runtime
3. dynamic - compilier does not need to know how big it will be or how long it will live

syntax: 
`int *ip = new int; //allocates space on the heap`

`delete ip; //only objects created by new can be deleted`

***memory leak***- when you end up with dynamically allocated object that does not have anything pointing to it and can not be deleted.


The address space:
stack
THE BIG VOID
Heap
Global 
Text

## COPYING ARRAYS SLIDES (18)
to delete arrays use:
`delete[] ip;`


***destructor***-opposite of a constructor. if your class allocates dynamic memory then you need a destructor to deallocate that memory and avoid memory leaks.

syntax: `ClassName::~ClassName(){}`

copy contructor: passing arguments by-value
tasks:
1. allocate an array of the same size as the source sets
2. copy each element from the source to the new
3. copy all the other members

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
***assignment operator***-given a target and a source makes the target a copy of the source
syntax: `AClass& operator= (const AClass& source)`

-generally both of these methods call the same "copy" method





