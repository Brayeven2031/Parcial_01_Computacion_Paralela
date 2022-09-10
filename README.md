# **Parcial_01_Computacion_Paralela**
La administración óptima de los recursos de un computador es indispensable, sin embargo, para tener un control eficiente de estos, se debe tener en cuenta en primera instancia que se presentan de manera cuantificable en el sistema y deben ser del conocimiento de su empleador. Para contemplar dicho proceso, se realiza una implementación de cuatro benchmarks (Int, Double, Int_Random y Double_Random) codificados en el lenguaje de programación C; estos tiene como objetivo calcular el costo temporal en diferentes nodos de cómputo de 30 repeticiones individuales, al ejecutar el clásico proceso de multiplicación de matrices, mediante un lanzador que automatiza el proceso de las tomas de rendimiento para 12 tamaños de matrices distintas (280, 657, 1034, 1411, 1788, 2165, 2542, 2919, 3296, 3673, 4050, 4427). Dicho proceso se realiza con el fin de obtener conclusiones decisivas a la hora de evaluar y analizar las circunstancias que determinan la eficiencia de un programa.

A continuación, encontrará el repositorio del código en el lenguaje de programación C, correspondiente a la solución y planteamiento de 4 Bechmarks diseñados para la toma de rendimientos al realizar la clásica multiplicación entre matrices. Para ello se utilizó la metodología de compilación por separado, por tal motivo la solución se encuentra divida en varios archivos mm_main.c, mm_main_rnd.c, mm_main_double.c y mm_main_double_rnd.c (Archivos que contiene el método principal para generar el arranque del programa para cada uno de los benchmarks, adicional a esto, los archivos contienen métodos prácticos para aumentar el rendimiento de la ejecución y la reserva de memoria), taller_lib.c (Archivo que es la interfaz de los métodos a los que el programa hace llamados y que se encargan de aportar a la solución solicitada para las tomas de rendimiento y los procedimientos de preparación y multiplicación de matrices) y por último, el archivo taller_lib.h (Archivo que es la biblioteca artesanal creada con el fin de generar el listado de funciones y métodos que permitirán el correcto desempeño del programa). Adicional a esto se incluyen dos archivos, uno nombrado Makefile que se encargará de automatizar el proceso de compilación de los archivos .c generando los ejecutables para cada Bechmark y finalmente el lanzador.pl (archivo de perl encargado de automatizar la toma de tiempo ejecutando de manera automática un total de 30 repeticiones por tamaño definido con los cuatro ejecutables).



# **Archivos principales**
## *mm_main.c* 
> El presente archivo resguarda la función principal del primer bechmark **(ENTERO con números definidos)**. 
> 
> Para esto inicialmente se captura el valor de la matriz que es ingresado por consola en el momento de la ejecución como un parámetro de entrada, dicho valor se guarda dentro de la variable $N$. Posteriormente se declaran las matrices como apuntadores de memoria a la reserva un espacio prudencial guardado en la variable *MEM_CHUNK* esta memoria se repartirá para las matrices permitiendo la multiplicación con matrices más grandes, es decir que superen las 835 unidades. 
>
> Las matrices se inicializan mediante la función inicializacion_mm_int(), de la interfaz artesanal "mm_lib.h" . Inmediatamente después, se invoca el método punto_prueba_inicial() para iniciar la toma del tiempo, guardando el tiempo exacto en el que se hace el llamado de la función, se realiza la multiplicación clásica (mediante el método multiplicacion_mm_int()), que se explicará más adelante, y tan pronto finalice la multiplicación se tomara el tiempo de cierre con el llamado del método punto_prueba_final() que calcula el tiempo empleado en la operación y lo imprime por pantalla.

