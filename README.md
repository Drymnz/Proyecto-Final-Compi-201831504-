# Proyec-to-Final-Compi-201831504 
An IDE with the CRL programming language (compi report language)
----

**Manual of use**
* ### Used tools 
* ### Angular
    * ### Development server
* ## Grammar CRL
    * ### Import and Uncertainty
    * ### Comments
---
**Manual of technicians**
* ## Angular
    * ### Build
    * ### Running unit tests
    * ### Running end-to-end tests
    * ### Further help
* ## Grammar CRL
    * ### lexical
    * ### syntax
        * ### Header

---
# Manual use
## Used tools
* This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 13.3.3.
* Jison [Jison](https://gerhobbelt.github.io/jison/)
## **Angular**
### **Development server**
Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.
# Grammar CRL
## Import and uncertainty
It will be in charge of importing the content of said crl file attached to the content of the file that is being used
- example:
```
import aritmeticas.clr
```
This uncertainty value will be used to compare numerical values, if it is not defined it will default to **0.5**
- example:
```
incerteza 0.015
```
## Comments
There are two one-line and two-line comments
- example one-line **NOTE: will end in a line break**:
```
!! this is a one line comment
```
- example two-line:
```
'''
this 
is 
a 
multiline 
comment
'''
```
-----------------------------------------------
# Manual technicians
## **Angular**
### **Build**
Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.
### **Running unit tests**
Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).
### **Running end-to-end tests**
Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.
### **Further help**
To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.
# Grammar CRL
## Lexical
#### Reserved words
variables, methods and functions
----
| **Name**  |  **Reserved words** |
| ------------ | ------------ |
|to import|import|
|constant|ancerteza|
|number decimal|Double|
|number whole|Int|
|boolean|Boolean|
|text|String|
|character|Char|
|only for methods|void|

Relational expressions
| **Name**  |  **Reserved words** |
| ------------ | ------------ |
|equal|==|
|different|!=|
|smaller than|<|
|greater than|>|
|less than or equal|<=|
|greater than or equal|>=|
|uncertainty|~|

----
## Syntax
Any syntactic part will be mentioned as done by jison

### Header

They will be the imports and constant the initial of a file with the extension **crl**
~~~
header -> 
~~~
