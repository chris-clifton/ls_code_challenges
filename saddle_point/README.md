# Saddle Point

Write a program that detects saddle points in a matrix

So you have a matrix like so:

```ruby
    0  1  2
  |---------
0 | 9  8  7
1 | 5  3  2     <--- saddle point at (1,0)
2 | 6  6  7
```
It has a saddle point at (1,0).

It's called a saddle point because it is greater than or equal to every element in it's row and less than or equal to every element in it's column.

A matrix may have zero or more saddle points.

Your code should be able to provide the (possibly empty) list of all the saddle points for any given matrix.

Note that you may find other definitions of matrix saddle points bt the tests for this exercise follow the above unambiguous definition.

Yeehaw...