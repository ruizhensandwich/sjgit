#!/usr/bin/perl
use strict;
use warnings;

my @subject_sum;
my $count=0;
my $subject_count=0;

while (my $line = <STDIN>) {
	chomp($line);
	my @field = split(/\s+/, $line);
	
	if ($. ==1) {
		$subject_count=@field -2;

		printf "%-8s %-8s", $field[0], $field[1];

		for(my $i=2; $i < @field; $i++) {
			printf "%6s", $field[$i];
		}
		printf "%6s %6s\n", "총점", "평균";
		next;
	}
	my $total=0;
	printf "%-8s %-8s", $field[0], $field[1];
	for (my $i =2; $i < @field; $i++) {
		$total += $field[$i];
		$subject_sum[$i] += $field[$i];
		printf "%6d", $field[$i];
	}
	my $avg = $total / $subject_count;
	$count++;

	printf "%%6d %6.1f\n", $total, $avg;
}
printf "%-17s", "과목평균";

for (my $i =2; $i<$subject_count +2; $i++) {
	printf "%6.1f", $subject_sum[$i] / $count;
}
printf "\n";
