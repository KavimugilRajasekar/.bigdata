object OOPDesign {
  def main(args: Array[String]): Unit = {
    println("--- Exercise 9: Scala OOP Design ---")
    
    // Instantiate subclasses and demonstrate polymorphism
    val laptop = new Laptop("Dell XPS", 1200.0)
    val smartphone = new Smartphone("iPhone 15", 800.0)
    
    val devices: List[ElectronicDevice] = List(laptop, smartphone)
    
    devices.foreach { device =>
      println(s"Device: ${device.getName}, Price: ${device.getPrice}")
      println(s"Action: ${device.performAction()}")
      println("-" * 20)
    }
  }
}

// 9(a) Abstract Class
abstract class ElectronicDevice {
  val name: String
  val price: Double
  
  def getName: String = name
  def getPrice: Double = price
  
  // Abstract method: must be implemented by subclasses
  def performAction(): String
}

// Subclass 1
class Laptop(name: String, price: Double) extends ElectronicDevice {
  override def performAction(): String = "Booting up OS and launching IDE..."
}

// Subclass 2
class Smartphone(name: String, price: Double) extends ElectronicDevice {
  override def performAction(): String = "Connecting to 5G and checking notifications..."
}

// 9(a) Trait for shared behavior
trait PowerManagement {
  def batteryStatus(): String = "Battery is at 85% - Charging"
  def __powerOff(): String = "Shutting down safely..."
}

// Mix-in the trait into subclasses
class SmartLaptop(name: String, price: Double) extends ElectronicDevice with PowerManagement {
  override def performAction(): String = "Executing high-performance computing task..."
}

// Demonstrating trait mixing and overriding
val smartDevice = new SmartLaptop("MacBook M3", 2000.0)
// println(s"Status: ${smartDevice.batteryStatus()}")
