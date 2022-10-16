<style type="text/css">
.reveal pre {
  font-size: 1em;
  width: 100%;
}

.reveal section img {
  border: none;
}
</style>

### Mis-code-ception

{:.fragment}
#### Let's have magic moments 🪄🎩

---

## The goal is to

{:.fragment}
# have fun

{:.fragment}
### with unusual code

---

## Agenda

{:.fragmented-list}
* How to check if a number is prime using regex?
* Does Ruby understand SQL?
* Code hidden in a number
* Writing code using only symbols
* ...

***

### How to check if a number is prime using regex?

---

## What is a prime number?

{:.fragment}
It is an integer number > 1 that is divisible only by itself and 1.

{:.fragment}
6 is not prime because divides by 1, 2, 3 and 6.

{:.fragment}
7 is prime because it divides only by 1 and 7.

---

## Regex check, like this?

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

## What about 11, 13 and others?

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

<img src='images/prime-chart.png'>

***

***

### Does Ruby understand SQL?

---

# ?

```sql
SELECT `jobs`.* FROM `jobs`
```

***

***

### Code hidden in a number

---

# ?

***
