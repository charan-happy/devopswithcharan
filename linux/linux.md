# Linux Notes

Introduction To Linux

Basic Commands

Managing File system and partition

Logical Volume Management

User and Group Administration

Network Configuration and Troubleshooting

Managing Selinux 

Boot Procedure and Kernel Parameters

Job Automation

Administrating Remote System

Software Management

Managing Installed Services

FTP (File Transfer Protocol ) Server

NFS (Network File System) Server

SAMBA Server

DNS (Domain Name System) Server

Web Server (Apache )

Introduction To Linux

**************what is Operating System ?**************

- Os is an Interface between user and the Computer hardware.
- os is an abstraction between the applications and hardware (or)
- Os is a software managing the computer hardware, software resources and provides common services for computer programs.

******************************************************Types of Operating System :******************************************************

1. Single user - single Tasking operating System EX: ************MS-DOS************
2. Single user - Multitasking Operating System EX: ************************************************Windows-98,XP, Vista etc************************************************
3. Multi User - Multitasking Operating System EX: ********************************Unix, LInux etc.********************************

**************************Tasks of OS :**************************

1. Resource allocation and management (process management, memory management, storage management)
2. File Management
3. Device Management
4. Security and 
5. Networking

Components of OS?

1. Kernel
2. Application Layer
3. Shell

********************************what is kernel ?********************************

>> Kernel is the heart of the OS. It is a core program that provides basic services for all other parts of the OS. 

>> It consists of device drivers, dispatcher, scheduler, file system etc.

>> One of the first programs loaded on startup

>> Controls all hardware resources via device drivers

**************************************************what is VM and virtualization ?**************************************************

VM stands for Virtual Machine. Vm is a virtual computer that is running on top of another host computer.

- Virtualization is the process of creating software based or virtual-based computer with dedicated cpu, memory and storage that are borrowed from a physical host computer.
- Makes it possible that any OS can run on top of any other physical host machine.
- The VM is partitioned from the rest of the system, meaning it’s completely isolated and can’t interfere with the host computer’s primary OS.
- Virtualization is works with the concept of hypervisor.

******************************Why Use Linux ?******************************

some of the reasons to use linux  are :

- Low cost and very stable (No need to reboot even for years)
- Best computing power and inbuilt network support
- Fastest developing OS, with the most number of developers
- Most Secure OS
- Supports wide variety of hardware
- Supports wide variety of hardware
- Open Source Development model

**************************Linux Vs Unix**************************

![architecture](/Images/linux/Linux%20vs%20unix.png)
credits: TWN

| Comparision | Linux | Unix |
| --- | --- | --- |
| Definition | It is an open-source operating system which is freely available to everyone. | It is an operating system which can be only used by its copyrighters |
| Examples | It has different distros like Ubuntu, Redhat, Fedora, etc | IBM AIX, HP-UX and Sun Solaris. |
| Users | Nowadays, Linux is in great demand. Anyone can use Linux whether a home user, developer or a student | It was developed mainly for servers, workstations and mainframes |
| Usage | Linux is used everywhere from servers, PC, smartphones, tablets to mainframes and supercomputers. | It is used in servers, workstations and PCs |
| Cost | Linux is freely distributed, downloaded, and distributed through magazines also. And priced distros of Linux are also cheaper than Windows. | Unix copyright vendors decide different costs for their respective Unix Operating systems. |
| Development | As it is open source, it is developed by sharing and collaboration of codes by world-wide developers. | Unix was developed by AT&T Labs, various commercial vendors and nonprofit organizations. |
| Manufacturer | Linux kernel is developed by the community of developers from different parts of the world. Although the father of Linux, Linus Torvalds oversees things. | Unix has three distributions IBM AIX, HP-UX and Sun Solaris. Apple also uses Unix to make OSX operating system. |
| GUI | Linux is command based but some distros provide GUI based Linux. Gnome and KDE are mostly used GUI. | Initially it was command based OS, but later Common Desktop Environment was created. Most Unix distributions use Gnome |
| Interface | The default interface is BASH (Bourne Again SHell). But some distros have developed their own interfaces. | It originally used Bourne shell. But is also compatible with other GUIs |
| Coding | Linux is a Unix clone, behaves like Unix but doesn't contain its code. | Unix contain a completely different coding developed by AT&T Labs |
| Operating system | Linux is just the kernel. | Unix is a complete package of Operating system. |
| Security | It provides higher security. Linux has about 60-100 viruses listed till date. | Unix is also highly secured. It has about 85-120 viruses listed till date |
| Error detection and solution | As Linux is open-source, whenever a user post any kind of threat, developers from all over the world start working on it. And hence, it provides faster solution. | In Unix, users have to wait for some time for the problem to be resolved |

************************************Architecture of Unix :************************************

The architecture of Unix can be divided into 3 levels of functionality. 

The lowest is the ****************kernel,**************** which schedules tasks, manages resources, and controls security.

The next level is **************Shell,************** which acts as the user interface, interpreting user commands and starting applications.

The highest level is **************utilities************** which provides utility functions, in other words, it is the **********user********** level, as user is the one who operates those utilities.

![architecture](/Images/linux/Linux%20Architecture.png)


| Name | Description |
| --- | --- |
| / | This is the root of your filesystem, where everything begins. |
| /etc | This directory contains system configuration files. |
| /home | This is the default home directory for all users (except the root user). |
| /root | This is the home directory for the root user. |
| /dev | This is where your devices such as your hard disks, USB drives, and optical drives reside on your system. |
| /opt | This is where you can install additional 3rd party software. |
| /bin | This is where essential binaries (programs) reside on your system. |
| /sbin | This is where system binaries (programs) that are typically usedby the system administrator are stored. |
| /tmp | This is where temporary files are stored; they are usually deleted after a system reboot, so never store important files here! |
| /var | This directory contains files that may change in size, such as mail spools and log files. |
| /boot | All the files required for your system to boot are stored here. |
| /lib | This directory contains libraries needed by the essential binaries in the /bin and /sbin directories. A library is basically a set of precompiled functions that can be used by a program. |
| /proc | This is where information about running processes is stored. |
| /usr | This directory contains files and utilities that are shared between  users. |

File System Hierarchy

$ man hier —> To check more details about the file system.

Basic Commands

All linux commands must fall into one of the following four categories.

1. **********************************************An executable program :********************************************** which usually written in ****************************c programming**************************** language . EX : ******cp****** command is an example of an executable command.
2. **********************An alias :********************** which is basically another name for a command ( or a group of commands )
3. ************************************A shell built-in :************************************ The shell supports internal commands as well. The **********exit********** and ******cd****** command  are two examples of a shell built-in commands
4. ************************************A shell function :************************************ these are functions that help us achieve a specific task and are essential in writing shell scripts. 

**********Manual Instructions/Usage :**********

man —> to read more about a particular command cmd (old)

info —> Latest version of man

man -k /apropos —> List of man pages containing a string

type <cmd name> —> To know about the type of cmd

whatis <cmd name> —> Description of cmd

whereis <cmd> —> Location of manpage of cmd

Command Description

| Command | Description |
| --- | --- |
| cat >filename       | cat (concatenate) command is used to create a file and to display and modify the contents of a file |
| cat filename | To display the contents of the file |
| cat >> <filename> | To append the data in the already existing file |
| touch <filename> <filename2> <filename 3> | To create multiple files at a time using touch command |
| mkdir <directory name> | To create a  directory |
| mkdir -p <D1/{s1/{f1,f2…fn},d2/{f1,f2}} | To create multiple directories in a directory |
| tree / ls -R  | To check the tree structure |
| cp <source filename> <destination Filename> | To copy file from one directory to another. |
| cp -rvfp <dir Name> <dir Name> | To coying directories from on location to other . |
| mv <filename> <destination directory> | To move files from one location to other [cut and paste ] |
| mv <old Name> <new Name> | To Rename a file |
| rm filename or rm -f(without prompt) | To remove a file |
| rmdir <dirname> or rm -rf <dirname> | Remove an empty directory |
| ls | list the filenames |
| ls -l | long listing of the file |
| ls -l filename | to see the permissions of a particular file |
| ls -al | Shows the files in ascending order of modification |
| ls p* | all the files start with p |
| ls ?ample | files with any first character and has ample |
| ls -|d|* | directory listing only |
| ls -ld directory name | to see the permissions of a particular directory |
| ls [ae]* | first character of the filename must be a or e |
| ls [!ae]* | ! symbol complements the condition that follows. The characters must not be a or e |
| ls [a-m][c-z][4-9] | list all the files in specific range |
|  |  |
|  |  |
|  |  |

