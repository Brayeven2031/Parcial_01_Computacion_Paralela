#!/usr/bin/perl

=begin comment
 * Fecha:  23 Agosto 2022
 * Autor:  Brayan Stiven Castañeda Cruz
 * Tema:   Ejecucion Automatizada de Benchmarks
=cut

# Se crean vectores para los ejecutables 
@Benchmarks = ("mm_main", "mm_main_rnd", "mm_main_double","mm_main_double_rnd");

# Se crean vectores para los tamaños de las matrices
@Cargas = ("280","657","1034","1411","1788","2165","2542","2919","3296","3673","4050","4427"); 

# Número de repeticiones que se realiza la ejecución por tamaño
$n = 30;

# Dirección en la que se encuentran los ejecutables de los benchmarks
$Path = "/home/brayeven2031/Documentos/octavo_semestre/paralela/Clase_10/Bench_Serie/";

# Carpeta en la que se guardarán los resultados de las tomas de rendimiento 
$Dir = "Soluciones/";

=begin comment
 * Se itera sobre la cantidad de ejecutables, cargas y repeticiones
=cut
foreach $exes (@Benchmarks){
    foreach $carga (@Cargas){

        #Se crea un fichero para almacenar los datos
        $file = $Dir.$exes."-size-".$carga.".txt";
        #print("$file \n");
        
        for ($i=0;$i<$n;$i++){
            #print("$Path$exes $carga\n");
            system("$Path$exes $carga >> $file");
        }
        close($file);
    }
}
