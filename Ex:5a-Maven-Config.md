# Exercise 5 --- Build Automation Using Maven

## Aim
Create a Java project and configure its `pom.xml` to automate the compilation, testing, and packaging process using Apache Maven.

## Environment
``` text
Language : Java 8 (OpenJDK)
Build Tool: Apache Maven 3.9.12
Testing  : JUnit 5
Directory : ~/Desktop/lab/Maven_Project
```

------------------------------------------------------------------------

## 1. Project Configuration (5a)
The project is structured following the Maven Standard Directory Layout. The `pom.xml` (Project Object Model) file defines the project identity, dependencies, and build plugins.

**Key Configuration in `pom.xml`:**
- **GroupId**: `com.retail`
- **ArtifactId**: `retail-automation`
- **Dependencies**: Added `junit-jupiter-api` and `junit-jupiter-engine` for automated unit testing.

------------------------------------------------------------------------

## 2. Maven Plugins and Automation (5b)
To automate the lifecycle, the following plugins were configured:

| Plugin | Role |
| :--- | :--- |
| `maven-compiler-plugin` | Automates the compilation of Java source code to bytecode. |
| `maven-surefire-plugin` | Automatically discovers and executes unit tests during the `test` phase. |
| `maven-jar-plugin` | Packages the compiled classes into a deployable `.jar` artifact. |

------------------------------------------------------------------------

## 3. Build Execution (5c)

### Execution Commands
To clean the project, compile code, run tests, and package the application:

``` bash
cd ~/Desktop/lab/Maven_Project
mvn clean compile test package
```

### Results & Verification
- **Clean**: Removed the `target` directory.
- **Compile**: Successfully compiled `SalesCalculator.java`.
- **Test**: Executed `SalesCalculatorTest.java`. All tests passed.