********************VIM Editor********************

vi is like notepad in windows.

It has 3 modes.

1. ********************Command mode******************** 

********************2. Insert Mode (edit Mode)******************** 

********************3. Extended command mode********************

- When you open the vi/vim editor , it will be in the command mode by default
- In the command mode the cursor’s can be used as h/l/k/j to move cursor left/right/up/down

********************Hint : Make use of vimtutor in terminal for learning more about vi/vim********************

******insert mode :******

******i —> to begin insert mode at the cursor position****** 

******I —>to insert at the beginning of the line******

******a —>To append to the next word’s letter******

******A —>To append at the end of the line.******

******o—> To insert a new line below the cursor position******

 ******O —> To insert a new line above the cursor position******

****************************command mode :****************************

gg —> To go to the beginning of the page

G —> To go to the end of the page

w —> to move the cursor forward, word by word

b —> To move the cursor backward, word by word

nw —> to move the cursor forward to n words (5w)

nb —> To move the cursor backward to n words (5B)

u —> To undo last change (word)

U —> To undo the previous changes (entire line)

ctrl+R —> to redo the changes

yy —> to copy a file

nyy —> to copy n lines (5yy or 4yy)

P —> to paste line below the cursor position

p —> to paste line above the cursor position

dw —> to delete the word letter by letter (like backspace)

x —> to delete the word letter by letter (like DEL key)

dd —> to delete entire line

ndd —> To delete n no.of lines from cursor position (5dd)

/ —> To search for a word in a file

********************************************Extended mode(colon Mode)********************************************

Esc+:w —>To Save the changes
Esc+:q—> To quit (Without saving)
Esc+:wq—> To save and quit
Esc+:w! —>To save forcefully
Esc+wq! —>To save and quit forcefully
Esc+:x —>To save and quit
Esc+:X —>To give password to the file and remove password
Esc+:20(n) —>To go to line no 20 or n
Esc+: se nu—> To set the line numbers to the file
Esc+:se nonu —>To Remove the set line numbers

vim -o file1 file2 —> To open multiple files in vim editor

ctrl +w —> To switch between files.

****************************Types of files :****************************

‘-’ —> Normal file

d —>directory

l —>link file (shortcut)

b —>block file(Harddisk, floppy disk)

c —>character file(Keyboard, Mouse)

**********symbolic link**********

There are two types of links : 

| Softlink | Hard link |
| --- | --- |
| size of link file is equal to no.of characters in the name of the original file | size of both files is same |
| can be created across the partition | can’t be created across the partition |
| Inode no.of source and link file is different | Inode no.of both file is same |
| If original file is deleted, link is broken and data is lost | If original file is deleted then also link will contain data |
| Shortcut file | Backup file |
| ln -s <source file> <destination> | ln <source file> <destination> |


![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/96e3a38c-6a18-4aed-8c41-fd02eb8d7ede)

![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/71de6a4a-214f-4b14-bc3f-95d560daa88c)


![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/7a73ba41-4bfe-425e-9aae-7b9acbbe3a41)

![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/700bcf90-7c84-41e2-8788-6ef91b0a0e6e)


************************************************************************Regular expression, Pipelines & I/O Redirections************************************************************************

**Grep :**

- grep stands for ******************************************************************global regular expression print.****************************************************************** it is used to pick out the required expression from the file and print the output.

EX: grep root /etc/passwd —> To get information about the root from the list of users in the system

grep -i <Target word> <source file> —> to get Target word from the source file

grep -nA2 wheel /etc/group —> to display a word and 2 lines after the word

grep -nB2 wheel /etc/group —> to display a word and 2 lines before the word

grep -v <target word> <source file> —> to display the things except the given word

grep —color root /etc/passwd —> to display the searched word in color.

cat <filename> | grep -i kernel ( pipe | is used to combine the commands )

ls -l | grep -i <filename>

**************Filter commands**************

- filter commands are used to filter the output so that the required things can easily be picked up.

EX: **************************************************************************less, more, head, tail, sort, cut, sed**************************************************************************

sed stands for ****************************stream editor,**************************** which is used to search a word in the file and replace it with the word required to be in the output.

**************Note :************** It will only modify the output, but there will be no change in the original file

sed ‘s/searchfor/replacewith/g’ filename

**I/O Redirection :**

Redirection is a process where we can copy the output of any command(s), file(s) into a new file. There are 2 ways of redirecting the output into a file.

using > or >> ******************filename****************** after the command, and using **********************tee command**********************

syntax : command > new file

**************Note :************** If the given name of the file is not available in a new file will be created automatically. If the file already exists then it will overwrite contents of that file.

syntax : cat <filename> | tee <new filename> —> to redirect the output to new file but it will also display the output.

syntax : cat filename | tee -a filename2 —> appending data in the same file using the tee command.

******************************Find command :******************************

**********find********** command is used to find the files or directory’s path.

syntax : find / (under root) -option fileName

option

| option | usage |
| --- | --- |
| -name | for searching a file with its name |
| -inum | For searching a file with particular inode number |
| -type | for searching a particular type of file |
| -user | for files whose owner is a particular user |
| -group | For files belonging to particular group |

find / -name <searchingName> —>finding a file with name

 find / -inum 5964 —> finding a file with inode number

find / -user <username> —> to find the files with username

find / -group <groupname> —> to find the files with groupname

**********File Permissions :**********

permissions are applied on three levels :

- owner or user level
- Group level
- Others level

Access modes are of three types ;

- r readonly
- w write/edit/delete/append
- x execute/run a command

Access modes are different on the file and directory ;

| Permissions | Files | Directory |
| --- | --- | --- |
| r | Open the file | ls the contents of
  dir |
| w | Write, edit,
  append, delete file | Add/del/rename
  contents of dir |
| x | To run a
  command/shell script | To enter into dir
  using 'cd' |

The permissions can be set on any file/dir by two methods :

1. ******************************************symbolic method (ugo)******************************************
2. **************************************************Absolute method (numbers)**************************************************

1. symbolic method :

- symbolic mode : General form of symbolic mode is :
    - chmod [who] [+/-/=][permissions] file
        - who —> To whom the permissions to be assigned
            
            ******************************************************************user/owner (u);group(g);others(o)******************************************************************
            
            EX: chmod u=rwx,g=rw,o=r <filename>
            
1. Absolute Method (numbers)
    
    In absolute method we use numbers instead of using symbols i.e;
    
    read=4
    
    write=2
    
    execute=1
    

******umask :******

- When we create any file using touch, cat or vi commands they get created with default file permissions as stored in ******************umask(user file creation mask)******************
- umask is a 4 digit octal number which tells unix which of the three permissions are to be denied rather than granted.
- umask will decide that what should be the default permissions for a file and directory when it is created.

umask —>to find the default umask value

0022 is the default umask value.

****************************calculation of default permissions for file and directory, based upon the umask value:****************************

Note : for a file by default it cannot have the execute permission, so the maximum permission for a file at the time of creation can be ************666************ whereas a directory can have full permissions i.e; ******777******

- Modifying the default umask value :
    - $ umask 002

Managing File system and partition

**************************************what is partition ?**************************************

partitioning is a means to divide a single hard drive into many logical drives. A partition is a contiguous set of blocks on a drive that are treated as an independent disk. 

A partition table is an index that relates sections of the hard drive to partitions.

************************************************************why have multiple partitions ?************************************************************

********************************************************************************************************************************************Encapsulate your data********************************************************************************************************************************************  since file system corruption is local to partition, you stand to lose only some of your data if an accident occurs

********************************************************************************************************************************************Increase disk space efficiency******************************************************************************************************************************************** you can format partitions with varying block sizes, depending on your usage. If your data is in a larger number of small files (less than 1k) and your partition uses 4k sized blocks, you are wasting 3k for every file. In general, you waste on average one half of a block for every file, so matching block size to the average size of your files is important if you have many files.

