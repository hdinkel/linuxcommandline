# change directory to your home directory
cd

# change directory to exercises/exercise_2
cd exercises/exercise_2

# list files
ls



# create file_1 in directory exercises/exercise_2
touch file_1

# list files
ls

# create file_2 in directory exercises/exercise_2
touch file_2

# list files
ls

# remove file_1 
rm file_1

# remove file_2 
rm file_2





# create folder_1 in directory exercises/exercise_2
mkdir folder_1

# list files
ls

# list files in folder_1
ls folder_1

# create subfolder_1 in directory exercises/exercise_2/folder_1
mkdir folder_1/subfolder_1

# list files
ls

# list files in folder_1
ls folder_1

# delete folder_1. Error: Directory not empty
rmdir folder_1
# first delete subfolder_1
rmdir folder_1/subfolder_1
# delete folder_1. Now it works
rmdir folder_1
