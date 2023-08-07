################################################################
#9. Write a shell script that scans a directory for files      # 
#matching a certain pattern and deletes them.                  #
################################################################


read -p "Enter the diretory path:" DIR
read -p "Enter the file pattern:" Pattern


## move to the specified directory
cd $DIR

###find the file matching pattern and delete them
find . -type f -name "$pattern" -exec rm{} \;

