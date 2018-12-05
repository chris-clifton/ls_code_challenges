# Rail Fence Cipher

Implement encoding and decoding for the rail fence cipher

The Rail Fence cipher is a form of transposition cipher that gets its name from the way in which its encoded.  It was already used by the ancient Greeks.

In a Rail Fence cipher, the message is written downwards on successive "rails" of an imaginary fence, then moving up when we get to the bottom (like a zigzag).  Finally the message is then read off in rows.

For example, using three "rails" and the message "WE ARE DISCOVERED FLEE AT ONCE" the cipherer writes out:
```ruby
W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . A . . . I . . . V . . . D . . . E . . . N . .
```
Then reads off:
```ruby
WECRLTEERDSOEEFEAOCAIVDEN
```
To decrypt a message, you take the zigzag shape and fill the cipher text along the rows:

```ruby
? . . . ? . . . ? . . . ? . . . ? . . . ? . . . ?
. ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
```
The first row has seven spots that can be filled with 'WECRLTE'
```ruby
W . . . E . . . C . . . R . . . L . . . T . . . E
. ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
```
Now the second row takes 'ERDSOEEFEAOC'.
```ruby
W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
```
Leaving 'AIVDEN' for the last row:
```ruby
W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . A . . . I . . . V . . . D . . . E . . . N . .
```
If you now read along the zig-zag shape you can read the original message.