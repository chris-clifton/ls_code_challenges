# Crypto Square

Implement the classic method for composing secret messages called a square code.

The input is first normalized: The spaces and punctuation are removed from the English text and the message is down-cased.

Then, the normalized characters are broken into rows. These rows can be regarded as forming a rectangle when printed with intervening newlines.

For example, the sentence
> If man was meant to stay on the ground God would have given us roots.

is 54 characters long.  Broken into 8-character columns, it yields 7 rows.

Those 7 rows produce this rectangle when printed one per line:

```ruby
ifmanwas
meanttos
tayonthe
groundgo
dwouldha
vegivenu
sroots
```

The coded message is obtained by reading down the columns going left to right.  The message above is coded as:

```ruby
imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau
```

**Write a program that, given an English text, outputs the encoded version of that text.**

Size of the square (number of columns) should be decided by the length of the message.  If message is a length that creates a perfect square, use that number of columns.  If it doesn't neatly fit in a square, choose the number of columns that corresponds to smallest square that is larger than the number of characters in message.

Ex: 4 character message = 2 x 2 square, 81 characters = 9 x 9 square 
but any message between 5 and 8 characters use a rectangle 3 columns wide.