#/bin/bash
input_file="./ipv6_list.txt"
# Starting ID
start_id=501
# Loop through each line in the file
while IFS= read -r ip; do
    echo "INSERT INTO ips VALUES ($start_id, IPPID, 0, 0, '$ip', 1, '', 0, NULL, '', 0, NULL);"
    ((start_id++))
done < "$input_file"