## *mm_main_rnd.c* 
> El presente archivo resguarda la función principal del segundo bechmark **(ENTERO con números ALEATÓRIOS)**. 
> 
> Para esto inicialmente se captura el valor de la matriz que es ingresado por consola en el momento de la ejecución como un parámetro de entrada, dicho valor se guarda dentro de la variable $N$. Posteriormente se declaran las matrices como apuntadores de memoria a la reserva un espacio prudencial guardado en la variable *MEM_CHUNK* esta memoria se repartirá para las matrices permitiendo la multiplicación con matrices más grandes, es decir que superen las 835 unidades. 
>
> Las matrices se inicializan mediante la función inicializacion_mm_int_rnd(), de la interfaz artesanal "mm_lib.h" . Inmediatamente después, se invoca el método punto_prueba_inicial() para iniciar la toma del tiempo, guardando el tiempo exacto en el que se hace el llamado de la función, se realiza la multiplicación clásica (mediante el método multiplicacion_mm_int()), que se explicará más adelante, y tan pronto finalice la multiplicación se tomara el tiempo de cierre con el llamado del método punto_prueba_final() que calcula el tiempo empleado en la operación y lo imprime por pantalla.

## *mm_main_double.c* 
> El presente archivo resguarda la función principal del tercer bechmark **(FLOTANTE con números definidos)**. 
> 
> Para esto inicialmente se captura el valor de la matriz que es ingresado por consola en el momento de la ejecución como un parámetro de entrada, dicho valor se guarda dentro de la variable $N$. Posteriormente se declaran las matrices, en este caso de tipo double, como apuntadores de memoria a la reserva un espacio prudencial guardado en la variable *MEM_CHUNK* esta memoria se repartirá para las matrices permitiendo la multiplicación con matrices más grandes, es decir que superen las 835 unidades. 
>
> Las matrices se inicializan mediante la función inicializacion_mm_double(), de la interfaz artesanal "mm_lib.h" . Inmediatamente después, se invoca el método punto_prueba_inicial() para iniciar la toma del tiempo, guardando el tiempo exacto en el que se hace el llamado de la función, se realiza la multiplicación clásica (mediante el método multiplicacion_mm_double()), que se explicará más adelante, y tan pronto finalice la multiplicación se tomara el tiempo de cierre con el llamado del método punto_prueba_final() que calcula el tiempo empleado en la operación y lo imprime por pantalla.

## *mm_main_double_rnd.c* 
> El presente archivo resguarda la función principal del segundo bechmark **(FLOTANTE con números ALEATÓRIOS)**. 
> 
> Para esto inicialmente se captura el valor de la matriz que es ingresado por consola en el momento de la ejecución como un parámetro de entrada, dicho valor se guarda dentro de la variable $N$. Posteriormente se declaran las matrices, en este caso de tipo double, como apuntadores de memoria a la reserva un espacio prudencial guardado en la variable *MEM_CHUNK* esta memoria se repartirá para las matrices permitiendo la multiplicación con matrices más grandes, es decir que superen las 835 unidades. 
> 
> Las matrices se inicializan mediante la función inicializacion_mm_double_rnd(), de la interfaz artesanal "mm_lib.h" . Inmediatamente después, se invoca el método punto_prueba_inicial() para iniciar la toma del tiempo, guardando el tiempo exacto en el que se hace el llamado de la función, se realiza la multiplicación clásica (mediante el método multiplicacion_mm_double()), que se explicará más adelante, y tan pronto finalice la multiplicación se tomara el tiempo de cierre con el llamado del método punto_prueba_final() que calcula el tiempo empleado en la operación y lo imprime por pantalla.


# **Interfaz**
### *mm_lib.c* 
> En el archivo actual se encuentran las implementaciones de los métodos y funciones declaradas en la biblioteca artesanal "mm_lib.h". A continuación, encontrará una breve introducción de la funcionalidad de los métodos: 
> 
> - **punto_prueba_inicial() - punto_prueba_final():** 
> > Los métodos se encargan de proporcionar el tiempo de ejecución de un proceso en particular para este caso la multiplicación entre matrices. Para ello, el primer método inicia guarda dentro de la estructura *inicio_cuenta* el tiempo exacto en el que fue invocada la función. Por otro lado, el segundo método también se encargará de guardar el tiempo exacto en el que se realizó el llamado al método, pero esta vez dentro de la estructura *fin_cuenta*, para que posteriormente se calcule la diferencia entre los dos tiempos y lo imprima en pantalla en equivalente a segundos de ejecución.

