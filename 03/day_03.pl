#!/usr/bin/perl

# https://adventofcode.com/2022/day/3

use strict;
use warnings;

my $score = 0;

while (<>) {
    chomp;
    my @line = split(//, $_);
    my $mid  = int(($#line + 1) / 2);
    my $dup  = undef;
    for (my $i=0; $i<$mid; $i++) {
        my $a = $line[$i];
        for (my $j=$mid; $j<=$#line; $j++) {
            my $b = $line[$j];
            if ($a eq $b) {
                $dup = $a;
                last;
            }
        }
        last if (defined $dup);
    }
    my $ord = ord($dup);
    my $adj = 0;
    if ($ord>=97 and $ord<=122) { # a-z
        $adj = 96;
    }
    elsif ($ord>=65 and $ord<=90) { # A-Z
        $adj = 38;
    }
    else {
        warn "Char $dup is not a-zA-Z\n";
    }
    $score += $ord - $adj;
}
print "Score = $score\n";