********************************************************************************************************************************************Limit data growth******************************************************************************************************************************************** runaway processes or maniacal users can consume so much disk space that the operating system no longer has room on the hard drive for its book keeping operations. This will lead to disaster. By segregating space, you ensure that things other than the operating system die when allocated disk space is exhausted.

**************************************************Disk Partition criteria :**************************************************

********************************MBR = Master boot record********************************

****************************************P = Primary partition****************************************

**********************************************************Extended = Extended partition**********************************************************

**********************************L = logical partition**********************************

**********************************Free = free space**********************************

![Logical Volume](Images/linux/Disk-partition.png)

The structure of disk partition :

- on the disk where o/s is installed, will have the first partition as ******MBR******
- **********MBR********** is a master boot record, which contains two important utilities, ********************************************************************************************************************************IPL(initial program loader) and PTI(partition table information)********************************************************************************************************************************
- IPL is responsible for booting the operating system, because it contains the **********************boot loader**********************
- ********PTI******** (partition table information) is the information about the number of partitions on the disk, sizes of the partition and types of partitions.

****************************************************************The criteria of disk partitioning :****************************************************************

- Every disk can have only 3 primary partitions
- ************************************primary partition************************************ is a partition which usually holds the ******************************************operating system.****************************************** only **********one**********  amongst the 3 primary partitions can be active which will be booted by **********MBR********** to load the operating system
- **************************************Extended partition************************************** is a special type of primary partition which can be sub divided into multiple logical partitions. As there can be only 3 primary partitions per disk, and if the user is required to make further partitions then all the space remaining on the disk should be allocated to extended partition, which can be used to create the logical partitions later, There can be only ********one extended partition******** per disk
- **************logical partitions************** are the partitions which are created under extended partition, all the space in the extended partition can be used to create any number of logical partitions.

******************************************disk identification :******************************************

- Different types of disks will be having different initials in linux
    - IDE drive will be shown as /dev/hda
    - SCSI drive will be shown as /dev/sda
    - Virtual drive will be shown as /dev/vda

**************************File System :**************************

- It is the method of storing the data in an organized fashion on the disk . Every partition on the disk except ******************************************************************************MBR and Extended partition****************************************************************************** should be assigned with some file system in order to make them store the data . Filesystem is applied on the partition by formatting it with a particular type of file system.
- The file systems supported in linux are ext2,ext3 and in rhel ext4, vfat etc

********************Mounting :********************

- Attaching a directory to the file system in order to access the partition and its file system is known as ****************mounting****************
- The mount point is the directory (usually an empty one) in the currently accessible file system to which a additional file system is mounted.
- The /mnt directory exists by default on all unix-like systems. It, or usually its subdirectories (such as /mnt/floppy and /mnt/usb) are intended specifically for use as mount points for removable media such as CDROMs, USB key drives and floppy disks.

********************************Files which is related to mounting in linux :********************************

- **************************/etc/mtab************************** is a file which stores the information of all the currently mounted file systems, it is dynamic and keeps changing
- **********************/etc/fstab********************** is the file which is keeps information about the permanent mount point. If you want to make your mount point permanent, so that it will be mounted even after reboot, then you need to make an appropriate entry in this file.

fdisk -l or parted -l —> To view the existing partitions

fdisk <diskname> —> To enter disk utility for partition administration

fdisk <diskname> —> n —> to create a new partition

fdisk <diskname> →p—> to view partition

fdisk <diskname> →d—>To delete partition

w → to save partition

q —> To quit from the partition

partprobe <diskname> or partx <disk name>  —> Update partition table without restarting the system

mkfs.<filesystem type> <partition name> —> To assign some file system to it so that we can start storing the data into it.

******Mounting a partition :******

- Mounting is a procedure where we attach a  directory to the file system. There are two types of mounting which will be used in linux or any UNIX.
    - ************************************Temporary Mounting************************************
    - **************************************Permanent Mounting**************************************
    
    Temporary Mounting :
    
    - In a temporary mount point we will create a directory and mount it, but this mount point will last only till the system up, once it is rebooted the mounting will be lost.

syntax :

mount <device name> <directory name (mount point)>

mount —> To view all mounted partitions

umount <mount point directory> —> Unmounting a partition

Permanent Mounting :

- permanent mounting procedure is exactly same like temp mounting, but here we will update the /etc/fstab file with the mounting details, so that it will be mounted even after the system is reboot.

**********************Steps to make a permanent mount point :**********************

- Make  a directory or use an existing directory
- add entry in **/etc/fstab** file
- use **mount -a** command to check it is mounting .

******Note: sometimes a directory reflects error while unmounting, the possible causes for it are******

- you are in the same directory and trying to unmount it. Check with **********pwd********** command
- some users are present in the directory and using the contents in it.
- check with ********************************fuser -cu <disk name>********************************
- check for the files which are open with ************lsof <diskname>************
- kill the open connections using ********************************fuser -ck <disk folder/filename>********************************
- Now you can use **********umount********** command to unmount the file system

df -h —> to view the usage information of mounted partition

du -h <file/directory Name> —> to view the size of a file or directory

e2label —→ to assign a label to the partition

e2label <partition name><label>—> To check the label

mounted -l —> To list all the mounted partition along with their labels

blkid <disk name> —> To check the uuid of a partition

**************creating swap partition :**************

- swap space in linux is used when the amount of physical memory (RAM) is full.
- if the system needs more memory resources and the RAM is full, inactive pages in memory are moved to the swap space.
- While swap space can help machines with a small amount of RAM, it should not be considered a replacement for more RAM.
- Swap space is located on hard drives, which have a slower access time than physical memory.

If the size of RAM is **************************************************less than or equal to 2GB************************************************** then size of ******************************SWAP=2*RAM SiZE******************************

if the size of RAM is **************************more than************************** 2GB, then size of ******************SWAP=2GB+size of RAM******************

****************************************commands to be used in maintaining swap spaces****************************************

free -m —> To see the memory size and swap space size

swapon -s —> To see the swap usage use

mkswap <partition name> —> To format the partition with swap file system use

swapon <partition name> —> To activate the swap space use

swapoff <partition name> —> To deactivate the swap space use

**Encrypting a Partition using LUKS (Linux Unified Key Setup):**
> LUKS is a standard format for device encryption.
> LUKS ensures the data protection inside the partition, especially against the data breach.
> It encrypts the partition or volume, which will decrypt only by providing correct password.
> The partition must be decrypted before the file system in it can be mounted.
> Once it is open (decrypted), you can work with the partition normally i.e. mounting and adding the data to the partition.
> After the completion of work the partition has to be closed i.e. encrypted, so that it cannot be mounted nor can be accessible by others, unless you lose password.
**Commands used in LUKS encryption:**
>> cryptsetup luksFormat: To Format the partition with encryption, and assigning the
password.
>> cryptsetup luksOpen: To open or decrypt the partition. (password will be required) and
the you need to assign some name to it, which will be used for further operation as
/dev/mapper/name.
>> crypsetup luksClose: To Close or encrypt back the partition after use.
>> cryptsetup luksAddKey: To add the key (password) to the configuration to automatically
decrypting the partition.
Steps to Encrypt the Partition:

1. Create a normal partition using fdisk.
2. Format the partition using luks and assign the passphrase.
3. Decrypt the partition.
4. Now format again using normal ext4 formatting.
5. Mount the partition, Make a permanent mount.
6. Access the partition and add the data
7. Unmount the partition, and close the partition i.e. encrypt back

Logical Volume Management

- The linux logical volume manager (LVM) is a mechanism to virtualize disks. It can create “virtual” disk partitions out of one or more physical hard drives, allowing you to grow, shrink, or move those partitions from drive to drive as your needs change.
- It allows you to create larger partitions than you could achieve with a single drive.
- LVM can also be convenient ways to gain redundancy without sacrificing flexibility

![LVM](/Images/linux/LVM.png)

Above picture shows the structure of LVM. LVM consists of **************************************************************************************************************************************************physical volume, volume group, logical volumes and finally file systems.************************************************************************************************************************************************** 

The physical partitions are known as ********************************physical extents (PE)******************************** and logical partitions are known as **************************************logical Extents (LE)**************************************

