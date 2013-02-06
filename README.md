# Language Classifier

A simple language classifier based on the [N-Gram-Based Text Categorization](http://goo.gl/8npGv) algorithm by William B. Cavnar and John M. Trenkle.

## How to use:

```
$ ./classifier /path/to/your/file.txt
```
e.g.
```
$ ./classifier "/Users/steven/Desktop/hamlet's soliloquy.txt"
File is likely to be english
```

## Notes

- The implementation of the algorithm is rudimentary and is neither optimised nor robust. It does however attempt to provide a working solution to the problem outlined.
- The collections of n-grams for various languages (language maps) were taken from [TextCat](http://odur.let.rug.nl/~vannoord/TextCat/) — a perl implementation of the same algorithm
- Developed and tested on MRI Ruby 1.9.3p194
- Run `$ bundle install` to install rspec in order to run the tests.
