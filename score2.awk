NR == 1{
	subject_count=NF -2

	printf "%-8s %-8s", $1, $2

	for(i=3; i<=NF; i++) {
		printf "%6s", $i
	}
	printf "%6s %6s\n", "총점", "평균"
	next
}
{
	total=0
	printf "%-8s %-8s", $1, $2
	for (i=3; i<=NF; i++) {
		total += $i
		subject_sum[i]+=$i
		printf "%6d", $i
	}
	avg=total/subject_count
	count++
	printf "%6d %6.1f\n", total, avg
}
END{
	printf "%-17s", "과목평균"
	for(i=3; i<=subject_count + 2; i++) {
		printf "%6.1f", subject_sum[i] / count
	}
	printf "\n"
}
