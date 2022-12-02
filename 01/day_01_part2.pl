#!/usr/bin/perl

# https://adventofcode.com/2022/day/1#part2

use strict;
use warnings;

my @total;
$/="\n\n";
while (<>) {
    my $sum = 0;
    my @elem = split(/\n/, $_);
    foreach my $e (@elem) { $sum += $e; }
    push @total, $sum;
}
@total = sort {$b <=> $a} @total;
my $top3_sum = $total[0] + $total[1] + $total[2];

print "$top3_sum\n";