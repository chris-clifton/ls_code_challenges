# SIMPLE CIPHER
Implement a simple shift cipher like Caesar and a more secure substitution cipher.

**Step 1:**


- must substitute the D for A (shift of 4)
```ruby
@cipher = Cipher.new
@cipher.encode("iamapandabear") #=> "ldpdsdqgdehdu"
@cipher.decode("ldpdsdqgdehdu") #=> "iamapandabear"
```

**Step 2:**

- try amending code to allow us to specify a key and use that for the shift distance.  This is called a substitution cipher
```ruby
@cipher = Cipher.new("aaaaaaaaaaaaaaaaaa")
@cipher.encode("iamapandabear") #=> "iamapandabear"
@cipher = Cipher.new("ddddddddddddddddd")
@cipher.encode("imapandabear") #=> "lpdsdqgdehdu"
```

**Step 3:**

- weakest link ni a cipher is the human- make substitution cipher a little more fault tolerant by providing a source of randomness and ensuring the key is not composed of numbers or capital letters
- if someone doesnt submit a key at all, generate a truly random key of atleast 100 characters in length, accessible via Cipher#key instance variable
- if key has capital letters, thrown an ArgumentError with a message to that effect