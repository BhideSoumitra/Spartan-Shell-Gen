l=1;
for j in $(seq 0.01 0.01 0.70)
do
	for k in $(seq 0.0 0.1 1.0)
	do

		printf 	"for Release_freq in %.2f\n" "$j" > run_test_$(printf "%d" "$l").sh
		printf "do\n" >>  run_test_$(printf "%d" "$l").sh
		printf "for Embryonic_cas9_eff in %.2f\n" "$k"  >>  run_test_$(printf "%d" "$l").sh
		printf "do\n" >>  run_test_$(printf "%d" "$l").sh
		printf "for i in {1..100}\n" >>  run_test_$(printf "%d" "$l").sh
		printf "do\n" >>  run_test_$(printf "%d" "$l").sh
		printf "slim -d Release_freq=$Release_freq -d Embryonic_cas9_eff=$Embryonic_cas9_eff Inversion_drive.slim \\n"	>>  run_test_$(printf "%d" "$l").sh
		printf "| awk -v var="$Release_freq" '{print $0, var}' \\n" >>  run_test_$(printf "%d" "$l").sh
		printf "| awk -v var="$Embryonic_cas9_eff" '{print $0, var}' \\n" >>  run_test_$(printf "%d" "$l").sh
		printf "| awk -v var="$i" '{print $0, var}' >> test#RF#$Release_freq#ECE#$Embryonic_cas9_eff.txt\n" >>  run_test_$(printf "%d" "$l").sh
		printf "done\n" >>  run_test_$(printf "%d" "$l").sh
		printf "done\n" >>  run_test_$(printf "%d" "$l").sh
		printf "done" >>  run_test_$(printf "%d" "$l").sh
		((l++));
	done
done