********Components of LVM in linux :********

******************************************Physical volumes (pv)****************************************** 

******************************************Physical extent (PE)******************************************

 ******************************************volume group(VG)******************************************

******************************************logical volume (LV)******************************************

******************************************logical extent(LE)******************************************

Physical Volume (PV) : It is the standard primary or logical partition with the hex code ****8e****

physical Extent (PE) : It is the chunk of disk space. Every PV is divided into a number of equal sized PEs.

volume group (VG): it is composed of a group of PV’s and LV’s. It is organizational group of LVM.

Logical Volume(LV) : It is composed of a group of LEs. You can format and mount any file system on an LV. The size of these LV’s can easily be increased or decreased as per the requirement.

Logical extent (LE): It is also a chunk of disk space. every LE is mapped to specific PE.

| LVM command | Function |
| --- | --- |
| pvs | displays all the physical volumes |
| vgs | Displays all volume groups in the system |
| lvs | Displays all the logical volumes in the system |
| pvdisplay | displays detailed information on physical volumes |
| vgdisplay | displays detailed information on volume groups |
| lvdisplay | displays detailed information on logical volumes |
| pvcreate | create a new physical volume |
| vgcreate | create a new volume group |
| lvcreate | creates a new logical volume |
| vgextend | add a new physical disk to a volume group |
| lvextend | extends a logical volume |
| lvresize | resizes a logical volume |
| lvreduce | reduces a logical volume |
| pvmove | moves/migrates data from one physical volume to another |
| vgreduce | reduces a volume group by removing a pv from it |
| pvremove | Deletes a physical volume |
| vgremove | Removes/deletes a volume group |
| lvremove | Removes/deletes a logical volume |
1. create physical volume

pvs or pvdisplay —> to verify /list physical volume 

pvcreate <partion name> —> to create a physical volume

1. create a volume group
    
    vgcreate <name for the VG> <partition name> —> to create a logical volume
    
    vgs / vgsdisplay <vgname> —> To verify volume group
    
2. Logical Volume Creation
    
    lvcreate -L <size of LV> -n <name for LV><VG Name> —> to create logical volume
    
    lvs / lvsdisplay —> to list lvs in the disk
    
    lvdisplay <VG Name> —> to display the LVs of a particular ************************Volume Group************************
    
3. Adding file system to the LV and Mounting it
    
    mkfs.<filesystem> <lv path> —> to add file system to lv
    
    mount </dev/vgname/lvname> /directory name —> to mount
    
    mount —> To verify mounting
    
    /etc/fstab —> to make the mount permanent
    
4. Extend a volume group
    
    vgextend <vgname><partitionname> —> to extend the volume group
    
    Extending a volume group is actually adding a new PV to the volume group
    
    pvs —> To verity the physical volume
    
5. Increasing the size of a logical volume
    
    **The size of lvm can be increased . No downtime required.**
    
    df -h —> To check the current current size of LV
    
    lvextend -L <+addition size> </dev/vg/lv name> —> to extend the logical volume
    
    resize2fs /dev/vg/lv name —> to update the filesystem
    
    1. ******************************************Reducing the size of LV******************************************
    - Reducing the size of an LV is a bit complicated task. LV size cannot be reduced online, It requires downtime i.e; unmounting the file system.
    
    df -h —> To check the size of the lv
    
    unmount —>unmount the LV
    
    e2fsck -f <lvpath> —> Organize the data in LV
    
    resize2fs <lv path> <total size of LV after reduction> —> Update the file system .
    
    lvreduce -L -<size to be reduced> <lv path> —> To reduce the size
    
    ****************************************************************************************Moving or migrating the LV(data) from one PV to another****************************************************************************************
    
    - There might be situations where the ******pv****** might be failing and it is required to be replaced, in such case, we need to migrate or move the data from such **********pv********** to other and isolate the ****pv****
    
    **************************************************************The steps to migrate the PV are**************************************************************
    
    - Access the mount point for failing ******pv****** and check the data in it [cd /ktdir/]
    - verify the size of the ************pv************ by ********pvs******** command or ********************pvdisplay******************** command [pvs]
    - unmount the filesystem on that ****pv [umount /ktdir]****
    - add new **********pv,********** which should be of the same size or higher than that of the replacing ******pv****** to the volume group
    - migrate the ********pv s content******** to the new ******pv****** using ************************************************pvmove <old pv> <new pv>************************************************
    - mount back the ********lv,******** access the mount point and verify the data in it.
    - remove the faulty ****pv**** from volume group. [vgreduce <vgname> <pvname>]
    
    **************Deleting/Removing an LV :**************
    
    to delete/Remove an LV, first unmount the file system
    
    Remove the entry from ********/etc/fstab********
    
    use the command ****************************************************************lvremove i.e; lvremove <LV name>****************************************************************
    
    **************lvremove <lvname>**************
    
    lvdisplay —> to verify the logical volume
    
    **************************************************Deleting a volume group :**************************************************
    
    - To delete the volume group, make sure that if there is any LV  in it, it should not be mounted. Because Removing vg will also remove LV’s inside it.
    
    vgremove <vgname> —> To delete a volume group
    
    **************************Deleting a physical volume :**************************
    
    pvremove <pv name> —> To delete pv
    
    pvremove /dev/sda{6,7} —> To remove multiple Pvs in one command.
    
    ******************creating VG by specifying PE size******************
    
    - To create VG with specifying PE Size
    - first create a partition and also create PV
    - vgcreate <name of the vg> -s<size of PE(1-128)><pv names>
    - verify PE size using ********************vgdisplay******************** command
    
    To create LV using LE, the things to keep in mind are 
    
    ******size of LE=size of PE******
    
    in command we are specifying the no.of LE not the size of LE, as the size of LE is based on size of PE.
    
    ******************************************************************steps to create an LV based on LE******************************************************************
    
    - check the size of PE using vgdisplay command
    - The formula for calculating no.of LE is <size of LV requried, in MB> divided by Size of PE 400/16 =25
    - if the size of LV is to be 2 GB then first we need to convert GB into MB and then calculate 2*1024/16 =128
    - You can use ******bc****** command to do all the calculations. use **********************************ctrl+d or ctrl+c********************************** to quit the calculator.
    - The syntax to create an LV with no.of LE is
    
    lvcreate -l <no.of LE> -n <name of the LV><volume group name>
    
    lvdisplay <lvname>
    

User and Group Administration

****************User Administration****************

- In linux/unix user is the one who uses the system. There can be at least one or more than one users in linux at a time.users on the system are identified by a username and a userid.

********************************************************************Some important Points related to users :********************************************************************

- users and groups are used to control access to files and resources
- Users login to the system by supplying their username and password.
- Every file on the system is owned by a user and associated with a group
- Every user of the system is assigned a unique user ID number (the UID)
- User’s name and UID are stored in **/etc/passwd**
- user’s password is stored in **/etc/shadow** in encrypted form
- user’s are assigned ******************************home directory****************************** and a program that is run when they login
- Users cannot read, write or execute each other’s files without permission.

****************Types of users  in linux and their attributes****************

| Type | Example | userid | Group id | Home Directory | Shell |
| --- | --- | --- | --- | --- | --- |
| super user | Root | 0 | 0 | /root | /bin/bash |
| system user | ftp,ssh,apache | 1 to 499 | 1 to 499 | /var/ftp,etc | /sbin/nologin |
| Normal user | Visitor, ktuser, etc | 500 to 60000 | 500 to 60000 | /home/user name | /bin/bash |
1. ****************************************************super user or root user :**************************************************** super user or the root user is the most powerful user. He is the administrator user.
2. ********************System User :******************** system users are the users created by the softwares or applications. EX: if we create apache it will create a user apache. These kinds of users are known as system users.
3. **********************************Normal User :********************************** Normal users are the users created by root user. They are normal users like charan, mahi etc. Only the root user has the permissions to create or remove a user.

********Whenever  a user is created in linux then the following things were done by default :********

- a home directory is created (/home/username)
- A mail box is created(/var/spool/mail)
- unique UID&GID are given to user

Linux uses UPG(user private Group) means whenever a user is created it has its own private group.

(![Active FTP](Images/linux/ActiveFTP.png))

(![passive FTP](Images/linux/PassiveFTP.png))

