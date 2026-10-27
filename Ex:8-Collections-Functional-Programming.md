# Exercise 8 --- Collections and Functional Programming

## Aim
Explore Scala's powerful collection library and implement functional programming concepts using immutability and higher-order functions such as `map`, `filter`, and `fold`.

## Environment
``` text
Language : Scala 2.12+
Paradigm : Functional Programming
Directory: ~/Desktop/lab/Scala_Functional
```

------------------------------------------------------------------------

## 1. Scala Collections (8a)
Scala provides a rich set of immutable collections that are central to its functional nature.

### 1.1 Implementation
- **List**: An ordered sequence of elements.
  - `val fruits = List("Apple", "Banana", "Orange", "Apple", "Mango")`
- **Set**: A collection of unique elements.
  - `val uniqueFruits = fruits.toSet` $\rightarrow$ removes duplicate "Apple".
- **Map**: A collection of key-value pairs.
  - `val productPrices = Map("Apple" -> 10, "Banana" -> 5, "Orange" -> 8, "Mango" -> 15)`

------------------------------------------------------------------------

## 2. Functional Programming (8b)
Functional programming emphasizes the use of pure functions and immutability to make code more predictable and thread-safe.

### 2.1 Higher-Order Functions
We used the following functions to process the data:

| Function | Operation | Example Result |
| :--- | :--- | :--- |
| **map** | Transforms every element in a collection. | `"Apple"` $\rightarrow$ `"APPLE"` |
| **filter** | Selects elements based on a predicate. | Fruits with length $> 5$ $\rightarrow$ `(Banana, Orange)` |
| **foldLeft** | Reduces a collection to a single value. | Sum of all prices $\rightarrow$ `38` |

### 2.2 Pure Functions
A **Pure Function** is a function where the output depends only on the input and has no side effects.
``` scala
def calculateTax(price: Double): Double = price * 0.18
```

------------------------------------------------------------------------

## 3. Results and Observations (8c)

### Execution Results
- **Original List**: `List(Apple, Banana, Orange, Apple, Mango)`
- **Unique Set**: `Set(Apple, Banana, Orange, Mango)`
- **Map Result**: `Total Cost: 38`

### Design Explanation
- **Immutability**: By using immutable `List` and `Map`, we ensure that data cannot be changed after creation. This eliminates bugs related to shared state in concurrent programs.
- **Predictability**: Pure functions like `calculateTax` always return the same result for the same input, making the code easier to test and debug.
- **Conciseness**: Higher-order functions (`map`, `filter`) replace verbose `for` loops, making the code more declarative and easier to read.

------------------------------------------------------------------------

# Result
Scala collections and functional programming concepts were successfully implemented. The use of immutability and higher-order functions demonstrated a more concise and predictable way of processing data compared to traditional imperative programming.
