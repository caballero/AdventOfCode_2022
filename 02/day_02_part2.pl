#!Ursr/bin/perl

# https://adventofcode.com/2022/day/2

use strict;
use warnings;

# Codes: 
# A = Rock (+1)
# B = Paper (+2)
# C = Scissors (+3)
# Z = Win (+6)
# Y = Draw (+3)
# X = Loose (0)

my $score = 0;
my %type_points = ("A" => 1, "B" => 2, "C" => 3);
my %match_points = (
    "AA" => 3, "AB" => 6, "AC" => 0,
    "BA" => 0, "BB" => 3, "BC" => 6,
    "CA" => 6, "CB" => 0, "CC" => 3);
my %match_res = (
    "AX" => "C", "AY" => "A", "AZ" => "B",
    "BX" => "A", "BY" => "B", "BZ" => "C",
    "CX" => "B", "CY" => "C", "CZ" => "A");

while (<>) {
    chomp;
    my ($con, $res) = split;
    my $me = $match_res{"$con$res"};
    $score += $type_points{$me} + $match_points{"$con$me"};
}

print "$score\n";