#!/bin/bash

#create Folders
mkdir Image_Files Audio_Files Normal_Files Compres_Files

#Image Files
cd Image_Files
touch imgage1.png
touch image.jpg
touch image.gif
cd -

# Audio Files
cd Audio_Files
touch audio1.mp3
touch audio.mp4
cd -

# normal files
cd Normal_Files
 touch ismail
 touch kabir
 cd -

# move all image files in Compres_Files
mv Image_Files/* Compres_Files

# move all audio files in compres_Files
mv Audio_Files/* Compres_Files

# move all normal files in compres_FIles
mv Normal_Files/* Compres_Files


echo "All done organizing your $compres folder"
