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
