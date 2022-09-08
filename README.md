# Parcial_01_Computacion_Paralela
La administración óptima de los recursos de un computador es indispensable, sin embargo, para tener un control eficiente de estos, se debe tener en cuenta en primera instancia que se presentan de manera cuantificable en el sistema y deben ser del conocimiento de su empleador. Para contemplar dicho proceso, se realiza una implementación de cuatro benchmarks (Int, Double, Int_Random y Double_Random) codificados en el lenguaje de programación C; estos tiene como objetivo calcular el costo temporal en diferentes nodos de cómputo de 30 repeticiones individuales, al ejecutar el clásico proceso de multiplicación de matrices, mediante un lanzador que automatiza el proceso de las tomas de rendimiento para 12 tamaños de matrices distintas (280, 657, 1034, 1411, 1788, 2165, 2542, 2919, 3296, 3673,  4050, 4427). Dicho proceso se realiza con el fin de obtener conclusiones decisivas a la hora de evaluar y analizar las circunstancias que determinan la eficiencia de un programa. 

A continuación econtrará el repositorio del código en el lenguaje de programación C, correspondiente a la solución y planteamiento de 4 Bechmarks diseñados para la toma de rendimientos al realizar la clásica multiplicación entre matrices. Para ello se utilizó la metodología de compilación por separado, por tal motivo la solución se encuentra divida en varios archivos mm_main.c, mm_main_rnd.c, mm_main_double.c y mm_main_double_rnd.c (Archivos que contiene el método principal para generar el arranque del programa para cada uno de los benchmarks, adicional a esto contienen métodos prácticos para aumentar el rendimiento de la ejecución y la reserva de memoria), taller_lib.c (Archivo que es la interfaz de los métodos a los que el programa hace llamados y que se encargan de dar la solución solicitada para cada punto) y por último, el archivo taller_lib.h (Archivo que es la biblioteca artesanal creada con el fin de generar el listado de funciones y métodos que permitirán el correcto desempeño del programa). Adicional a esto se incluyen dos archivos, uno nombrado Makefile que se encargará de automatizar el proceso de compilación de los archivos .c generando los ejecutables para cada Bechmark y finalmente el lanzador.pl (archivo de perl encargado de automatizar la toma de tiempo ejecutando de manera automatica un total de 30 repeticiones por tamaño definido con los cuatro ejecutables).