**********************************Creating a user :**********************************

useradd <option> <username>

-u userid

-G secondary group id

-g primary group id

-d home directory

-c comment

-s shell

passwd <username> —> To assign a password

passwd —> To assign password to the default user

******************************Modify the user’s attributes:******************************

usermod <options> <username>

-l —> To change login name

-L —> To lock account

-U —> To unlock account

************************************************************Note : when a account is locked it will show ! in /etc/shadow file************************************************************

To view advanced paramters of the user, use

chage -l <username>

****last password change:**** when the password was change last time

****password expires :**** password expiry date

****password inactive :**** after password expiry grace period before the account gets locked

****Account expires :**** date on which the account expires

****Minimum number of days b/w password change :**** once the password is changed, it cannot changed until a min period of specified date. [0] means never

****max number of days b/w password change :**** after changing the password how long it will be valid for

****Number of days of warning before password expires:**** start of warnings to change the password, no. of days before the password expires

**************Changing the password parameters can be done in two ways :**************

1. chage <user name>
2. chage <option> <value><username>

options :

-m for min password age

-M for max password age

-d for last time the password is changed

-W password expiration warnings

-I password inactive [-1 means inactive]

-E A/C expiration date

userdel <username> —> To delete a user without deleting  home directory

userdel -r <username> —> to delete a user with home directory

****************************************Group Administration****************************************

- Users are assigned to groups with unique group ID numbers (the GID)
- The group name and GID are stored in /etc/group
- Each user is given their own private group
- They can also be added to their groups to gain additional access
- All users in a group can share files that belong to the group
Each user is a member of at least one group, called a **primary group**. In addition, a user can be a
member of an unlimited number of **secondary groups**
- A user’s primary group is defined in the ************************/etc/passwd************************ file and secondary groups are defined in the **/etc/group** file
- The primary group is important because files created by this user will inherit that group affiliation

groupadd <name of the group> —> To create a group 

groupadd <option><name of the group> —> To create a group with user specified group id

groupmod <option><arguments><groupname> —> to modify the properties of group

-g to change the group id

-o to override the previous assigned id, if it matches with new one

-n to change the group name

usermod -G <groupname><username> —> to add single user to the group

gpasswd <option><arguments><groupname> —> to add multiple single or multiple users to the group with various attributes

options:

-M for adding multiple users to a group

-A For adding a group Administrator

-a for adding a single user to a group

-d for removing a user from a group

system-config-users&—> To add and remove groups we can also use the graphical tool in linux.

******************************************************Controlling Access to files******************************************************

1. **************************************************************************************Special permissions or Advanced Permissions**************************************************************************************
2. ************************************************Access Control List(ACL)************************************************

There are 3 special permissions that can be assigned to a file or directory apart from basic file permissions(rwx), they are

********************************************************************************************suid -Set user id******************************************************************************************** 

********************************************************************************************SGID -set groupid******************************************************************************************** 

********************************************************************************************Sticky bit********************************************************************************************

| permission | Symbolic Form | Numeric Form | Syntax |
| --- | --- | --- | --- |
| SETUID | s or S | 4  | chmod u+s or chmod 4766 |
| SETGID | s or S | 2 | chmod g+s or chmod 2766 |
| stickybit | t or T | 1 | chmod o+t or chmod 1766 |

****************************************************Access Control List (ACL):****************************************************

- Define more fine-grained discretionary rights for files and directories
- ACL can be applied on ACL enabled partition that means you need to enable ACL while mounting the partition

********************************************Steps to implement ACL********************************************

- create a partition and format it with ext4 file system
- Mount a file system with ACL [mount -o acl [diskname] [directory] & mount -o remount <diskname>]
- Apply ACL on it.

getfacl <option><dir/filename> —>To check the acl permission

-d —>displays default ACL

-R —> Recurses into subdirectories

setfacl <option><argument><file or directory name> —> To apply acl

options:

-m modifies an ACL

-x Removes an ACL

-R recurses into subdirectories

The possible arguments are :

u: user

g: group

o:others

EX: To assign ************************************read and execute************************************ permission to a particular user the syntax could be

setfacl -m u: <username>: <permissions> <file or dir name>

getfacl <directory> —> to verity acl

setfacl -m u:<username>:rx,g:<groupname>:pwermissions<directory name> —> To assign permissions to user and group at a time

setfacl -x u:<username> <dirname> —> to remove acl for a particular user

setfacl -b <dirname> —> to remove all ACL permissions from a file or directory

Network Configuration and Troubleshooting

**************************Networking :************************** It is a connection between two or more machines to communicate with eachother.

**************************************************************************************The basic requirements for networking are :**************************************************************************************

1. NIC(Network interface Controller or Card)
2. Media
3. Topology
4. Protocol
5. IP address

| TCP/IP | UDP |
| --- | --- |
| Transmission Control Protocol | User Datagram Protocol |
| It is connection oriented | It is connectionless |
| Reliable | Non-Reliable |
| TCP Acknowledgement will be sent/received | No Acknowledgement for UDP |
| slow communication | Faster Communication |
| Protocol number for TCP is 6 | Protocol number for UDP is 17 |
| Http, FTP, SMTP uses TCP | DNS, DHCP uses UDP |

some important aspect of IP Address which is 

- IP Address classes
- Subnet Mask
- Gateway

****************************************IP Address Classes :****************************************

| class | Start | End | Default Subnet mask | CIDR |
| --- | --- | --- | --- | --- |
| class A | 0.0.0.0 | 127.255.255.255 | 255.0.0.0 | /8 |
| class B | 128.0.0.0 | 191.255.255.255 | 255.255.255.0 | /16 |
| class C | 192.0.0.0 | 223.255.255.255 | 255.255.255.0 | /24 |
| class D(multicast) | 224.0.0.0 | 239.255.255.255 |  |  |
| class E(reserved) | 240.0.0.0 | 255.255.255.255 |  |  |

CIDR -classless Inter-Domain Routing

127.0.0.0 to 127.255.255.255 is reserved for loopback address

→ A special IP number (127.0.0.1) that is designed for the software loopback interface of a machine. 127.0.0.0 through 127.255.255.255  is also reserved for loopback and is used for internal testing on local machines.

**********************Multicast :**********************

- Multicasting allows a single message to be sent to a group of recipients. ******************************************************************Emailing and teleconferencing****************************************************************** are examples of multicasting.
- It uses the network infrastructure and standards to send messages.

**************************subnet Mask :**************************

- A subnet mask allows users to identify which part of an IP address is reserved for the network and which part is available for host use.
- By looking at the IP address alone, especially now with classless inter domain routing, users cannot tell which part of the address is which .
- Adding the subnet mask or netmask gives users all the information needed to calculate network and host portion of the address with ease.

A commonly used netmask is a 24-bit netmask as given below:

| Netmask | 255. | 255. | 255. | 0. |
| --- | --- | --- | --- | --- |
| Binary | 11111111 | 11111111 | 11111111 | 00000000 |
| Netmask length | 8 | 16 | 24 | 0 |

**************Gateway**************

- a gateway is a network point that provides entrance into another network.
- On the internet, a node or stopping point can be either a gateway node or host (end-point) node.
- Both the computers of Internet users and the computers that serve pages to users are host nodes.
- The computers that control traffic within your company’s network or at your local internet service provider (ISP) are gateway nodes.

/etc/sysconfig/network-scripts —> is the directory which keeps the configuration of network devices connected to the system.

/etc/sysconfig/network —> is a file which keeps information about the hostname assigned to the system. If you wanted to change hostname permanantly then you need to change the hostname in this file.

/etc/hosts —> A file which is responsible for resolving hostname into IP locally, In other words, it acts as local DNS server is not accessible.

/etc/resolv.conf —> Is a file which keeps the address of DNS server to which the clients will be accessing to resolve IP to hostname and hostname to IP

ifconfig —> To assign ip address to all the interfaces

ifconfig <adapter name> —> To check the ip of a particular interface

hostname —> To check the host name of the system

hostname -i —> To check the Ip of the host

host <ip address> —> To check whether dns is resolving or not

nslookup <ip address>

nslookup <hostname> —> To check whether dns is resolving or not

dig <hostname> —> To check DNS function

