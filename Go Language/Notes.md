# Go Language

****************************Introduction :****************************

- Go language is a procedural programming language. Initially developed at google in 2007 by Robert Griesemer, Rob Pike, and Ken Thompson.
- It is statistically typed language having syntax similar to that of C.
- Programs are assembled by using packages and it also supports environment adopting patterns like dynamic languages.
- Go provides garbage collection, type safety, dynamic-typing capability, many advanced built-in types such as variable length arrays, and key value maps.
- the Go programming language was launched in november 2009 as an open source programming language.

********************************Few Advantages :********************************

1. Compiled language
    - It doesn’t need a virtual machine. Compiled languages are known for their speed as it compiles directly into machine code.
    - In addition to that go compiler provides the benefits like error checking, easier deployment, code optimization etc.
2. Reliability
    - Using go we can create very reliable software as the inherit language design prevent us from doing awful stuff. For ex: Go has a pointer but here they are not dangerous as in C because the memory being managed by Go and normally pointer arithmetic is not advised by default.
3. Garbage Collection
    - In Go, garbage collector or automatic memory management is a key feature which is used to clean up the memory concurrently with the execution of the program by using a tricolor mark-and-sweep algorithm
4. Cross-compiling
    - Go has another unique feature which is the ability to cross-compile the application to run on a different machine.
    - Go compiler allows to generate binary code for different os with simple commands.

************************Installation************************

[All releases - The Go Programming Language](https://go.dev/dl/)

verify go installation and configuration - $ go version

$ go env to verify go configuration. GOPATH should point to the workspace.

To check whether the installation is successful or not. We can write a simple hello world program and execute it.

****************************************************where to write the code ?**************************************************** The files contain program source code are called GO program source files and are typically named with the extension “go”. 

EX : test.go

```go
package main /* package declaration */
import "fmt" /*Import package*/
func main() {/* Function */
/* This is my first sample program */
	fmt.Println("Hello, World!") /* Print statement */
}
```

************************************Running Go file :************************************ go run test.go

**********************************output : Hello, world**********************************

**********************************Program Structure**********************************

Basic parts of Go programming language.

- Package declaration
- import packages
- Functions
- Variables
- statements and expressions
- comments

******************************************package declaration :******************************************

- The First line of the program defines the main package which is the ****************************************mandatory statement**************************************** as go programs run in packages.

********************************Import Packages********************************

- The very next line of the program is import “fmt” which is a preprocessor command that orders the go compiler to add the files within the package “fmt”

******************Functions******************

- The ************func main()************ in the next line is the main function where the program execution starts. The *******************************************************************************************fmt.println(..) in the next line is the print function available in go to display the contents of the screen.*******************************************************************************************
- the ********println******** function is exported by the ****fmt**** package. the capital P in Println shows this is exported.
- In Go, the name is exported, if it begins with the capital letter. Exported means the variable/constant/function is accessible to the importer of the corresponding package.

****************Comments****************

- single line comments (//) and multi line comments (/* …*/)

**Digging Deeper into the basics**

****************Tokens :****************

A program consists of different tokens. A token can be either an identifier, a keyword, a constant, a string literal, or  a symbol. The following go statement consists of six tokens.

**fmt.println(”Hello, world”)**

fmt —> token1

. /*symbol*/ —> token2

println —> token3

( —>token 4

“Hello, world” —> token 5

) —> token 6

****************************Line separator****************************

- The line separator key is a ****************************************statement terminato****************************************