# EECS 281 Algorithms & Data Structures

## INTRO
 
Approach:
<pre>
1. Define problem
2. manage/understand complexity
3. break into smaller subtasks
4. refine solution based on expected usage
</pre>


## PRINCIPLES OF ALGO ANALYSIS

approaches:
<pre>
1. Experimentaton:  run tests on data sets
2. solution of recurrence:  mathimatical solution to representation of recursice algo
3. Analysis:  divide algo into parts
</pre>


nature of data:
<pre>
1. best cast: data that promotes best possible behavior. Ω(..) omega notation.  lower bound. 
2. average case: data that promotes expected behavior.  θ(..) theta notation.  upper and lower bound.
3. worst case: data that prometes the worst behavior possible. O(..) big-oh notation. upper bound.
</pre>


growth functions
<pre>
1       = constant
log N   = logarithmic
N       = linear
N log N = N log N
N^2     = quadratic
N^3     = cubic
2^N     = exponential
</pre>


Primatice Operations (cost 1)
<pre>
a. variable assiment
b. arithmetic operation
c. comparisoin
d. array indxing or ptr ref
e. function call
f. function return
</pre>

## STACKS & QUEUES
you ca build these either list or array  based.

***stack***-special type of list.  last-in, first out. (LIFO)

+ we built this list based in 281.   

***queue***-special type of list.  first-in, first-out.  (FIFO)

+ we built this array based in 281.

## RECURSIVE PROBLEM SOLVING
if you are given a tree problem then you should be solving it with rucursion

***recursion***-a problem that calls itself.  Use recursive relation to analyse performance.

+ must have a termination condition

+ each recrsive call must be on a smaller problem

two types of recursion:

1. little steps:
+ given problem in terms of n
+ recursivly sole in terms of n-1 until termination condition is reached
+ ex: fib sequence
2. divide & conquer
+ divide problem into subproblems (ususally in 1/2) 
+ conquer subproblems by sovling them recursively
+ ex: binary search
 
## RECURRENCE RELATIONS 

***recurence relation***-mathimatical way to describe recurence relations.

ex: little steps.  find max in unsorted array.

T(0) = T(1) = 0; T(N) = 1 + T(N-1);

ex: divide and conquer. find max in unsorted array.

T(0) = T(1) = 0; T(N) = 1 + 2T(N/2)

## SORTING ALGOS

### Insert Sort
+ visual: http://upload.wikimedia.org/wikipedia/commons/0/0f/Insertion-sort-example-300px.gif
+ desc:   like sorting cards in you hand.  start on the left place cards (one at a time moving right) in the correct spot to the left of the first inital left card.
<pre>
best  O(n)
avg   O(n^2)
worst O(n^2)
memory 1
stable yes
</pre>

### Bubble sort
+ visual: http://en.wikipedia.org/wiki/File:Bubble-sort-example-300px.gif
+ desc:   compare two elements (0,1) if they are out of order switch them. Compare the next two (1,2) if the are out of order switch them... and so on.  Only can stop after one full pass without any swaps.
<pre>
best  O(n)
avg   O(n^2)
worst O(n^2)
memory 1
stable yes
</pre>

###Quick Sort
+ visual : http://upload.wikimedia.org/wikipedia/commons/9/9c/Quicksort-example.gif
+ desc:    pick a pivot and sort each side such that the pivot is in the correct spot. continue with both sides of the pivot.

+ divide and conquer
+ easy to impliment
+ works well with a variety of input data
+ consumes little memory
+ ideal partition is the median.  the pivot choice greatly effects preformance. sampling to choose partition can greatly improve performance.
base case: arrays of len 0 or 1 are trivially sorted.  <br />
inductive step: select a partition element.  form 2 arrays lhs and rhs where lhs <= elt and rhs>=elt.  recursively sort lhs and rhs.
<pre>
best  O(N log N)
avg   O(N log N)
worst O(N^2)
memory average O(log n)
memory worst O(n)
stable not usually
</pre>

###Merge Sort
+ visual: http://upload.wikimedia.org/wikipedia/commons/c/cc/Merge-sort-example-300px.gif 
+ desc : split the array in half over and over until you have arrays of len one.  Then buid back the arrays sorting them.
+ divide and conquer
<pre>
best  O(n log n)
avg   O(n log n)
worst O(n log n)
memory worst case O(n)
stable yes
</pre>

