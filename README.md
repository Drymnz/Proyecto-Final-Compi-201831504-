# Proyec-a-Final-Compi-201831504

Un IDE con el lenguaje de programación CRL (lenguaje de informe compi)
----

**Manual de uso**
* ### Herramientas usadas
* ### Angular
    * ### Servidor de desarrollo
* ## Gramática CRL
    * ### Importancia e Incertidumbre
    * ### Comentarios
---
**Manual de técnicos**
* ## Angular
    * ### Construir
    * ### Ejecutando pruebas unitarias
    * ### Ejecución de pruebas de extremo a extremo
    * ### Más ayuda
* ## Gramática CRL
    * ### léxico
    * ### sintaxis
        * ### Encabezado

---
# Uso manual
## Herramientas usadas
* Este proyecto se generó con [Angular CLI](https://github.com/angular/angular-cli) versión 13.3.3.
* Jison [Jison](https://gerhobbelt.github.io/jison/)
## **Angular**
### **Servidor de desarrollo**
Ejecute `ng serve` para un servidor de desarrollo. Navegue a `http://localhost:4200/`. La aplicación se recargará automáticamente si cambia alguno de los archivos de origen.
# Gramática CRL
## Importancia e incertidumbre
Se encargará de importar el contenido de dicho archivo crl adjunto al contenido del archivo que se está utilizando
- ejemplo:
```
importar aritmeticas.clr
```
Este valor de incertidumbre se usará para comparar valores numéricos, si no está definido, por defecto será **0.5**
- ejemplo:
```
incertidumbre 0.015
```
## Comentarios
Hay dos comentarios de una y dos líneas.
- ejemplo de una línea **NOTA: terminará en un salto de línea**:
```
!! este es un comentario de una linea
```
- ejemplo de dos líneas:
```
'''
este
es
un
multilínea
comentario
'''
```
-----------------------------------------------
# Técnicos manuales
## **Angular**
### **Construir**
Ejecute `ng build` para compilar el proyecto. Los artefactos de compilación se almacenarán en el directorio `dist/`.
### **Ejecutando pruebas unitarias**
Ejecute `ng test` para ejecutar las pruebas unitarias a través de [Karma](https://karma-runner.github.io).
### **Ejecución de pruebas de extremo a extremo**
Ejecute `ng e2e` para ejecutar las pruebas de extremo a extremo a través de una plataforma de su elección. Para usar este comando, primero debe agregar un paquete que implemente capacidades de prueba de un extremo a otro.
### **Más ayuda**
Para obtener más ayuda sobre Angular CLI, use `ng help` o consulte la página [Descripción general y referencia de comandos de Angular CLI] (https://angular.io/cli).
# Gramática CRL
## Léxico
#### Palabras reservadas
variables, métodos y funciones
----
| **Nombre** | **Palabras reservadas** |
| ------------ | ------------ |
|importar|importar|
|constante|ancerza|
|número decimal|doble|
|número entero|Int|
|booleano|Booleano|
|texto|Cadena|
|personaje|Carácter|
|solo para métodos|void|

Expresiones relacionales
| **Nombre** | **Palabras reservadas** |
| ------------ | ------------ |
|igual|==|
|diferente|!=|
|menor que|<|
|mayor que|>|
|menor que o igual|<=|
|mayor que o igual|>=|
|incertidumbre|~|

----
## Sintaxis
Cualquier parte sintáctica se mencionará como hecha por jison.

### Encabezado

Serán las imports y constantes las iniciales de un archivo con extensión **crl**
~~~
encabezado ->
~~~