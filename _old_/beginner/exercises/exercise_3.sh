# change directory to your home directory
cd

# change directory to exercises/exercise_3
cd exercises/exercise_3

# list files
ls


# create file_1 in directory exercises/exercise_3
touch file_1

# list files
ls

# create file_2 in directory exercises/exercise_3
touch file_2

# list files
ls


# create folder_1 in directory exercises/exercise_3
mkdir folder_1

# create subfolder_1 in directory exercises/exercise_3/folder_1
mkdir folder_1/subfolder_1

# list files in folder_1
ls folder_1



# copy file_1 into folder exercises/exercise_3/folder_1
cp file_1 folder_1/

# move file_2 into folder exercises/exercise_3/folder_1/subfolder_1
mv file_2 folder_1/subfolder_1/

# list files 
ls 
# list files in folder_1
ls folder_1
# list files in folder_1/subfolder_1
ls folder_1/subfolder_1


# move file_1 
rm file_1
rm folder_1/file_1

# remove file_2 
rm folder_1/subfolder_1/file_2

# first delete subfolder_1
rmdir folder_1/subfolder_1
# delete folder_1. Now it works
rmdir folder_1
