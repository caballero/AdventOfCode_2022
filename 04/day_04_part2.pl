#!/urs/bin/perl

# https://adventofcode.com/2022/day/4#part2

use strict;
use warnings;

my $count = 0;
while (<>) {
    chomp;
    my ($c1, $c2) = split(/,/, $_);
    my ($s1, $e1) = split(/-/, $c1);
    my ($s2, $e2) = split(/-/, $c2);

    if (($s1>=$s2 and 
        $s1<=$e2) or 
        ($e1>=$s2 and 
        $e1<=$e2)) { $count++; }
    elsif (($s2>=$s1 and 
        $s2<=$e1) or 
        ($e2>=$s1 and 
        $e2<=$e1)) { $count++; }
}

print "total $count\n";