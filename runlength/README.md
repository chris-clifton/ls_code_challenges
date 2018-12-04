# Run-Length Encoding

Implement run-length encoding and decoding.

Run-length encoding (RLE) is a simple form of data compression where runs (consecutive data elements) are replaced by just one data value and count.

For example, we can represent the original 53 characters with only 13.

```ruby
"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"
```

RLE allows original data to be perfectly reconstructed from compressed data, which makes it a lossless data compression.

```ruby
"AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"
```

