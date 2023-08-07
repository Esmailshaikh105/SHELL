##################################################################################################################
#7. Write a shell script that generates a report of system resource usage, including CPU, memory, and disk usage.#
##################################################################################################################



###Get cpu Usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

##Get disk Usage
disk_usage=$(df-h | awk '$NF=="/" | {printf "%s", $5}')

##Get Memory Usage
memory_usage=$(free | awk '/Mem/ {printf "%.2f", $3/$2 * 100}')

###print the report
echo "System Resources Usage Report"
echo "------------------"
echo "Cpu usage is : $cpu_usage%"
echo "memory usage is : $memory_usage%"
echo "Disk Usage is : $disk_usage%"
############################
###save the report to a file

report_file="resources_usage_report.txt"
echo -e "\n system resource usage report \n ------------------
\nCpu usage:$cpu_usage% \n memory_usage%: $memory_usage%
\n Disk USage : $disk_usage" > "$report_file"

echo "report saved  to $report_file"