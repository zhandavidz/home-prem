first_server=11
last_server=13

local_prefix="10.0.5."
network_prefix="192.168.5."

num_success=0
num_fail=0

echo -e "==== Pinging Local Servers! ====\n"
for i in `seq $first_server $last_server`
do
	local_addr="$local_prefix$i"
	network_addr="$network_prefix$i"

	echo -n "$local_addr: "
	if ping -c 1 "$local_addr" &> /dev/null
	then
		echo "✓"
		((num_success++))
	else
		echo "FAIL"
		((num_fail++))
	fi

	echo -n "$network_addr: "
	if ping -c 1 "$network_addr" &> /dev/null
	then
		echo "✓"
		((num_success++))
	else
		echo "FAIL"
		((num_fail++))
	fi

	echo ""
done


echo -e "**** completed all pings ****"
echo -e "Successes: $num_success\nFails: $num_fail"

if (($num_fail > 0));
then
	echo -e "\n**** FAILS DETECTED ****"
fi
