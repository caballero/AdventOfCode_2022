#!/usr/bin/perl

#https://adventofcode.com/2022/day/7

use strict;
use warnings;

my %fs = ();
my $cpath = 'root';
my $max_size = 100000;

while (<>) {
    chomp;
    # add new level on "cd"
    if (/^\$ cd (\w+)/) {
        $cpath .= "/$1";
    }

    # remove level if "cd .."
    if (/^\$ cd \.\./) {
        $cpath =~ s|/\w+$||;
    }

    # add file size for dir
    if (/^(\d+) /) {
        my $size = $1;
        my @path = split(/\//, $cpath);
        my $ppath = '';
        foreach my $dir (@path) {
            $ppath .= "/$dir";
            $fs{$ppath} += $size;
        }
        
    }
}

my $sum = 0;

foreach my $dir (keys %fs) {
    my $size = $fs{$dir};
    print "$dir\t$size\n";
    $sum += $size if ($size <= $max_size);
}

print "total size is $sum\n";