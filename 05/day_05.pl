#!/usr/bin/perl

# https://adventofcode.com/2022/day/5

use strict;
use warnings;

# Stacks
my %s = ();
$s{1} = (); # col = 1
$s{2} = (); # col = 5
$s{3} = (); # col = 9
$s{4} = (); # col = 13
$s{5} = (); # col = 17
$s{6} = (); # col = 21
$s{7} = (); # col = 25
$s{8} = (); # col = 29
$s{9} = (); # col = 33

my $load_crates = 1;
my $iter = 0;
while (<>) {
    chomp;
    $load_crates = 0 if (/^\s1/);
    if ($load_crates == 1) {
        my @m = split(//, $_);
        unshift @{$s{1}}, $1 if ($m[ 1] =~ /(\w)/);
        unshift @{$s{2}}, $1 if ($m[ 5] =~ /(\w)/);
        unshift @{$s{3}}, $1 if ($m[ 9] =~ /(\w)/);
        unshift @{$s{4}}, $1 if ($m[13] =~ /(\w)/);
        unshift @{$s{5}}, $1 if ($m[17] =~ /(\w)/);
        unshift @{$s{6}}, $1 if ($m[21] =~ /(\w)/);
        unshift @{$s{7}}, $1 if ($m[25] =~ /(\w)/);
        unshift @{$s{8}}, $1 if ($m[29] =~ /(\w)/);
        unshift @{$s{9}}, $1 if ($m[33] =~ /(\w)/);
    }

    if (/^move (\d+) from (\d) to (\d)/) {
        my $num  = $1;
        my $from = $2;
        my $to   = $3;
        foreach (1..$num) {
            my $x = pop @{ $s{$from} };
            push @{ $s{$to} }, $x;
        }
        $iter++;
        print "ITER $iter: $_\n";
        for (my $i=1; $i<=9; $i++) {
            print join "", "S$i ", @{ $s{$i}};
            print "\n";
        }
    }
}

print "\nFinal row: ";
for (my $i=1; $i<=9; $i++) { print $s{$i}[-1]; }
print "\n";
