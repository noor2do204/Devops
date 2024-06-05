#!/bin/bash

# 1. Move linuxman to tux in mascots directory
mkdir -p personnages/mascottes
mv personnages/super\ heros/hommes/sans\ cape/linuxman personnages/mascottes/tux

# 2. Rename the directory superheroes to comics
mv personnages/super\ heros personnages/comics

# 3. Write into the file batman
echo "Bruce Wayne hides behind this character" > personnages/comics/hommes/cape/batman

# 4. Append to the file batman
echo "He lives in Gotham" >> personnages/comics/hommes/cape/batman

# 5. Write into the file daredevil
echo "Homer Simpson hides behind this character" > personnages/comics/hommes/sans\ cape/daredevil

# 6. Overwrite the content of the file daredevil
echo "DareDevil is a blind comic character" > personnages/comics/hommes/sans\ cape/daredevil

# 7. Copy the contents of batman and daredevil into mascots/mixdarbat
cat personnages/comics/hommes/cape/batman personnages/comics/hommes/sans\ cape/daredevil > personnages/mascottes/mixdarbat

# 9. Create a user named "fanboy"
# If the user already exists, ignore the error
sudo useradd -m fanboy || true

# 10. Copy the directory characters into /home/fanboy
# Use sudo to ensure you have the necessary permissions
sudo cp -r personnages /home/fanboy

# 11. Change owner and group of the directory
# Use sudo to ensure you have the necessary permissions
sudo chown -R fanboy:fanboy /home/fanboy/personnages

# 12. Create a symbolic link "persofanboy" pointing to /home/fanboy/characters
# Use sudo to ensure you have the necessary permissions
# Add the -f option to force the creation of the symbolic link
sudo ln -sf /home/fanboy/personnages /home/fanboy/persofanboy

# 13. Create a symbolic link "perso_yourname" pointing to /home/yourname/characters
# Replace "yourname" with your actual username
yourname=$(whoami)  # Get the current username
cp -r personnages /home/$yourname/
# Add the -f option to force the creation of the symbolic link
sudo ln -sf /home/$yourname/personnages /home/$yourname/perso_$yourname

# 14. Save the complete tree structure of /home/fanboy/characters into 14.txt
# Use sudo to ensure you have the necessary permissions
sudo apt install -y tree
sudo tree /home/fanboy/personnages > 14.txt

# 15. Remove occurrences of the word "directories" from 14.txt and save into 15.txt
grep -v "directories" 14.txt > 15.txt

# 16. Save the last 250 lines of history into myhistory, removing lines with "cd" command
# Use the HISTFILE environment variable to get the path to your .bash_history file
history_file_path=$HISTFILE
if [[ -f $history_file_path ]]; then
    grep -v "cd" $history_file_path | tail -n 250 > myhistory
else
    echo "Error: .bash_history file does not exist"
fi