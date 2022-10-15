<style type="text/css">
.reveal pre { font-size: 1.2em; }
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

***

## Agenda

{:.fragmented-list}
* How to check if a number is prime with regex?
* Does Ruby understand SQL?
* Code hidden in a number
* Writing code using only symbols
* ...

***

### How to check if a number is prime with regex?

---

```ruby
def prime?(n)
  n.to_s =~ /^2|3|5|7$/
end
```

---

# ?

---

```ruby
def prime?(n)
  '1'*n !~ /^1?$|^(11+?)\1+$/
end
```

***