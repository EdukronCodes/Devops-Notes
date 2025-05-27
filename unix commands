
---

**File and Directory Management**

1.  **`ls` (List Directory Contents)**
    *   **Purpose:** Lists files and directories in the current or a specified directory.
    *   **Detailed Explanation:** `ls` is one of the most frequently used commands.
        *   `ls`: Lists contents of the current directory.
        *   `ls /path/to/directory`: Lists contents of a specific directory.
        *   Common Options:
            *   `-l`: Long listing format (shows permissions, owner, size, modification date).
            *   `-a`: Shows all files, including hidden files (those starting with a dot `.`).
            *   `-h`: With `-l`, shows sizes in human-readable format (KB, MB, GB).
            *   `-t`: Sorts by modification time, newest first.
            *   `-R`: Recursively lists subdirectories.
        *   Example: `ls -lah /var/log` (shows all files, long format, human-readable sizes in `/var/log`).

2.  **`cd` (Change Directory)**
    *   **Purpose:** Navigates between directories in the file system.
    *   **Detailed Explanation:** `cd` changes your current working directory.
        *   `cd /path/to/directory`: Changes to the specified absolute path.
        *   `cd directory_name`: Changes to a subdirectory within the current directory.
        *   `cd ..`: Moves one level up in the directory tree (to the parent directory).
        *   `cd ~` or `cd`: Moves to the current user's home directory.
        *   `cd -`: Moves to the previous directory you were in.
        *   Example: `cd /etc/nginx` (navigates to the nginx configuration directory).

3.  **`pwd` (Print Working Directory)**
    *   **Purpose:** Displays the full path of the current directory you are in.
    *   **Detailed Explanation:** Useful when you're unsure of your current location in the filesystem hierarchy. It outputs the absolute path.
        *   Example: If you are in `/home/user/documents`, typing `pwd` will output `/home/user/documents`.

