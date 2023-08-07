#!/bin/bash


#####################################################################
# 1 . Write a shell script that lists all files in a specified      #
# directory and saves the output to a text file.                    #
#####################################################################

DIR_PATH=$1
SAVE_FILE=ismail



if [[ ! -d $DIR_PATH ]]
then
        echo -e "Directory not Found. Please enter the correct path"
else
        echo -e "Directory is found, listing $DIR_PATH and saving ouput in $SAVE_FILE"
        ls -lhrt $DIR_PATH > $SAVE_FILE
fi

echo "if you want to created New dir ? (y/n):"
read choice
<<comment1
if [[ "$choice" == "y" ]]

then
     echo -e "enter the directory name:" New_Dir
     mkdir $New_Dir
     cd $New_Dir
     echo "hello i am ismail" > ismail.txt
     ls -lhrt $New_Dir > $SAVE_FILE
echo -e "new file is created and contents are saved in $SAVEFILE"
else
    echo -e "file is already created"
fi