dig -x <ip address> —> with IP address

ping <ip address> —> To check network connectivity 

ping -c <counts> <ip address> —> To limit the pinging for specific number of counts.

hostname <new name> —> to change the hostname

************Assigning / changing IP address :************

setup/system-config-network 

service network restart —> To restart the network

service NetworkManager restart 

ethtool <adapter name> —> To know more about NIC card/adapter use

Managing Selinux 

Boot Procedure and Kernel Parameters

Press the power button on your system, and after few moments you see the linux login prompt.

(![Boot process ](/Images/linux/BootProcess.png))

1. ********BIOS********
    - BIOS stands for Basic Input/Output system
    - Performs some system integrity checks
    - Searches, loads, and executes the boot loader program.
    - It looks for boot loader in floppy, cd-rom, or harddrive. You can press a key (F12 or F2) during the BIOS startup to change the boot sequence.
    - Once the boot loader program is detected and loaded into the memory, BIOS gives the control to it.
    - So, in simple terms BIOS loads and executes the MBR boot loader
2. ********MBR******** 
    - MBR stands for Master Boot Record
    - It is located at the first sector of the bootable disk . Typically /dev/hda or /dev/sda
    - MBR is less than 512 bytes in size. This has three components 1. Primary boot loader in 1st 446 bytes 2. partition table info in next 64 bytes 3. MBR validation check in last 2 bytes.
    - It contains information about GRUB
    - So, In simple terms MBR loads and executes the GRUB boot loader
3. **GRUB**
    - GRUB stands for Grand Unified Bootloader
    - if you have multiple kernel images installed on your system, you can choose which one to be executed.
    - GRUB has the knowledge of the file system
    - GRUB configuration file is /boot/grub/grub.conf
    - So, In simple terms GRUB just loads and executes Kernel and initrd images.
4. ************Kernel************
    - Mounts the root file system as specified in the “root=”in grub.conf
    - Kernel executes the /sbin/init program
    - initrd stands for Initial RAM Disk
    - Initrd is used by kernel as temporary root file system until kernel is booted and the real root file system is mounted. It also contains necessary drivers compiled inside, which helps it to access the hard drive partitions, and other hardware.
5. ****Init****
    - looks at the /etc/inittab file to decide the linux run level
    - Following are the available run levels
        - 0 - halt
        - 1 - single user mode
        - 2 - multiuser, without NFS
        - 3 - Full multiuser mode
        - 4 - Unused
        - 5 - X11
        - 6 - reboot
    - init identifies the default initlevel from /etc/inittab and uses that to load all appropriate program.
    - Execute ‘grep initdefault /etc/inittab’ on your system to identify the default run level
    
    6.**********************************Runlevel Programs**********************************
    
    - When the Linux system is booting up, you might see various services getting started. For
    example, it might say “starting sendmail …. OK”. Those are the run level programs,
    executed from the run level directory as defined by your run level.

who -r —> To check default run level in linux

vi /etc/inittab —> To change the default run level to some other.

init 6 —> To reboot the system

startx —> To start the Graphical Interface

uname -r —> To see the details regarding the kernel is installed

uname -a —> to see the same thing with more details

arch / uname -m —> To see the architecture of O/S 

cat /etc/os-release —> to check the version of the OS

Job Automation

**********************************************************Automation with cron and at :**********************************************************

- In any OS, it is possible to create jobs that you want to reoccur. This process, known as ************************************Job Scheduling************************************ is usually done based on user-defined jobs.
- For red hat/any other linux, this process is handled by a  cron service or daemon called ************crond.************

****************************************************************************Important files related to cron and at****************************************************************************

- /etc/crontab is the file which stores all scheduled jobs
- /etc/cron.deny is the file used to restrict the users from using cron jobs
- /etc/cron.allow is used to allow only users whose names are mentioned in this file to use cron jobs
- /etc/at.deny same as cron.deny for restricting at jobs
- /etc/at.allow same as cron.allow for allowing user to use at jobs

**************************crontab format :**************************

![Crontab ](/Images/linux/Crontab.png)

| Options | Explanation |
| --- | --- |
| * | Is treated as wildcard, Meaning any possible value |
| */5 | Is treated as every 5 minutes, hours, days, or months. Replacing 5 with another numerical value will change this option |
| 2,4,6 | Treated as an OR, so if placed in the hours, this could mean at 2,4, 6 o-clock |
| 9-17 | Treats for any value between 9 and 17. So if placed in day of month this would be days 9 through 17. Or if you put in hours it would be between 9 and 5 |

C************************rontab Commands************************

| command | Explanation |
| --- | --- |
| crontab -e | Edit your crontab file, or create if it doesn’t already exist |
| crontab -l | Displays your crontab file |
| crontab -r | Remove your crontab file |
| crontab -u | if combined with -e , edit a particular user’s crontab file and if combined with -l display a particular user’s crontab file.If combined with -r , delete user’s crontab file |

**************************setting a job to display the current date for every minute on present console**************************

tty —> to check the present console address

crontab -e —> To edit the crontab 

EX: */1 * * * * date > <tty value> 

Here * means every possible value.

service crond restart —> To restart the cron services

************TIP :************ To see the man pages on cron jobs use ****************************************#man 4 crontabs**************************************** command

**At jobs :**

- ************“at”************ is used to schedule a job for a particular time or interval, in otherwords it is used only for one time or only for one interval

****************************************The disadvantages of at jobs are****************************************

- It can be modified like cron jobs
- It cannot be reused
- the contents can be viewed in normal human readable format

****************************************TIP :**************************************** see man pages “man at” for more on at jobs and formats

at -l or atq —> to check the list of at jobs

at -c <job id> —> To check what is scheduled

atrm <job id> —> To remove job

****************************************Important point to Note :****************************************

- To restrict a user from using at jobs it is exactly same like cron job
- Add user names to ****************************************/etc/at.deny,**************************************** it will work exactly like ****************************************/etc/cron.deny****************************************
- if both ****************************************at.allow**************************************** and ****************************************at.deny**************************************** exists, then ****************************************at.allow**************************************** will have higher priority
- If neither at.allow nor at.deny exists, then only root can use at jobs.

 ********************************************************************************

Administrating Remote System

************************************************Remote Shell using SSH :************************************************

**************************What is SSH ?**************************

- There are couple of ways that we can access a shell (command line) remotely on most linux/unix systems. One of the older ways to use the telnet program, which is available on most network capable operating systems.
- Accessing a shell account through the telnet method though poses  a danger in that everything that you send or receive over that telnet session is visible in plain text on your local network, and the local network of the machine you are connecting to.
- ************************SSH,************************ which is acronym for secure shell, was designed and created to provide the best security when accessing another computer remotely. Not only it encrypts the session, it also provides better authentication facilities.

(![SSH ](Images/linux/SSH.png))

ssh configuration file is ********/etc/ssh/sshd_config********

ssh daemon or service is ********sshd********

ssh <ip address/hostname of remote machine> —> To Access remote machine using ssh

**********************************************************************password-less login using SSH Keys :**********************************************************************

- SSH keys are implementation of public-key cryptography. They solve the problem of brute-force password attacks by making computationally impractical.
- public key cryptography uses a public key to **encrypt data** and ************************Private key************************ to **********************decrypt it.**********************

Steps to do password-less login using ssh:

1. ssh-keygen —> To generate SSH keypair 
    
    The default location of these keys will be **********************/root/.ssh********************** directory
    
2. cd /root/.ssh —> To check our generated keys
    
    **********************************id_rsa********************************** is a private key pair  and **********************************id_rsa.pub********************************** is the public key which will be used later to make password less login
    
3. ssh-copy-id -i <public key location> <client’s IP address> (or use @client IP)
4. cd /root/.ssh —> In clinet’s system
5. cat authorized_keys —> To check the authorized keys

# ==============================================
Passwordless remote connection

public key - which s public to everyone.
private key - which s secured or confidential to the respective machine.

public key and private key location
ls -a : lists all the files along wit the hidden files.

look for the .ssh dir/folder
get inside the folder
cd .ssh
ls
u will find two files
1> authorized_keys
2> known_hosts

