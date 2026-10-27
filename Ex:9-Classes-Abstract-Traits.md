# Exercise 9 --- Classes, Abstract Methods, and Traits

## Aim
Implement Object-Oriented Programming (OOP) concepts in Scala by creating an abstract class with abstract methods, providing concrete implementations in subclasses, and using traits to share behavior across different classes.

## Environment
``` text
Language : Scala 2.12+
Paradigm : Object-Oriented Programming (OOP)
Directory: ~/Desktop/lab/Scala_OOP
```

------------------------------------------------------------------------

## 1. Implementation Design (9a)

### 1.1 Abstract Class
An `ElectronicDevice` abstract class was created to define a common blueprint for all electronic devices. It contains:
- **Fields**: `name` and `price`.
- **Abstract Method**: `performAction()`, which forces every subclass to define its own specific behavior.

### 1.2 Concrete Subclasses
Two subclasses, `Laptop` and `Smartphone`, provide specific implementations of the `performAction()` method:
- **Laptop**: Returns "Booting up OS..."
- **Smartphone**: Returns "Connecting to 5G..."

### 1.3 Traits (Shared Behavior)
A trait `PowerManagement` was defined to provide shared functionality that is not part of the core identity of a device but is a shared capability.
- **Trait Method**: `batteryStatus()` and `__powerOff()`.
- **Trait Mixing**: The `SmartLaptop` class inherits from `ElectronicDevice` AND mixes in `PowerManagement`.

------------------------------------------------------------------------

## 2. Execution and Demonstration (9b)

### Implementation Code snippet:
``` scala
// Abstract Class
abstract class ElectronicDevice {
  def performAction(): String
}

// Trait
trait PowerManagement {
  def batteryStatus(): String = "Battery is at 85%"
}

// Mix-in
class SmartLaptop extends ElectronicDevice with PowerManagement {
  override def performAction(): String = "Executing high-performance computing..."
}
```

### Output Results
When instantiating the classes:
- **Laptop**: `Device: Dell XPS, Price: 1200.0 | Action: Booting up OS...`
- **Smartphone**: `Device: iPhone 15, Price: 800.0 | Action: Connecting to 5G...`
- **SmartLaptop**: Inherits both the `performAction` method and the `batteryStatus` from the trait.

------------------------------------------------------------------------

## 3. Design Explanation
- **Method Overriding**: By overriding `performAction`, each subclass provides a specific implementation while maintaining a common interface. This allows for **Polymorphism**, where a list of `ElectronicDevice` can contain different types of devices.
- **Trait Mixing**: Traits allow for "Multiple Inheritance" of behavior. Unlike classes, a Scala class can mix in multiple traits, enabling a flexible design where capabilities (like Power Management) can be added to any class without restricting the inheritance hierarchy.

------------------------------------------------------------------------

# Result
The OOP design was successfully implemented in Scala. The use of abstract classes ensured a consistent interface, while traits provided a modular way to share behavior across different subclasses, demonstrating the flexibility of Scala's object model.
