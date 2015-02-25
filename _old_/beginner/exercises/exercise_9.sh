
################################################################################
# Login to machine sub-master.embl.de (first without specifying a username, 
# then try the same providing a username).
# Use the following commands locally as well as on the remote machine to get 
# a feeling for the different machines:
# hostname
# whoami
# cat /etc/hostname
# ls -lah ~/
################################################################################


################################################################################
# copy the file /etc/motd from machine sub-master.embl.de  into your local home directory
################################################################################
scp sub-master.embl.de:/etc/motd ~/

################################################################################
# determine the filetype and the permissions of the file that you just copied
################################################################################
file ~/motd
ls -la ~/motd