###Heap sort
+ visual: http://upload.wikimedia.org/wikipedia/commons/4/4d/Heapsort-example.gif
+ desc: build a binary tree out of array.  remove items from heap in order of size maintaining the heap property of parents being >= child
+ divide and conqure
<pre>
best  O(n lg n)
avg   O(n lg n)
worst O(n lg n)
memory 1
stable NO
</pre>

## TREES, PRIORITY QUEUES, & HEAPS

***tree***-nonempty collection of verticies/nodes and edges in which there exsists precisely one path connecting any 2 nodes.

+ can be implimented as an array(vector) or a linked structure
+ root: top most vertex in the tree
+ parent/child: direct links in the tree
+ internal node :  a node w/ children
+ lead/external node: a node  w/o children
+ depth: depth(root) = 0;depth(noe) = depth(paent) + 1;
+ height : height(left) = 0; height(node) = height(child) + 1;

***binary tree***-a data structure with either no nodes or three disjoint sets of nodes - a root, a binary tree called the left subtree, and a binary tree called the right subtree.
+ M-ary tree : defined the same as above where each internal node has M chidren.

***priority queue***- a data structure of items with keys that supports two basic operations: insert a new item and remove the item with the largest key. unsorted arrary implimentation: insert O(1) remove O(N)

***heap***-Storage of data in an array, such that each key is garunteed to be >= the keys in two other specific positions and <= the key in one other specifics positon. 

+ a tree is ___heap-ordered___ if the key in each node id >= the keys of all the nodes children.  
+ no node in a heap-ordered tree has a key larger than the key at the root.
+ a heap is a set of nodes w/ keys arranged in a complete heap-ordered binary tree, represented as an array.
+ parent of node i = floor(i/2)
+ children of i = 2i and 2i+1

## TREES

tree traversal:

+ preorder: visit node, left, right
+ inorder: left, node, right
+ postorder:left, right, node


### Binary Search Trees

***binary search tree***-a binary tree that has key associated w/ each of its internal nodes, with the added property that the key of any node is:
+ >= keys of all nodes of the left subtree
+ <= keys of all the nodes in the right subtree

+ inorder traversal sorts a bst

methods:

+ insert: easy average O(log N) worst  O(N) //depends on how balenced the tree is
+ find: easy average O(log N) worst O(N)
+ remove: need to use rotations

### AVL Trees

methods:

+ seatch / insert O(log N) worst case

Height Balence Property:

+ every internal node v of T, the heights of the children of v differ by at most one.  inserting may require rotations

+ four cases: 2 outside and 2 inside


### Red Black Tree

+ less ridgedly balenced than AVL trees
+ faster to insert and remove slow to search

## HASHING & DICTIONARIES

***dictionary adt***-store items that support 2 basic operations insert a new item and return an item with a given key.

***hashing***-reference items in a table by keys.  use arithmetic operations to transform keys into table addresses (buckets)

M = Table Size

need:

+ hash function: transforms the serach key into a a table address.
1. hash code: t(key) -> intmap. maps the key to an integer
2. compression map: c(intmap) -> address. maps the integer to the array size.

key type = floats in a fixed range

+ key [0, 1] h(key) = floor(key * M)
+ key [s, t] h(key) = floor( ((key-s)/(t-s)) * M)

key type == w-bit ints 

h(key) = floor( key * 0.618033) % PRIME#

key type == string
FILL ME IN

+ collision resolution: dealing with search keys that hash to the same table address.

methods:
<pre>
1. seperate chaining: scheme for collision resolution where we maintain M linked lists one for each table address
2. linear probing: when a collision occurs check the next position in the table
3. double hashing: apply the hash function again when a collision occurs
</pre>

## Graphs 

***graph***-network showing relations between pairs of objects. A graph GG = (V,E) is a set of Vertices V ={v1,v2,...} together with a set of edges E = {e1,e2,...} that connect the pair of vertices.  Edges can be thought of a tuples of vertices; em = (vs, vt)

***simple graph***-graphs w/o parllel edges and w/o self-loops.

