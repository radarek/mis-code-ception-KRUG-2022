<style type="text/css">
.reveal pre {
  font-size: 1em;
  width: 100%;
}

pre.smaller {
  font-size: 0.75em !important;
}

pre.smallest {
  font-size: 0.58em !important;
}

.reveal section img {
  border: none;
}

.monospace {
  font-family: monospace !important;
}
</style>

### Mis-code-ception

<img width="20%" src="images/question.jpg">
Radosław Bułat, github.com/radarek
KRUG, 17.10.2022

---

## The goal is to

{:.fragment}
# have fun

{:.fragment}
### with unusual code.

---

## Agenda

{:.fragmented-list}
* How to check if a number is prime using regex?
* Does Ruby understand SQL?
* Writing code using only symbol characters.
* Deceptive code

***

### How to check if a number is prime using regex?

---

## What is a prime number?

{:.fragment}
It is an integer number > 1 that is divisible only by itself and 1.

{:.fragment}
6 is not prime because it is divisible by 1, 2, 3 and 6.

{:.fragment}
7 is prime because it is divisible only by 1 and 7.

---

## Regex? Like this?

```ruby
def prime?(n)
  n.to_s.match? /^(2|3|5|7)$/
end
```

---

```ruby
(0..100).select { prime?(_1) }
#=> [2, 3, 5, 7]
```

---

## What about 11, 13 and others?

---

### There is something more clever.

---

# Ready?

---

```ruby
def prime?(n)
  '1'*n !~ /^1?$|^(11+?)\1+$/
end
```

---

```ruby
(0..100).select { prime?(_1) }
#=> [2, 3, 5, 7, 11, (...), 89, 97]
```

---

## How does it work?

---

```ruby
'1'*n !~ /^1?$|^(11+?)\1+$/
```

{:.fragment}
<img width="50%" src='images/9-1.png'>

{:.fragment}
<img width="50%" src='images/9-2.png'>

---

## What about performance?

---

```ruby
'1111111' =~ /^(11+?)\1+$/
```

---

<img src='images/prime-chart.png'>

***

***

### Does Ruby understand SQL?

---

```sql
SELECT `tags`.* FROM `tags`
```

---

```bash
$ ruby -e 'SELECT `tags`.* FROM `tags`'
-e:1:in ``': No such file or directory
 - tags (Errno::ENOENT)
	from -e:1:in `<main>'
```

---

```ruby
SELECT(`tags`.*(FROM(`tags`)))
```

***

***

## Writing code using only symbol characters.

---

Is it possible to write **any** Ruby code using only these characters?

<h3 class="monospace">!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~</h3>

---

### Let's start with something simple.

---

### How to construct any string without using letters?

---

<p class="monospace">
"Hello"
</p>
<p class="monospace">
=>
</p>
<p class="monospace">
"?????"
</p>

---

<h3 class="monospace">String#<<</h3>

---

<img src='images/string-append.png'>

###### https://ruby-doc.org/core-3.1.2/String.html#method-i-3C-3C

---

```ruby
''<<72<<101<<108<<108<<111
#=> "Hello"
```

---


### How to create any integer using only symbol characters?

---

<p class="monospace">
1
</p>
<p class="monospace">
=>
</p>
<p class="monospace">
?
</p>

---

{:.fragment}
```ruby
$$/$$
```

{:.fragment}
```ruby
'$'=~/$/
```

{:.fragment}
```ruby
-~($$[-$$])
'>'<=>'<'
$$[-$$]**$$[-$$]
```

---

```ruby
_=$$/$$ #=> 1
__=_+_  #=> 2
```

---

H - 72
```ruby
_+_...+_ # repeat 72 times
# or
(__*(__*(__*(__*(__*(__*_))+_))))
```

---

### How to execute code from a string?

---

### eval(string)

---

{:.smaller}
```ruby
eval("
_=$$/$$;__=_+_;
''<<(__*(__*(__*(__*(__*(__*(_-_)+_)+_))+_)))"
)
```

---

### What about symbolizing eval?

---

# Ready?

---

```ruby
->(&_){
  _['','eval','<code>']
}[&:"#{'send'}"]
```

source: https://youtu.be/6K7EmeptEHo?t=574

---

### Let's write a compiler.

---

{:.smallest}
```ruby
def decompose(n)
  n == 0 ? '(_-_)' : '('+'__*'+decompose(n/2)+'+_'*(n%2)+')'
end

def s(str)
  ["''", *str.chars.map { decompose(_1.ord) }].join('<<')
end

def compile(code)
  "_=$$/$$;__=_+_;->(&___){___[''," +
  "#{s('eval')},#{s(code)}]}[&:\"\#{#{s('send')}}\"]"
end

puts compile(ARGF.read)
```

---

<img src='images/deeper.jpg'>

---

### What if...

{:.smaller .fragment}
```bash
$ ruby compiler.rb compiler.rb > compiler2.rb
```

{:.fragment}
<img width="30%" src="images/meme.png">

***

***

## Deceptive code

---

```bash
$ ls
innocent_code.rb
```

---

```bash
$ ruby innocent_code.rb 
This code is evil
```

## Oh no 😱!

---

```bash
$ cat innocent_code.rb
puts "This code is innocent"
```

{:.fragment}
### How?

---

```ruby
File.write(__FILE__, <<CODE)
puts "This code is innocent"
CODE
puts "This code is evil"
```

---

```bash
$ ls
innocent_code2.rb
```

---

```bash
$ cat innocent_code2.rb
puts "This code is good <3"
```

---

```bash
$ more innocent_code2.rb
puts "This code is good <3"
```

---

```bash
$ ruby innocent_code2.rb
This code is evil
$ cat innocent_code2.rb
puts "This code is good <3"
```

{:.fragment}
### How?

---

{:.smaller}
```ruby
puts "This code is evil"||"^H^H^H^H^H^H^H^Hinnocent"
```

***