4.  **`mkdir` (Make Directory)**
    *   **Purpose:** Creates one or more new directories.
    *   **Detailed Explanation:**
        *   `mkdir directory_name`: Creates a new directory named `directory_name` in the current location.
        *   `mkdir /path/to/new_directory`: Creates a directory at the specified path.
        *   Common Option:
            *   `-p`: Creates parent directories as needed if they don't exist.
        *   Example: `mkdir -p projects/web/src` (creates `projects`, then `web` inside `projects`, then `src` inside `web`, even if `projects` and `web` don't exist yet).

5.  **`rmdir` (Remove Directory)**
    *   **Purpose:** Deletes empty directories.
    *   **Detailed Explanation:** `rmdir` will only remove a directory if it contains no files or other subdirectories.
        *   `rmdir directory_name`: Attempts to remove the specified empty directory.
        *   To remove directories with content, use `rm -r` (see below).
        *   Example: `rmdir old_project` (will fail if `old_project` is not empty).

6.  **`rm` (Remove)**
    *   **Purpose:** Deletes files and directories.
    *   **Detailed Explanation:** **Use with caution, as deleted files are generally not recoverable!**
        *   `rm filename`: Deletes the specified file.
        *   Common Options:
            *   `-r` or `-R`: Recursively removes directories and their contents. Essential for deleting non-empty directories.
            *   `-f`: Force removal. Suppresses confirmation prompts and ignores non-existent files (can be dangerous).
            *   `-i`: Interactive mode, prompts for confirmation before each removal.
        *   Example: `rm important_document.txt` (deletes the file).
        *   Example: `rm -rf old_stuff/` (forcefully and recursively removes the `old_stuff` directory and all its contents – **very dangerous if you mistype!**).

7.  **`cp` (Copy)**
    *   **Purpose:** Copies files and directories.
    *   **Detailed Explanation:**
        *   `cp source_file destination_file`: Copies `source_file` to `destination_file`. If `destination_file` exists, it's overwritten. If `destination_file` is a directory, `source_file` is copied into it.
        *   `cp file1 file2 directory/`: Copies `file1` and `file2` into `directory`.
        *   Common Options:
            *   `-r` or `-R`: Recursively copies directories and their contents.
            *   `-i`: Interactive, prompts before overwriting.
            *   `-p`: Preserves attributes like modification time, ownership, and permissions.
            *   `-v`: Verbose, shows what is being done.
        *   Example: `cp -r documents/report.docx backups/` (copies `report.docx` from `documents` into the `backups` directory. If `backups` doesn't exist and `documents/report.docx` is a file, it creates a file named `backups`).
        *   Example: `cp -r project_folder project_folder_backup` (copies the entire `project_folder` to `project_folder_backup`).

8.  **`mv` (Move)**
    *   **Purpose:** Moves or renames files and directories.
    *   **Detailed Explanation:**
        *   `mv source destination`:
            *   If `destination` is an existing directory, `source` (file or directory) is moved into it.
            *   If `destination` is a new name and `source` is a file, the file is renamed.
            *   If `destination` is a new name and `source` is a directory, the directory is renamed.
        *   Common Options:
            *   `-i`: Interactive, prompts before overwriting.
            *   `-f`: Force, overwrites without prompting.
            *   `-v`: Verbose.
        *   Example (rename): `mv old_name.txt new_name.txt`
        *   Example (move): `mv important_file.doc /media/usb_drive/`

9.  **`touch` (Touch)**
    *   **Purpose:** Creates an empty file if it doesn't exist, or updates the access and modification timestamps of an existing file.
    *   **Detailed Explanation:**
        *   `touch filename.txt`: If `filename.txt` doesn't exist, it's created as an empty file. If it exists, its last access and modification times are updated to the current time.
        *   Useful for creating placeholder files or for scripts that rely on file timestamps.
        *   Example: `touch new_log_file.log`

10. **`ln` (Link)**
    *   **Purpose:** Creates links between files.
    *   **Detailed Explanation:** There are two types of links:
        *   **Hard Link:** `ln target_file link_name`
            *   A hard link is another name for an existing file. Both names point to the same data on the disk (same inode).
            *   Deleting one name doesn't delete the data as long as another hard link to it exists.
            *   Cannot span across different file systems.
            *   Cannot link to directories (usually).
        *   **Symbolic Link (Soft Link):** `ln -s target_file_or_directory link_name`
            *   A symbolic link is a special file that contains a path to another file or directory (like a shortcut in Windows).
            *   If the original target is deleted, the symbolic link becomes "broken."
            *   Can span across file systems.
            *   Can link to directories.
        *   Example (symbolic): `ln -s /var/www/html/my_app/config.ini ~/app_config` (creates a link `app_config` in the home directory pointing to the actual config file).

---

**Viewing and Manipulating Text Files**

11. **`cat` (Concatenate)**
    *   **Purpose:** Displays the content of files, concatenates files, or creates new files.
    *   **Detailed Explanation:**
        *   `cat filename`: Displays the entire content of `filename` to the standard output (your screen).
        *   `cat file1 file2 > new_file`: Concatenates `file1` and `file2` and redirects the output to create/overwrite `new_file`.
        *   `cat file1 file2 >> existing_file`: Appends the content of `file1` and `file2` to `existing_file`.
        *   Common Option:
            *   `-n`: Numbers all output lines.
        *   Example: `cat /etc/hosts` (displays the system's hosts file).

12. **`less` (Less is More)**
    *   **Purpose:** Displays file content one page at a time, allowing backward and forward navigation.
    *   **Detailed Explanation:** `less` is more powerful than `more`. It loads the file progressively, so it's efficient for large files.
        *   `less filename`: Opens the file for viewing.
        *   Navigation:
            *   `Space bar` or `f`: Next page.
            *   `b`: Previous page.
            *   `Arrow keys`: Scroll line by line.
            *   `/pattern`: Search forward for `pattern`.
            *   `?pattern`: Search backward for `pattern`.
            *   `n`: Repeat last search.
            *   `q`: Quit.
        *   Example: `less /var/log/syslog`

13. **`head`**
    *   **Purpose:** Displays the first few lines of a file.
    *   **Detailed Explanation:**
        *   `head filename`: By default, shows the first 10 lines.
        *   Common Option:
            *   `-n <number>` or `-<number>`: Specifies the number of lines to show.
        *   Example: `head -n 5 server.log` (shows the first 5 lines of `server.log`).

14. **`tail`**
    *   **Purpose:** Displays the last few lines of a file.
    *   **Detailed Explanation:**
        *   `tail filename`: By default, shows the last 10 lines.
        *   Common Options:
            *   `-n <number>` or `-<number>`: Specifies the number of lines to show.
            *   `-f`: Follow. Outputs appended data as the file grows. Extremely useful for monitoring log files in real-time. (Press `Ctrl+C` to stop).
        *   Example: `tail -n 20 access.log` (shows the last 20 lines).
        *   Example: `tail -f /var/log/nginx/error.log` (monitors the Nginx error log).

15. **`grep` (Global Regular Expression Print)**
    *   **Purpose:** Searches for patterns (text strings or regular expressions) in files or input streams.
    *   **Detailed Explanation:** `grep` is incredibly powerful for finding specific information.
        *   `grep "pattern" filename`: Searches for "pattern" in `filename` and prints matching lines.
        *   Common Options:
            *   `-i`: Case-insensitive search.
            *   `-v`: Invert match (prints lines that *don't* match).
            *   `-r` or `-R`: Recursive search in a directory.
            *   `-n`: Show line numbers.
            *   `-c`: Count matching lines.
            *   `-E`: Use extended regular expressions.
        *   Example: `grep -i "error" system.log` (finds all lines containing "error", case-insensitive).
        *   Example (piping): `dmesg | grep -i "usb"` (searches kernel messages for lines containing "usb").

16. **`wc` (Word Count)**
    *   **Purpose:** Counts lines, words, and characters/bytes in a file or input.
    *   **Detailed Explanation:**
        *   `wc filename`: Outputs lines, words, and byte count for `filename`.
        *   Common Options:
            *   `-l`: Count lines only.
            *   `-w`: Count words only.
            *   `-c`: Count bytes only.
            *   `-m`: Count characters only (can differ from bytes for multi-byte encodings).
        *   Example: `wc -l report.txt` (shows how many lines are in `report.txt`).

17. **`sort`**
    *   **Purpose:** Sorts lines of text files or input streams.
    *   **Detailed Explanation:**
        *   `sort filename`: Sorts lines alphabetically by default.
        *   Common Options:
            *   `-r`: Reverse sort order.
            *   `-n`: Numeric sort (treats lines as numbers).
            *   `-k <field_number>`: Sort based on a specific field (columns, space-separated by default).
            *   `-u`: Unique, output only unique lines (after sorting).
            *   `-t <delimiter>`: Use a specific delimiter instead of whitespace for fields.
        *   Example: `sort -nr data.txt` (sorts `data.txt` numerically in reverse order).
        *   Example: `ls -l | sort -k5 -nr` (lists files, then sorts them by size, largest first).

18. **`uniq` (Unique)**
    *   **Purpose:** Removes duplicate adjacent lines from a sorted file or input.
    *   **Detailed Explanation:** `uniq` only works on *adjacent* identical lines. So, you usually need to `sort` the input first.
        *   `uniq filename`: Prints unique lines from `filename` (assuming it's sorted).
        *   Common Options:
            *   `-c`: Prefix lines by the number of occurrences.
            *   `-d`: Only print duplicate lines.
            *   `-u`: Only print unique lines (lines that are not repeated).
        *   Example: `sort data.txt | uniq -c` (sorts `data.txt`, then counts occurrences of each unique line).

19. **`diff` (Difference)**
    *   **Purpose:** Compares two files line by line and shows the differences.
    *   **Detailed Explanation:**
        *   `diff file1 file2`: Shows how to change `file1` to make it identical to `file2`.
        *   Output can be a bit cryptic initially but is standard.
        *   Common Options:
            *   `-u`: Unified diff format (often preferred for patches).
            *   `-i`: Ignore case differences.
            *   `-w`: Ignore all whitespace.
            *   `-r`: Recursively compare directories.
        *   Example: `diff -u old_config.txt new_config.txt`

---

**Process Management**

20. **`ps` (Process Status)**
    *   **Purpose:** Displays information about currently running processes.
    *   **Detailed Explanation:** `ps` has many options due to historical reasons (BSD vs. System V syntax).
        *   `ps`: Shows processes owned by the current user in the current terminal.
        *   Common Options (often combined):
            *   `aux` (BSD syntax): Show all processes from all users in a user-friendly format.
                *   `a`: Show processes for all users.
                *   `u`: Display user-oriented format.
                *   `x`: Show processes not attached to a terminal.
            *   `ef` (System V syntax): Show all processes in full format.
                *   `-e`: Select all processes.
                *   `-f`: Full-format listing.
        *   Example: `ps aux` (a very common way to see everything running).
        *   Example: `ps aux | grep "nginx"` (finds all processes related to nginx).

21. **`top` (Table of Processes)**
    *   **Purpose:** Displays a real-time, dynamic view of running processes, sorted by CPU usage by default.
    *   **Detailed Explanation:** `top` is an interactive system monitor.
        *   Keybindings within `top`:
            *   `q`: Quit.
            *   `M`: Sort by memory usage.
            *   `P`: Sort by CPU usage (default).
            *   `k`: Kill a process (prompts for PID and signal).
            *   `h`: Show help.
        *   `htop` is a more user-friendly, colorful alternative often installed separately.
        *   Example: Just type `top`.

22. **`kill`**
    *   **Purpose:** Sends a signal to a process, typically to terminate it.
    *   **Detailed Explanation:**
        *   `kill PID`: Sends the default termination signal (SIGTERM, 15) to the process with Process ID `PID`. SIGTERM asks the process to shut down gracefully.
        *   `kill -9 PID` or `kill -SIGKILL PID`: Sends the SIGKILL signal (9), which forces the process to terminate immediately. This should be a last resort as the process doesn't get a chance to clean up.
        *   You can find the PID using `ps` or `pgrep`.
        *   Other signals exist (e.g., `SIGHUP` (1) to reload configuration for some daemons).
        *   Example: `kill 12345` (sends SIGTERM to process 12345).
        *   Example: `kill -9 12345` (forcefully kills process 12345).

23. **`pgrep` (Process Grep)**
    *   **Purpose:** Looks up processes based on name or other attributes and prints their PIDs.
    *   **Detailed Explanation:** Simpler than `ps aux | grep ... | awk ...` for just getting PIDs.
        *   `pgrep process_name`: Finds PIDs of processes matching `process_name`.
        *   Common Options:
            *   `-l`: List the process name along with the PID.
            *   `-u <username>`: Find processes owned by a specific user.
            *   `-f`: Match against the full command line, not just the process name.
        *   Example: `pgrep nginx` (prints PIDs of nginx processes).
        *   Example: `sudo kill $(pgrep -f old_script.py)` (kills processes whose command line contains `old_script.py`).

24. **`jobs`**
    *   **Purpose:** Lists jobs (processes) that have been started from the current shell and are running in the background or are stopped.
    *   **Detailed Explanation:** A "job" is a shell's way of managing a process or group of processes.
        *   If you run a command and then press `Ctrl+Z`, it stops the job and puts it in the background. `jobs` will then show it.
        *   Example: Type `sleep 100`, then `Ctrl+Z`. Then type `jobs`.

25. **`fg` (Foreground)**
    *   **Purpose:** Brings a background or stopped job to the foreground.
    *   **Detailed Explanation:**
        *   `fg %job_number`: Brings the specified job (from `jobs` output, e.g., `%1`) to the foreground.
        *   `fg`: If there's only one background job, brings it to the foreground.
        *   Example: After `Ctrl+Z` on `sleep 100`, type `fg` to resume it in the foreground.

26. **`bg` (Background)**
    *   **Purpose:** Resumes a stopped job and runs it in the background.
    *   **Detailed Explanation:**
        *   `bg %job_number`: Puts the specified stopped job into the background and continues its execution.
        *   Example: After `Ctrl+Z` on `sleep 100`, type `bg` to let `sleep 100` run in the background. The shell prompt returns immediately.

---

**System Information & User Management**

27. **`df` (Disk Free)**
    *   **Purpose:** Reports file system disk space usage.
    *   **Detailed Explanation:** Shows total, used, and available space on mounted file systems.
        *   Common Options:
            *   `-h`: Human-readable format (KB, MB, GB).
            *   `-T`: Show file system type.
            *   `-i`: Show inode usage instead of block usage.
        *   Example: `df -h` (shows disk space for all mounted file systems in a readable way).

28. **`du` (Disk Usage)**
    *   **Purpose:** Estimates file and directory space usage.
    *   **Detailed Explanation:**
        *   `du filename_or_directory`: Shows disk usage for the specified file or directory (and its subdirectories).
        *   Common Options:
            *   `-h`: Human-readable format.
            *   `-s`: Summary, display only a total for each argument.
            *   `-c`: Display a grand total.
            *   `--max-depth=N`: Show usage for directories up to N levels deep.
        *   Example: `du -sh /var/log` (shows the total size of the `/var/log` directory).
        *   Example: `du -h --max-depth=1 /home/user` (shows sizes of direct subdirectories in `/home/user`).

29. **`uname` (Unix Name)**
    *   **Purpose:** Prints system information like kernel name, version, machine hardware.
    *   **Detailed Explanation:**
        *   Common Options:
            *   `-a`: All information (kernel name, hostname, kernel release, kernel version, machine hardware name, OS).
            *   `-s`: Kernel name (e.g., Linux).
            *   `-r`: Kernel release.
            *   `-m`: Machine hardware name (e.g., x86_64).
        *   Example: `uname -a`

30. **`whoami` (Who am I)**
    *   **Purpose:** Prints the effective username of the current user.
    *   **Detailed Explanation:** Simple command to confirm which user account you are currently operating as.
        *   Example: `whoami` (might output `john` or `root`).

31. **`id`**
    *   **Purpose:** Prints real and effective user and group IDs.
    *   **Detailed Explanation:** Shows numeric user ID (UID), group ID (GID), and supplementary groups the user belongs to. More detailed than `whoami`.
        *   `id`: Shows information for the current user.
        *   `id username`: Shows information for a specific user.
        *   Example: `id`

32. **`passwd` (Password)**
    *   **Purpose:** Changes the password for a user account.
    *   **Detailed Explanation:**
        *   `passwd`: Changes the password for the current user. It will prompt for the old password, then the new password twice.
        *   `sudo passwd username`: (As root/sudoer) Changes the password for `username`. It will prompt for the new password twice (no old password needed for root).
        *   Example: `passwd`

33. **`sudo` (Superuser Do)**
    *   **Purpose:** Allows a permitted user to execute a command as the superuser (root) or another user.
    *   **Detailed Explanation:** `sudo` is crucial for system administration. It provides a way to grant specific administrative privileges without giving out the root password.
        *   `sudo command_to_run`: Executes `command_to_run` with root privileges. You'll be prompted for *your* user password (not root's).
        *   Configuration is in `/etc/sudoers` (edit with `visudo`).
        *   Example: `sudo apt update` (updates package lists on Debian/Ubuntu systems, requires root).

---

**Networking**

34. **`ping`**
    *   **Purpose:** Sends ICMP ECHO_REQUEST packets to network hosts to test connectivity and latency.
    *   **Detailed Explanation:**
        *   `ping hostname_or_ip`: Sends packets to the target. By default, it continues until stopped with `Ctrl+C`.
        *   Common Options:
            *   `-c <count>`: Stop after sending <count> packets.
        *   Example: `ping -c 4 google.com` (sends 4 pings to google.com).

35. **`ssh` (Secure Shell)**
    *   **Purpose:** Connects securely to a remote machine over a network.
    *   **Detailed Explanation:** `ssh` encrypts all traffic, making it safe to use over untrusted networks.
        *   `ssh username@hostname_or_ip`: Connects as `username` to the remote host.
        *   `ssh hostname_or_ip`: Connects with your current local username.
        *   Common Options:
            *   `-p <port>`: Connect to a specific port if the SSH server isn't on the default port 22.
            *   `-i /path/to/private_key`: Use a specific private key for authentication.
        *   Example: `ssh myuser@192.168.1.100`

36. **`scp` (Secure Copy)**
    *   **Purpose:** Securely copies files between hosts on a network, using SSH for data transfer.
    *   **Detailed Explanation:**
        *   Copy local file to remote: `scp /path/to/local_file username@hostname:/path/to/remote_destination`
        *   Copy remote file to local: `scp username@hostname:/path/to/remote_file /path/to/local_destination`
        *   Common Option:
            *   `-r`: Recursively copy directories.
            *   `-P <port>` (Note: uppercase P for scp, lowercase for ssh): Specify remote host port.
        *   Example: `scp report.pdf admin@server.example.com:/var/www/html/reports/`

---

**Archiving and Compression**

37. **`tar` (Tape Archive)**
    *   **Purpose:** Creates, views, and extracts archive files (tarballs). Often used with compression like gzip or bzip2.
    *   **Detailed Explanation:** `tar` by itself just bundles files; it doesn't compress.
        *   Common Operations (options are often combined without hyphens, but `-` is also fine):
            *   `c`: Create an archive.
            *   `x`: Extract from an archive.
            *   `t`: List contents of an archive.
            *   `v`: Verbose (show files being processed).
            *   `f <filename>`: Specify archive filename. **This usually must be the last option if not using hyphens.**
            *   `z`: Filter through gzip (for `.tar.gz` or `.tgz` files).
            *   `j`: Filter through bzip2 (for `.tar.bz2` files).
            *   `J`: Filter through xz (for `.tar.xz` files).
        *   Example (create gzipped archive): `tar -czvf archive_name.tar.gz directory_to_archive/`
        *   Example (extract gzipped archive): `tar -xzvf archive_name.tar.gz`
        *   Example (list contents): `tar -tvf archive_name.tar.gz`

38. **`gzip` (GNU Zip)**
    *   **Purpose:** Compresses files using Lempel-Ziv coding (LZ77).
    *   **Detailed Explanation:**
        *   `gzip filename`: Compresses `filename` and replaces it with `filename.gz`. The original file is removed.
        *   Common Option:
            *   `-d`: Decompress (same as `gunzip`).
            *   `-k`: Keep original file.
        *   Example: `gzip large_log_file.log` (creates `large_log_file.log.gz`).

39. **`gunzip` (GNU Unzip)**
    *   **Purpose:** Decompresses files compressed with `gzip`, `zip`, `compress`.
    *   **Detailed Explanation:**
        *   `gunzip filename.gz`: Decompresses `filename.gz` and replaces it with `filename`.
        *   Example: `gunzip large_log_file.log.gz` (restores `large_log_file.log`).

---

**Miscellaneous Utilities**

40. **`man` (Manual)**
    *   **Purpose:** Displays the online manual pages (help documentation) for commands.
    *   **Detailed Explanation:** This is your primary source of information for any command.
        *   `man command_name`: Shows the manual page for `command_name`.
        *   Navigation is usually like `less` (space, b, /, q).
        *   Manuals are divided into sections (e.g., 1 for user commands,  опасный for system calls). `man man` for details.
        *   Example: `man ls` (shows the detailed manual for the `ls` command).
        *   Example: `man 5 crontab` (shows the manual for the crontab file format, section 5).

---

This list covers a lot of ground! Practice using these commands, combine them with pipes (`|`) and redirection (`>`, `>>`, `<`), and consult their `man` pages to become proficient in the Unix command line.