> - **inicializacion_mm_int() - inicializacion_mm_double()**
> > Las funciones anteriores se encargan de recibir los apuntadores de las tres matrices e inicializarlas según el bechmark que lo invoque, es decir el bechmark de ENTEROS definidos invocará el método inicializacion_mm_int(), para iniciar cada valor de la matriz mediante operaciones ya definidas con la certeza de guardar en el espacio de memoria solo valores enteros. Por otro lado, el bechmark de FLOTANTES definidos invocará el método inicializacion_mm_double(), para iniciar cada valor de la matriz mediante operaciones ya definidas con la certeza de guardar en el espacio de memoria solo valores de tipo flotante.

> - **random_int() - random_double() - inicializacion_mm_int_rnd() - inicializacion_mm_double_rnd()**
> > Las funciones anteriores se encargan de recibir los apuntadores de las tres matrices e inicializarlas según el bechmark que lo invoque, es decir el bechmark de ENTEROS ALEATORIOS invocará el método inicializacion_mm_int_rnd(), para iniciar cada valor de la matriz mediante llamados a la función random_int() con la certeza de guardar en el espacio de memoria valores enteros aleatorios entre 0 y 9. Por otro lado, el bechmark de FLOTANTES ALEATORIOS invocará el método inicializacion_mm_double_rnd(), para iniciar cada valor de la matriz mediante llamados a la función random_double() con la certeza de guardar en el espacio de memoria valores flotantes aleatorios entre 0.0 y 9.9.

> - **multiplicacion_mm_int() - multiplicacion_mm_double()**
> > Las funciones se encargan de realizar el procedimiento de multiplicación clásico entre dos matrices, cabe resaltar que estás son llamadas según el bechmark que lo invoque, es decir, que los Bechmark de tipo entero llamarán la función multiplicacion_mm_int() y las de tipo flotante la función multiplicacion_mm_double(). 
> > Para agilizar el proceso de multiplicación, en ambos métodos se hace uso "Punteros auxiliares", de este modo la matriz tomará el valor directamente para operarlo y ahorra tiempo de ejecución en llamados a la memoria e instrucciones innecesarias.


# **Biblioteca**
## *mm_lib.h*
> El archivo actual es la biblioteca artesanal de los métodos y funciones creadas manualmente, para ser implementadas por las clases principales y la interfaz. En este únicamente se definen los tipos de función, los nombres de estas y los parámetros que recibirán, estos métodos cumplen objetivos puntuales dentro del desarrollo y correcta ejecución de los Bechmarks y fueron explicados anteriormente.


# **Compilación y lanzamiento automático**
## *Makefile*
> Con el archivo de tipo Makefile, se automatizará el procedimiento de compilación por separado, es decir, debido a que toda la codificación no se encuentra en un único archivo, esto por métodos correctos de programación, que también se ven reflejados en el rendimiento y peso del programa; se requiere que el código se ejecute por partes, por ejemplo, para un único programa se requiere ejecutar el principal del proyecto, luego la interfaz y por último la unión de ambos objetos. Ahora bien, para el caso del presente programa en el que contamos con 4 clases principales, el proceso se tornaría un poco tedioso y extenso, por tanto, se convierte en una necesidad tener el presente archivo. 
> El programa se divide en dos partes, la sección de declaraciones de variable globales y la sección de métodos. Dentro de la primera se encuentran los comandos y banderas necesarias para la correcta compilación y el vector de los métodos de compilación (métodos destinados para la compilación de cada Bechmark). Por último, en la sección de métodos se encontrarán los siguientes: 
> - all: Método que ejecuta todos los métodos de compilación menos el de limpieza
> - mm_main: Compilación Benchmark ENTERO
> - mm_main_rnd: Compilación Benchmark ENTERO ALEATORIO
> - mm_main_double: Compilación Benchmark DOUBLE
> - mm_main_double_rnd: Compilación Benchmark DOUBLE ALEATORIO
> - clean: Elimina todos los ejecutables generados y los archivos de tipo .o
