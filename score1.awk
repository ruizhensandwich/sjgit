BEGIN {
	printf "%-8s %-8s %6s %6s %6s %6s\n", "학번", "이름", "국어", "영어", "수학", "총점","평균"
}

NR==1 {
	next
}
{
	total=$3+$4+$5
	avg=total/3
	kor_sum+=$3
	eng_sum+=$4
	math_sum+=$5
	count++
	
	printf "%-8s %-8s %6d %6d %6d %6d  %6.1f\n", $1, $2, $3, $4, $5, total, avg
}

END {
	printf "%-17s %6.1f %6.1f %6.1f\n", "과목평균", kor_sum/count, eng_sum/count, math_sum/count
}
