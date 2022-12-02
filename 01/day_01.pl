#!/usr/bin/perl

# https://adventofcode.com/2022/day/1

use strict;
use warnings;

my $max = 0;
$/="\n\n";
while (<>) {
    my $sum = 0;
    my @elem = split(/\n/, $_);
    foreach my $e (@elem) { $sum += $e; }
    $max = $sum if ($sum > $max);
}
print "$max\n";