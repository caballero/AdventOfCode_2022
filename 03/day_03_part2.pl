#!/usr/bin/perl

# https://adventofcode.com/2022/day/3#part2

use strict;
use warnings;

my $score = 0;
my @set = ();
my $num_lines = 0;
while (<>) {
    chomp;
    $num_lines++;
    push @set, $_;

    if ($num_lines == 3) {
        my $dup = getShared(@set);
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

        @set = ();
        $num_lines = 0;
    }
}
print "Score = $score\n";

sub getShared {
    my @s = @_;
    my %h1 = (); my %h2 = (); my %h3 = ();
    my %cm = ();
    my @s1 = split(//, $s[0]);
    my @s2 = split(//, $s[1]);
    my @s3 = split(//, $s[2]);
    foreach my $x (@s1) { $h1{$x}++; $cm{$x}++; }
    foreach my $x (@s2) { $h2{$x}++; $cm{$x}++; }
    foreach my $x (@s3) { $h3{$x}++; $cm{$x}++; }
    foreach my $x (keys %cm) {
        return $x if (defined $h1{$x} and defined $h2{$x} and defined $h3{$x});
    }
    warn "no shared item found, abort\n";
    exit(1);
}