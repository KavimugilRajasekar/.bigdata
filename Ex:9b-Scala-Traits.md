
## 3. Design Explanation
- **Method Overriding**: By overriding `performAction`, each subclass provides a specific implementation while maintaining a common interface. This allows for **Polymorphism**, where a list of `ElectronicDevice` can contain different types of devices.
- **Trait Mixing**: Traits allow for "Multiple Inheritance" of behavior. Unlike classes, a Scala class can mix in multiple traits, enabling a flexible design where capabilities (like Power Management) can be added to any class without restricting the inheritance hierarchy.

------------------------------------------------------------------------

# Result
The OOP design was successfully implemented in Scala. The use of abstract classes ensured a consistent interface, while traits provided a modular way to share behavior across different subclasses, demonstrating the flexibility of Scala's object model.
