#!/usr/bin/perl

# https://adventofcode.com/2022/day/6#part2

use strict;
use warnings;

my $uniq_set = 14;

while (<>) {
    chomp;
    my @str = split(//, $_);
    for (my $i=0; $i<=$#str-$uniq_set; $i++) {
        my $mark = '';
        for (my $j=0; $j<$uniq_set; $j++) { $mark .= $str[$i+$j]; }
        my $is_ok = checkMark($mark);
        if ($is_ok == 1) {
            print "Message in ", $i+$uniq_set, "\n";
            last;
        }
    }
}

sub checkMark {
    my $str = shift @_;
    my @m = split(//, $str);
    my %m = ();
    foreach my $m (@m) { $m{$m}++; }
    my $uniq = 0;
    foreach my $m (keys %m) { $uniq++; }
    return 1 if ($uniq == $uniq_set);
    return 0;
}