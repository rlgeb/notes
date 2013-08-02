# EECS 281 Algorithms & Data Structures

## INTRO
 
Approach:
<pre>
1,Define problem
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

-we built this list based in 281.   

***queue***-special type of list.  first-in, first-out.  (FIFO)

-we built this array based in 281.

## RECURSIVE PROBLEM SOLVING
if you are given a tree problem then you should be solving it with rucursion

***recursion***-a problem that calls itself.  Use recursive relation to analyse performance.

-must have a termination condition

-each recrsive call must be on a smaller problem

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

### Bubble sort
-simple sort
### Selection sort 
-simple sort

###Quick sort
-divide and conquer
+ easy to impliment
+ works well with a variety of input data
+ consumes little memory
+ ideal partition is the median.  the pivot choice greatly effects preformance. sampling to choose partition can greatly improve performance.
base case: arrays of len 0 or 1 are trivially sorted.  <br />
inductive step: select a partition element.  form 2 arrays lhs and rhs where lhs <= elt and rhs>=elt.  recursively sort lhs and rhs.



<pre><code>
Partition(A, left, right)
  pivotval = A[right]
  i = left -1
  for j=left to right-1
    if A[j] <= pivotval:
      i = i+1
      swap(A[i], A[j])
  swap(A[i+1], A[right])
  return i+1

QuickSort(A, left, right)
  //input: array A and ints left and right
  //output: sorted array A
  if left < right
    pivot = Partition(A, left, right)
    Quicksort(A, left, pivot-1)
    Quicksort(A, pivot+1, right)


</code></pre>

preformance
+ worst case: O(N^2)
+ average case O(N log N)
+ best case O(N log N)


###Merge sort
-divide and conquer

###Heap sort
-divide and conqure



## TREES, PRIORITY QUEUES, & HEAPS

***tree***-nonempty collection of verticies/nodes and edges in which there exsists precisely one path connecting any 2 nodes.

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

bottom up heapify
<pre><code>
void fixUp(Item heap[], int k){
  while(k>1 && heap[k/2]<heap[k]{
    exch(heap[k], heap[k/2]);
    k = k/2;
  }
}
</code></pre>
