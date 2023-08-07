###################################################################
# 4. Write a script that backs up a specified directory to 
# remote server using Irsyncl and SSH.
###################################################################

read -p "Enter The Source DIrectory:" SDIR

if [[ ! -d $SDIR ]]
then
        echo -e "Directory not Found. Please enter the correct path"
fi

destination_directory="root@192.168.0.173:/home/"


rsync -avzh $SDIR $destination_directory