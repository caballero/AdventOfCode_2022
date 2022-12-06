#!/usr/bin/perl

# https://adventofcode.com/2022/day/6

use strict;
use warnings;

while (<>) {
    chomp;
    my @str = split(//, $_);
    for (my $i=0; $i<=$#str-3; $i++) {
        my $mark = $str[$i] . $str[$i+1] . $str[$i+2] . $str[$i+3];
        my $is_ok = checkMark($mark);
        if ($is_ok == 1) {
            print "Marker in ", $i+4, "\n";
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
    return 1 if ($uniq == 4);
    return 0;
}