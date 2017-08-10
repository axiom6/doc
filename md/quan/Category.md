
# Functor

### map

# Applicative

### pure - wrap

### ap - <*> maps functions

# Monad

### flatMap

# Semigroup  - appending

# Monoid - has a zero / blank value

# Arrow - behaves like a function


`trait Arrow[=>:[_, _]] extends Category[=>:] { self =>`

`  def id[A]: A =>: A`

`  def arr[A, B](f: A => B): A =>: B`

`  def first[A, B, C](f: (A =>: B)): ((A, C) =>: (B, C)) }`


### Function1[A, B], 
### PartialFunction[A, B], 
### Kleisli[F[_], A, B],
### CoKleisli[F[_], A, B]



