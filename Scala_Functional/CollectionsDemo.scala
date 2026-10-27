object CollectionsDemo {
  def main(args: Array[String]): Unit = {
    // 8(a) Create and manipulate Scala collections
    println("--- 8(a) Scala Collections ---")
    
    // List: Ordered sequence of elements (Immutable)
    val fruits = List("Apple", "Banana", "Orange", "Apple", "Mango")
    println(s"Original List: $fruits")
    
    // Set: Unique elements
    val uniqueFruits = fruits.toSet
    println(s"Unique Fruits (Set): $uniqueFruits")
    
    // Map: Key-Value pairs
    val productPrices = Map("Apple" -> 10, "Banana" -> 5, "Orange" -> 8, "Mango" -> 15)
    println(s"Product Prices (Map): $productPrices")

    // 8(b) Functional Programming Operations
    println("\n--- 8(b) Functional Programming ---")
    
    // 1. map: Transform each element
    val upperFruits = fruits.map(f => f.toUpperCase)
    println(s"Upper Case Fruits (map): $upperFruits")
    
    // 2. filter: Keep elements matching a condition
    val longFruits = fruits.filter(f => f.length > 5)
    println(s"Fruits with length > 5 (filter): $longFruits")
    
    // 3. foldLeft: Aggregate elements into a single value
    // Sum of prices for Apple and Banana
    val totalCost = productPrices.foldLeft(0) { (sum, pair) =>
      sum + pair._2
    }
    println(s"Total Cost of all fruits (foldLeft): $totalCost")
    
    // 4. pure function for tax calculation
    def calculateTax(price: Double): Double = price * 0.18
    println(s"Tax on Mango (15): ${calculateTax(15.0)}")
  }
}
