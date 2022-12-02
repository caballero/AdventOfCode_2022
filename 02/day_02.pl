#!Ursr/bin/perl

# https://adventofcode.com/2022/day/2

use strict;
use warnings;

# Codes: 
# A/X = Rock (+1)
# B/Y = Paper (+2)
# C/Z = Scissors (+3)
# Win (+6)
# Draw (+3)
# Loose (0)

my $score = 0;
my %type_points = ("X" => 1, "Y" => 2, "Z" => 3);
my %match_points = (
    "AX" => 3, "AY" => 6, "AZ" => 0,
    "BX" => 0, "BY" => 3, "BZ" => 6,
    "CX" => 6, "CY" => 0, "CZ" => 3);

while (<>) {
    chomp;
    my ($con, $me) = split;
    $score += $type_points{$me} + $match_points{"$con$me"};
}

print "$score\n";