cat the two files and check
if you cat the authorized_keys, u wil find the public key.
and
if u cat the known_hosts, you wil find the saved remote keys, which you had used to connect earlier. So, whenever you connect to the remote machine,
u wil find the keys saved in the file known_hosts.

how to connect the remote machine without a password (passwordless connection) ?
we would generate a public and private key in one machine (user1) and wil copy and paste the public key of this machine (user1) to a authorized keys file
of another machine (user2).

ssh-keygen (generates public and private key)
once the keys are generated, get to the location/path, you wil find two files under that directory.
1> id_rsa	(private key)
2> id_rsa.pub	(public key)

u can cat both the files and check.
to make passwordless connection, we will have to copy the public key (id_rsa.pub)(user1) and paste it in the authorized_keys file
of another machine (user2).

make sure all the space are removed before pastin the public key (user1) to the authorized_key file (user2) - copy and paste the public key in a notepad, remove
all the space and den copy it to the authorized_key file.

vi authorized_key (user2) - if you find a differnt key in the file then,go to the end of the line and enter, in a new line paste the public key of (user1), save and exit.
go to user1 and connect to user2 through ssh
ssh user2@ipaddress

Note - if the .ssh dir/folder doesn't exists, you can create a new folder(.ssh) and file in it (aithorized_keys) and copy the public key(id_rsa.pub)
to authorized_key file of another machine.

************************************************************Remote file transfer with SCP and Rsync************************************************************

********************************SCP(secure copy)********************************

- SCP stands for secure copy (scp), which means you can copy files across an ssh connection that will be encrypted, and therefore secured.
- As SCP will be using ssh protocol to transfer the data, hence it is termed as the safest method of transfering data from one location to another.

scp <filename><remote host IP>:/<location to copy the files> —> To copy a file using SCP to remote machine from source location

scp <source system’s IP>:/<location of file to be copied> <destination location to copy> —>********************************To copy a file using SCP from a remote machine being in destination’s location.********************************

scp <option><dir name> <remot host IP>:/<location to copy the directory> —> **to copy a directory using scp to remote machine from source’s location.**

scp <option><source system’s IP>:/<location of file to be copied> <destination location to copy> —> **To copy a directory using scp from a remote machine being in destination’s location**

************************************************************RSYNC (Remote Synchronization)************************************************************

- rsync is a very good program for backing up/mirroring a directory tree of files from one machine to another machine, and for keeping the two machines “in sync” It’s designed to speedup file transfer by copying the difference between two files rather than copying an entire file everytime.

rsync <options> <encryption> <source dir> <destination IP>:/<location of destination dir> —>To check rsync

EX: rsync -rv -e ssh /Cuser 192.168.55.47:/root

- To compress the data and send it in archive mode use **********-avz********** instead of ********-rv******** in rsync

rsync -avz -e ssh <source file> <destination IP>:/<location of file> —> To sync a file

**********More security with sudo :**********

- sudo stands for “substitue user do” or “super user do “
- the file **************************/etc/sudoers************************** file has the rules that users have to follow when using sudo command.
- Do not edit the **************************/etc/sudoers************************** directly, instead use “******************visudo”****************** command to edit the sudoers file. There are 2 reasons for it. 1. It prevents two users from editing the file at the same time and 2. It provides limited syntax checking.

**************************************Advantages of sudo:**************************************

- **********************************************limited user privileges**********************************************
- ******************logs of the actions done by users.******************
    - All commands executed by sudo users will be stored in ********************************/var/log/secure******************************** file, but still if you want you can make your own log file by passing an entry in **************************/etc/sudoers************************** file at the bottom .

******************************************The /etc/sudoers file******************************************

- Always use visudo command to edit this file. it prevents two users from editing the file at the same time, and it also provides limited syntax checking.

![etc/sudoers](<Images/linux/etc-sudoers file.png>)

- As you can see there is basically one line
- root ALL=(ALL) ALL
- This lines means that the user root can execute from ALL terminals, acting as ALL (any) users, and run ALL (any) command.
- So the first part is the user, the second is the terminal from where the user can use sudo, the third is as which user he may act, and the last one, is which commands he may run.

Software Management

Software management in Linux refers to the process of installing, updating, and removing software packages on a Linux system.

- Most of the today’s distributions of linux-based Operating systems install software in pre-compiled packages. These are archived that contain binaries of software, configuration files, and information about dependencies.
- In addition, package management tools automatically keep track of updates and upgrades, so user’s don’t have to worry about managing the details of bug fixes and security upgrades.
- Different packet management software can be found on different linux distributions.

