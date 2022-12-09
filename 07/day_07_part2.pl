#!/usr/bin/perl

# https://adventofcode.com/2022/day/7#part2

use strict;
use warnings;

my %fs = ();
my $cpath = 'root';
my $tot_size  = 70000000;
my $req_space = 30000000;

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

my $need_space = $req_space - ($tot_size - $fs{"/root"});

print "required space is $need_space\n";

my $sel_dir = '';
my $min_size = $tot_size;
foreach my $dir (keys %fs) {
    my $size = $fs{$dir};
    if ($size >= $need_space) {
        if ($size < $min_size) {
            $sel_dir = $dir;
            $min_size = $size;
        }
    }
}

print "Selected dir is $sel_dir (size = $min_size)\n";