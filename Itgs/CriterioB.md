# Criterio B

## Solución propuesta
Mi cliente Karla y yo, consideramos que la creación de una base de datos sería una solución apropiada para los problemas con los que cuenta EduCAS, ya que permitirá consolidar la información del curso de una manera organizada y accesible.

## Especificación de requisitos

### Requisitos del sistema TI 
* Hardware: PC o Mac (véase los detalles en requerimientos de software), con un procesador de mínimo 1GHz y 64 o 32 bits. Asimismo, se necesitará como mínimo un gigabyte de memoria RAM en los sistemas de 32 bits, y 2 gigabytes en los de 64 y tres gigabytes de espacio libre en disco (especificaciones oficiales de Office 2013). 
* Software: Windows, por lo menos en su versión 7. Para las computadoras Mac, se les puede proveer con una solución virtualizada como el Laboratorio Virtual que ofrecido por el ITESM. El usuario debe contar con MS Access (por lo menos 2007) y una versión reciente de .NET (por lo menos 3.5).  

### Interacción del sistema
* El sistema puede ser auto-contenido en Windows, y la interacción se dará completamente dentro de la aplicación a través de las formas de MS Access.

### Requisitos de entrada y salida 
* Entrada: Nombres e información sobre los alumnos (contactos de emergencia, nombre de tutores, etc.), asistencia, nombre de maestros, materias, y días de disponibilidad. 
* Salida: Información sobre la asistencia, los alumnos, los cursos y los profesores organizada de distintas maneras. 

### Procesamiento
* Para las funciones descritas en el punto anterior, será necesario la elaboración de tablas relacionales pertinentes, y  como formas para la sencilla edición e interacción con la base de datos. Por esto mismo será necesario diseñar Queries que permitan recolectar la información de manera dinámica e interactiva por medio de parámetros definidos por el ususario. 

### Seguridad
* Copias locales de la información tomadas de manera semanal
* Protección de la base de datos mediante una contraseña

## Criterios de rendimiento específicos
* La base de datos debe contar con lo siguiente
    * Búsquedas que permitan el rápido acceso a la información deseada por el usuario
    * Formas efectivas, cuyo diseño permita el ingreso sencillo de datos.
    * Uso de menús y pestañas para organizar y navegar en la base de datos
    * Uso de botones para simplificar acciones 
    * Organización efectiva en las tablas relacionales
    * Toma de asistencia por curso y por fecha (como parámetros) 
    * Interfáz sencilla de usar y navegar
    * Validación de datos para evitar errores al ingresar datos
    * Medidas para mantener la integridad de la base de datos

## Justificación de la solución propuesta 
Una base de datos, correctamente implementada, me parece  una solución pertinente para los conflictos que acarrea el crecimiento reciente del proyecto Educas, que como identificaron mis clientes, se reducen a cuestiones de logística interna. Como Access ofree herramientas más sólidas que de las hojas de cálculo de Excel para el almacenamiento a largo plazo de la información y para un gran número de registros; además, integra funcionalidades que resultan más pertinentes para el control de la base de datos, como las formas, los queries, o los reportes. 
La posibilidad, que fue considerada junto con el equipo de EduCAS, de reutilizar las tablas de Excel fue rechazada debido a su inefectividad en mantener los datos de forma adecuada, y ausencia de sofisticación en cuanto a la abstracción que permite en las relaciones entre los datos. Consideramos que una implementación similar en Excel tendría menos integridad, y debido a la redundancia de datos a la que podría llevar, un producto confuso y menos apropiado. Por otro lado, una base de datos como las utilizadas en Access permiten organizar la información mediante tablas relacionales, que reducen la redundancia de datos y facilitan el mantenimiento de la integridad de la información. Asímismo, el sistema de formas que ofrece puede servir como un medio para desarollar una interfaz de usuario, lo cual incrementaría considerablemente la facilidad de uso con respecto a ingresar los datos en una cuadrícula. 

Después, consideramos los requerimientos de Access y nos percatamos que el equipo con el que cuentan mis compañeros, así como las computadoras de trabajo que ofrece el campus, tienen las características adecuadas para correr Access, ya que estos no son muy estrictos pues solo se necesita una computadora con Windows 7 o superior, la suite 2010 de Office o superior, y entre uno y dos megabytes de RAM dependiendo del sistema.  
(301 palabras)

