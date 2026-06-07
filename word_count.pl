#!/usr/bin/perl
use strict;
use warnings;

my %count;

while (my $word=<STDIN>) {
	chomp($word);
	$count{$word}++;
}
foreach my $word (sort keys %count) {
	printf "%-15s %d\n", $word, $count{$word};
}