EX: the debian family uses ****************************************************dpkg(debian package management system)**************************************************** and its front-end ********************ApT(Advanced packaging Tool) .******************** Redhat derived distributions use **********RPM (Red hat package manager)********** with its YUM(Yellowdog updater,Modified) and ************dnf(************dandifield yum tools. Arch linux uses the pacman package manager

[List of software package management systems - Wikipedia](https://en.wikipedia.org/wiki/List_of_software_package_management_systems)

where do the required packages come from ? when linux installs a new programs, it does so from a repository (also known as repo).

- Apt includes a special file named ********************************************/etc/apt/sources.list .******************************************** which contains a list of the repositories linux uses. It’s functionality is quite clever. If it notices that one program depends on another, it will automatically install both simultaneously so the user doesn’t have to.
- Another way to add or remove repositories is to use the `add-apt-repository` command. This creates a new source file containing the repository information into the `/etc/apt/sources.list.d/` directory. It’s also possible to add source files manually into that directory.
- Before installing anything with APT, ****************apt-get update**************** this will update the package database with the latest list of available packages and their versions. But this just updated the database, it doesn’t install or upgrade any packages.
- The `apt-get` package management utility uses public key cryptography to authenticate downloaded packages.
- If a user wants to install something, he or she can simply use the command `apt-get install <name-of-package>`.
- This will search the database to determine if the needed package is present in the repositories listed in `/etc/apt/sources.list`.
- If it’s there, it will ask for a confirmation and then install the package following a positive reply. In case a package needs to be reinstalled, the `--reinstall` parameter can be used with the command.
- If the user wants to know which versions of which packages will be installed, they can obtain that information using the `-s` parameter with `install`.
- This will run a simulation of the installation without actually changing anything in the system. It is also possible to install a package which is already in the filesystem. For that, users cannot use the APT tool and must instead use `dpkg -i <path-to-package>`.
- There are two ways to upgrade installed software using the APT tool. The `apt-get upgrade` command upgrades all the installed packages and their versions on the operating system.
- Similarly, `apt-get dist-upgrade` also upgrades the packages and their versions, but in addition, handles changing dependencies with new versions of packages
- To delete a package the `apt-get remove <name-of-package>` command can be used. This will delete the package but leave all the configuration files intact and in place.
- If the configuration files also need to be deleted with the package, then `apt-get purge <name-of-package>` should be used.
- It’s a good practice to clean up the filesystem regularly, getting rid of unneeded packages and the local repository from retrieved package files. `apt-get clean` can be used to clean the packages and install scripts, which are housed in `/var/cache/apt/archives/`. `apt-get autoclean` cleans obsolete deb-packages.
- The difference between `apt-get clean` and `apt-get autoclean` autoclean is that the latter only removes package files that can no longer be downloaded, and are largely useless.
- This allows a cache to be maintained over a long period of time without it growing out of control. `apt-get autoremove` is used to remove packages that were automatically installed to satisfy dependencies for some packages, but are no longer needed.

rpm -qa (where ********q******** stands for query and ********a******** stands for all ) —> To check all the installed packages in the system

rpm -q <package name > or rpm -qa <package name> or rpm -qa | grep -i <package name> —> To check whether a particular package is installed or not

 ********rpm -ivh - - test<package name> [where******** i =install, v=verbose,view and h=hash progress********] —> The command to check the package’s consistency********

[**************if the************** installation status shows 100%, then the package is good or consistent. But while showing the hash progress if it shows error, then package is inconsistent ]

finger <username> —> To check user’s details

rpm -e <package name> —> To remove a package or uninstall a package

rpm -qi <package name> —> To see the information or details about the installed package.

rpm -ivh <package name> - - force —> To done force installation

rpm -qlc <package name> —> to see the configuration files of the installed packages

yum list —> To list all the packages in the repository

************************************Backup and restore************************************

- In information technology, a backup or the process of backing up is making copies of data which may be used to restore the original after a data loss event.
- Backups have two distinct purposes
- The primary purpose is to recover data after its loss, be it by data deletion or corruption. Data loss is a very common experience of computer users. 67% of Internet users have suffered serious data loss.
- The secondary purpose of backups is to recover data from an earlier time, according to a user-defined data retention policy, typically configured within a backup application for how long copies of data are required

tar -cvf <destination and name to be> <source file> —> to backup a file using tar

du -h <filename> —> To check the size of tar file

gzip <filename> —> To apply gzip on a tar file

scp /opt/etc.tar.gz 192.168.25.42:/root —> To transfer the file to other system and remove gzip and tar from it

gunzip <filename> —> to gunzip a file

tar -xvf <filename> —> to untar a file

Managing Installed Services

- services are programs (called daemons) that once started run continuously in the background and are ready for input or monitor changes in your computer and respond to them.

****************************************************There are two commands used to control services:****************************************************

1. ********************service -******************** This controls the starting and stopping of services during a session, these settings are not saved. 
2. ************************chkconfig -************************ This controls which services are set to start on boot, by their nature these setting are saved and are applied at next boot. Changing this services will not start the service immediately, it will flag them to be started from the next boot.

**********************************************service <name of the service> status —>********************************************** To check the status of the service

service <name of the service> start —> to start the service

service <name of the service> stop —> To stop the service

service <name of the serive> reload —> To reload the service

service <name of the service> restart —> To restart the service

chkconfig - - list —> to check the availability of service

chkconfig <service> on —> To make the service available after restart

chkconfig <service>off —> To make the service unavailable after restart

chkconfig - - level<1-6> <service> <on/off> —> To make the service available on a particular run level

************************************Managing Process :************************************

- A linux process is a program running in the linux system. Depending on the linux distributions, it’s also known as ********service.******** But, in linux community , a linux process is called ************daemon************
- In linux, every running process or daemon is given an identity number called ********************************PID(process id)******************************** . The process id is unique. We can terminate unused program in the system by stopping its processid

**********************************There are 3 types of processes that run on linux :**********************************

- **************************Interactive Processes**************************
- **************************System Processes or Daemon**************************
- **************************Automatic or batch**************************

********interactive Processes :********

- Interactive processes are those processes that are invoked by a user and can interact with the user. EX: vi

****************************************************System Process or Daemon :****************************************************

- The second general type of process that runs on linux is a ****************************************************system process or daemon.**************************************************** Daemon is the term used to refer to processes that are running on the computer and provides services but do not interact with the console.
- Most server software is implemented as a daemon. Ex: Apache, samba

************************Automatic Processes:************************

- Automatic processes are not connected to a terminal. Rather, these tasks that can be queued into a spooler area, where they wait to be executed in FIFO(first-in, First-out)basis.

******************Parents and child processes:******************

- The processes which starts or creates another process is called ****************parent process**************** and the one which got created is known as ******************child process******************
- every process will be having a parent process except **********init********** process
- the **********init********** process is the parent of all the process in the system. It is the first process which gets started by kernel at the time of booting.
- The PID of init will be **1**
- Only after init process gets started the remaining process are called by it, hence it is responsible for all the remaining processes in the system.

ps → to Monitor the processes

ps -a —> To see total number of processes running in the system

ps -u <user name> —> to see the processes running by the logged in user

ps -x —> to see which processes are attached with some terminals(tty) and which are not

[The process which are showing “? “ are not attached to any tty]

ps -G <groupname> or pgrep -G<groupname> —> To see which process are running by a particular group

ps -aux —> To see the offline process of the system, already executed

********************************signals in linux********************************

- signals are a way of sending simple messages to processes. Most of these messages are defined and can be found in <linux/signal.h>.
- However, signals can only be processed when the process is in user mode. if a signal has been sent to a process that is in kernel mode it is dealt with immediately on a returning to user mode.
- Every signal has a unique signal name, an abbreviation that begins with SIG(SIGINT for interupt signal, for example)

kill -l —> to see a complete list of signals

**********************************************the most common signals used are**********************************************

- 1 for reloading the process
- 9 for killing the process
- 15 for terminating the process
- 20 for stopping the process

ps -u <username> —> to to find out the process runnning in the system by a user

kill <signal no><processid> —> to kill a signal

****************settingup the priority of a process :****************

- In linux, we can set guidelines for the cpu to follow when it is looking at all the tasks it has to do. These guidelines are called **************************************************nicesness or nice value.**************************************************
- the linx nicess scale goes from ********************-20 to 19********************
- The lower the number the more priority that task gets.
- if the niceness value is high number like 19 the task will be set to the lowest priority and the CPU will process it whenever it gets a chance. The default nice value is zero.
- There are two options to reduce/increase value of a process. you can either do it using the **********nice********** command or the **************renice************** command

nice -n <nice value range (-20 to 19)> <command> —> to set a priority to a process before starting it

ps -elf —> to log in to the other terminal and check the nice value for the above command/process

renice <nicevalue(-20 to 19)> <pid>—> To change the nice value of any process while it is running

top —> to monitor all the processes

The first line in top:

- “02:23:18″ is the current time; “up 1 day” shows how long the system has been up for;
- “3 user” how many users are logged in;
- “load average: 0.01, 0.00, 0.23″ the load average of
the system (1minute, 5 minutes, 15 minutes).
- The second line in top:
 Shows the number of processes and their current state.
The third line in top:
 Shows CPU utilization details. “9.5%us” user processes are using 9.5%; “31.2%sy” system
processes are using 31.2%; “27.0%id” percentage of available cpu; “7.6%wa” time CPU is waiting for IO.
The fourth and fifth lines in top:
- “543948k total” is total memory in the system; “526204K used” is the part of the RAM that currently contains information; “17744k free” is the part of RAM that contains no
information; “17748K buffers and 129928k cached” is the buffered and cached data for IO.

| Field | Description |
| --- | --- |
| PID | Process id |
| User | Effective user id |
| PR | Dynamic priority |
| NI | Nice value, also known as base priority |
| VIRT | Virtual size of task. This includes the size of processe's executable binary  processes, the data area and all the loaded shared libraries. |
| RES | The size of RAM currently consumed by the task. Swapped out portion of the task is not included. |
| SHR | Some memory areas could be shared between two or more task, this field reflects that shared areas. The example of shared area are shared library and SysV shared memory. |
| S | Task status |
| %CPU | The percentage of CPU time dedicated to run  the task since the last top's screen update. |
| %MEM | The percentage of RAM currently consumed by disk |
| TIME+ | The total CPU time the task has been used since it started. "+" sign means it is displayed with hundredth of a second granularity. By default, TIME/TIME+ doesn't account the CPU time used by the task's dead children |
| Command | Showing program names |

********************Interacting with TOP :********************

M -sort by memory usage

p -sort by CPU usage

T -sort by cummulative time

z -color display

k -kill a process

q -quit

r - to renice a process

h -help

FTP (File Transfer Protocol ) Server

- **File Transfer Protocol (FTP)** is a standard network protocol used to transfer files from one host to another host over a TCP-based network, such as the Internet. FTP is built on clientserver architecture and utilizes separate control and data connections between the client
and server. FTP users may authenticate themselves using a clear-text sign-in protocol but can connect anonymously if the server is configured to allow it
- Usually, the FTP server, which stores files to be transferred, uses two ports for the transferring purpose, one for Commands and the other for sending and receiving Data.

There are different connection modes to choose from when connecting to an FTP server, typically either "Active" or "Passive" mode

- The difference between the active FTP and passive FTP is based on who initiates the Data connection between the server and the client.
- If data connection is initiated by the server, the FTP connection is active, and if the client initiates the Data connection, FTP connection is passive.
- Depending on the Active or Passive mode of the connection, port used for Data connection changes. In an Active FTP, data connection is established between port 20 of the Server and High Port of the Client. On the other hand, in Passive FTP, data connection is established
between a High port of the Server and a High port of the Client.
- When using an Active FTP connection, firewall settings of the Client must be changed to accept all incoming connection to the Client, while in Passive FTP connection, the Server must allow all incoming connections to the Server. Most FTP servers prefer the Passive FTP connection due to
security issues.
