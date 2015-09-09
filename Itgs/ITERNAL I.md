# ITERNAL ITGS
## Criterio A
El cliente son mis compañeros, quienes forman uno de los proyectos CAS de mi preparatoria llamado EDUCAS. Es un proyecto dirigido a las comunidades encontradas alrededor del campus del Tec y cuyo propósito es impartirles clases de distintos tipos para compartirles sus conocimientos en diversas áreas y materias, tales como matemáticas, inglés e  informática. Mis compañeros se organizan para obtener dentro del campus las facilidades físicas (como salones o pizarrones), así como con escuelas o padres de familia ubicados en el perímetro que se interesen por asistir o que sus hijos asistan a las clases que mis compañeros ofrecen. El proyecto ha tenido un gran éxito y ha crecido considerablemente durante el último par de semestres que lo han administrado. Por esta razón, el proyecto llamó mi atención y decidí contactar con ellos para determinar si una solución TI sería apropiada para manejar este mismo crecimiento que han experimentado recientemente. 

En primer lugar, me llamó la atención la manera en que llevan a cabo los diversos registros con los que interactúan para las inscripciones y las asistencias. “Cada profesor está a cargo de tomar las asistencias para sus propias clases y por eso es un poco desordenado” además, dado que los profesores son distintos cada día, es aún más difícil de mantener un control riguroso de las asistencias. En segundo lugar, queda la cuestión de las inscripciones, hasta ahora “ponen todos los datos en una tabla de excel” y por lo tanto, el proceso tampoco se encuentra estandarizado todavía. 

 (259 palabras)

## Criterio B

### Solución propuesta
Los representantes de Educas y yo, consideramos la creación de una base de datos como una solución apropiada para los problemas con los que cuentan. Además, esta será sincronizada por la nube para que todos los miembros tengan acceso a la misma. 

### Especificación de requisitos

#### Requisitos del sistema TI 
* Hardware: PC o Mac (véase los detalles en requerimientos de software), con un procesador de mínimo 1GHz y 64 o 32 bits. Asimismo, se necesitará como mínimo un gigabyte de memoria RAM en los sistemas de 32 bits, y 2 gigabytes en los de 64 y tres gigabytes de espacio libre en disco (especificaciones oficiales de Office 2013). Finalmente, el acceso a internet es de vital importancia para el proyecto. 
* Software: Windows, por lo menos en su versión 7, para las computadoras Mac, se les puede proveer con una solución virtualizada. El usuario debe contar con MS Access (por lo menos 2007), una versión reciente de .NET (por lo menos 3.5) y algúna aplicación de sincronización por la nube, como OneDrive.  

#### Interacción del sistema
* El sistema puede ser auto-contenido en Windows siempre y cuando esté disponible una opción de sincronización con la nube, y virtualización de software para los usuarios cuyo sistema operativo es incompatible con Access.

#### Requisitos de entrada y salida 
* Entrada: Nombres e información adicional sobre los alumnos (contactos de emergencia, nombre de tutores, etc.), asistencia, desempeño, nombre de maestros, materias, y días de disponibilidad. 
* Salida: Estadísticas de asistencia y reportes sobre la calificación en promedio de los alumnos, así como información accesible sobre los mismos. 

#### Procesamiento
* Para las funciones descritas en el punto anterior, será necesario la elaboración de tablas pertinentes, las relaciones entre ellas y  como formas para la sencilla edición de las mismas. Sería importante incluir queries como paso intermedio para la entrega de reportes y diversas formas de búsqueda por parámetro, como nombre del alumno, materia o profesor. 

#### Seguridad
* Sincronización con la nube como primer recurso contra la pérdida de datos.
* Copias locales de la información
* Creación de “usuarios” con distintos privilegios de edición limitados a ciertas partes de la base de datos a la que accederán con contraseñas personales. 

### Criterios de rendimiento específicos
* La base de datos debe contar con lo siguiente
	* Contraseñas por usuario para limitar las secciones en que cada uno puede editar
	* Búsquedas que permitan el rápido acceso a la información
	* Formas efectivas, cuyo diseño permita un uso intuitivo.
	* Flexibilidad suficiente, o capacitación necesaria para su uso a largo plazo.
	* Reportes que ofrezcan un resumen de la información más relevante del mes. 
	* Integración con un servicio de sincronización en la nube

### Justificación de la solución propuesta 
Una base de datos, correctamente implementada, me parece  una solución pertinente para los conflictos que implica el crecimiento del proyecto Educas, puesto que es una herramienta más sólida que las herramientas de cálculo de Excel para el almacenamiento a largo plazo de la información, e integra herramientas que resultan más pertinentes para el control de la misma, como las formas, los queries, o los reportes. 
La posibilidad, que fue considerada junto con el equipo de Educas, de reutilizar las tablas de Excel fue rechazada debido a su inefectividad en mantener los datos de forma adecuada, y ausencia de sofisticación en cuanto a la abstracción que permite en las relaciones entre la información. Consideramos que una implementación similar en Excel tendría menos integridad, y debido a la redundancia de datos a la que podría llevar, un producto confuso y menos apropiado. 

Escogimos sincronizar la base de datos con la nube, porque mis compañeros cuentan con equipos en distintas plataformas, algunos requerirán un software de virtualización del sistema operativo para que sean compatibles con el software que se requiere (Windows 7 o mayor). Esto es porque necesitamos que sea compatible con versiones de MS Access iguales o mayor a 2013, por su facilidad de uso a comparación de versiones anteriores y los requerimientos que elegimos fueron los mínimos necesarios que recomienda Microsoft para la suite de 2013. 
(255 palabras)

### Criterio C 
| Fecha | Acción | Detalles | Comentarios | Fecha de compleción  | Criterió |
|———|————|—————|——————|———————————|—————|
|    07-09-2015   |    Primera reunión con el cliente     |   Se concretó que una base de datos sería la solución ideal para los problemas con los que cuenta EDUCAS       |             |           07-09-2015            |       A    |
|   11-09-2015    |   Comienza la fase de análisis y de factibilidad  |    Se investigará si es posible, y las maneras de conjugar las tecnologías necesarias para el producto      |             |        13-09-2015                 |    B       |
|     16-09-2015      | Comienza estudio a fondo de las funciones de Access |   Se estudiarán y aprenderán las técnicas avanzadas necesarias para el producto       |             |              |           B-D        |
|    16-09-2015       |    Primer borrador del diseño del producto    |      Considerando los requerimientos del cliente, se diseñará un boceto inicial de la estructura básica de la base de datos                     |             |     |    D       |
|    18-09-2015       |    Retroalimentación con el cliente    |          |    Se mantendrá una pequeña entrevista con el cliente con respecto al boceto inicial de la base de datos         |                      |    D       |
|    11-09-2015       |        |          |             |                      |           |
|     11-09-2015      |        |          |             |                      |           |
|     11-09-2015      |        |          |             |                      |           |
|     11-09-2015      |        |          |             |                      |           |
|       11-09-2015    |        |          |             |                      |           |
|    11-09-2015       |        |          |             |                      |           |
|    11-09-2015       |        |          |             |                      |           |
|     11-09-2015      |        |          |             |                      |           |
|     11-09-2015      |        |          |             |                      |           |

### Criterio D 