|E| = # of Edges<br />
|V| = # of Vertices

***directed graphs***-edges have direction (incomming or outgoing)
***unordered graphs***-nodes on edges form unordered pairs

representation:

adjacency matrix: |V| x |V|
adjacency list: array of ptrs ( 1/ vertex ) to list the edges 


+ dense graph: many edges (|E|~|V^2|), represent as an adjacency matrix
+ sparse graph: few edges ( |E|<<|V^2| ), represent as an adjacency list

+ simple path: sequence of edges leading from 1 vertex to another w/ no vertex appearing twice
+ cycle: like the simple path, but the first node = final node

+ connected graph: simple path exists btween any pair of vertices
+ connected component: subgraph that is connected

O(V + E) w/ adj list
O(V^2) w/ adj matrix

### Algos

***depth first search***-discovers a path from source s to goal g if one exsits. Uses a stack and is usually faster.

***breadth first search***-discovers the shortest path from source to any goal.  Uses a queue.

***minimal spanning tree***-the tree T that contains all the nodes in grpah G & the sum of of the cost of the edges in T in minimal. 

methods:

***Prims Algorithm***: greedy algorithm for finding MST by adding node currently closest to tree.  
steps:
<pre>
1. init 2 sets of verticies 'inies' & 'outies'
2. 1st ini is a random node 
3. choose outie w/ the smallest distance to any inie
4. move that outie to the inies set. 

data structure: martix of vert - visited - distance - parent

</pre>

***Kruskals Algorithm**- greedy algorithm for finding MST. selects edgess 1 at a time and addes them to a forest.
steps:
<pre>
1. select the minimum edge not already added
2. make sure it does not cause any cycles
3. repeat until done
</pre>


***Dijkstras Algorithm***- greedy single source shortest path algorithm.  Given a weighted gprah and 2 verticeies find the shortest path between them

data structure- matrix of vert - is the shortest path from start to vert known? - what is the length of the shortest path - what is the parent of v on that path.

all pairs shortest path.  Run Dijkstra on each verticie in the set.

***Floyds Algorithm***-All source shortest path.  Dynamic programming method for solving all-pairs shortest path.  Always better on a dense graph. may be better on a sparse graph.

data structure- adjacency matrix VxV(from x to).  should be mirrored down the middle

O(V^3) best, worst, average
vk is a set of verticies
steps:
<pre>
1. init distaces to the edges
2. add verticies to vk one at a time 
3. foreach new vertex, consider whether it improves each possible path
</pre>

***Dynamic Programming***-eliminate costly re-computation in any recursive algorithm.  cost is space.

Example: fibonacci sequence

Example: A thief robbing a safe finds it with N items of varrious size and value.  The thief has a knapsack of capacity M.  Find the max value the thief can pack into his knapsack.

brute force: O(N2^N)
1. gernerate posible solution space
2. filter possible subsets
3. determine optimal solution

greedy: O(NlgN)

1. sort items by ration of value to size
2. choose highest ratio first

DP: 


### Algorithm Families

1. Brute Force: Solve a problem in the most simple, direct, or obvious way
2. Greedy: makes sequence of decisions, and never reconsiders already made decisions.  always chooses the local optimum.  
3. Divide & Conquer: divide the problem into two or more smaller subproblems, preferable of equal size.
4. Dynamic Programming: Remebers partial soultions when smaller instances are related. Solves small instances first, stores them and then looks them up.

Example: Counting Change - return the specified sum using the smallest number of coins.
Greedy approach is much faster however it does not always return the optimal solution.

***backtracking***-Consider all possible outcomes of each decision, but prune searches that do not satisfy constraints.

Example: N Queens

***branch & bound***-same idea as backtracking but extended to optimization problems.  partial solutions are pruned if its cost is >= the current best solution.


### Text Compression

***huffman encoding***-encode text str Y based upon frquency of each char.

steps:
<pre>
1. determine the frequency of each char
2. create extrernal nodes for each char. the nodes contain the char and its frequency.
3. interatively, until only one tree remaining.
  - conbine twilio trees w/ smallest frequencies
  - set frequency of the new node = frequency of left + right
4. determine code by following path
  -leftchild = 0
  -rightchild = 1


