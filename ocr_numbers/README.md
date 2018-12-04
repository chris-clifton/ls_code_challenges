# OCR Numbers

Write a program that, given a 3 x 4 grid of pipes, underscores, and spaces, can determine which number is represented, or wheter it is garbled.


**Step One**

To begin with, convert a simple binary font to a string containing 0 or 1. The binary font uses pipes and underscores, four rows high and three columns wide.

If input is correct size, but not recognizeable, program should return '?'.  If input is incorrect size, program should return an error.

```ruby
 _   #
| |  # zero.
|_|  #
     # the fourth row is always blank
```
```ruby
   #
|  # one.
|  #
   # (blank fourth row)
```


**Step Two**

Update program to recognize multi-character binary strings. and replacing garbled numbers with '?'

**Step Three**

Update program to recognize all numbers 0 to 9, individually and as a part of a larger string

```ruby
  _  _     _  _  _  _  _  _  #
| _| _||_||_ |_   ||_||_|| | # decimal numbers.
||_  _|  | _||_|  ||_| _||_| #
                             # fourth line is always blank
```
Converts to '1234567890'

**Step Four**

Update program to handle multiple numbers, one per line.  When converting several lines, join the lines with commas.

```ruby
    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|

 _  _  _
  ||_||_|
  ||_| _|
```