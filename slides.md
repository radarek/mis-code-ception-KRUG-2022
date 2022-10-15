<style type="text/css">
.reveal pre {
  font-size: 1em;
  width: 100%;
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

## Like this?

```ruby
def prime?(n)
  n.to_s.match? /^(2|3|5|7)$/
end
```

---

### What about 11, 13 and others?

```ruby
(0..100).select { prime?(_1) }
#=> [2, 3, 5, 7]
```

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

### How does it work?

***

***

### Does Ruby understand SQL?

---

# ?

***

