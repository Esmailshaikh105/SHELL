directory="/path/to/log/files"
days_to_keep=30
archive_name="archive.tar.gz"



# Get the current date and calculate the threshold date
current_date=$(date +%Y-%m-%d)
threshold_date=$(date -d "$current_date -$days_threshold days" +%Y-%m-%d)

# Create the archive directory if it doesn't exist
mkdir -p "$archive_directory"

# Iterate over the log files in the directory
for file in "$log_directory"/*.log; do
    if [ -f "$file" ]; then
        file_date=$(date -r "$file" +%Y-%m-%d)
        
        # Check if the file is older than the threshold date
        if [ "$file_date" \< "$threshold_date" ]; then
            # Create a tar file with the log file
            base_name=$(basename "$file" .log)
            tar_file="$archive_directory/$base_name.tar.gz"
            
            tar -czf "$tar_file" "$file"
            
            # Remove the original log file
            rm "$file"
            
            echo "Archived and compressed: $file -> $tar_file"
        fi
    fi
done