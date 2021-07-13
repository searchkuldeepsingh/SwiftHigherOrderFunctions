# Swift Higher Order Functions
 Higher Order Functions in Swift
 
 
Higher order functions in Swift are extremely powerful tools to have in your developer toolkit, the only issue is that it might take some time to get comfortable with them. Before we get started, let’s have a look at some important terms to know in relation with higher order functions:
 
Collections - a sequence whose elements can be traversed multiple times, nondestructively, and accessed by an indexed subscript.
 
Closures - self-contained blocks of functionality that can be passed around and used in your code.
 
Shorthand arguments - Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.
 
Optional - A type that represents either a wrapped value or nil, the absence of a value.
 

Those function are Map, Filter, Reduce, Sort, CompactMap, Chaining, Contains, Partition.


Swift 4.2 introduce new collection higher order functions.
allSatisfy
Previosly we saw the contains method that return a bool based on whether at least one element in a collection satisfies a condition. The new allSatisfy method instead returns a bool based on whether all elements satisfy a condition.
firstIndex and lastIndex
We now have firstIndex(where:) and firstIndex(of:) that return the first index where the specified value appears in the collection. We have also lastIndex(of:) and lastIndex(where:) that returns the last index in which an element of the collection satisfies the given predicate.
removeAll
Now we have a new method removeAll(where:) that removes all the elements that satisfy the given predicate.
