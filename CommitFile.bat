
set File=%1
set DateString=%2
set DateString2=%DateString:~7,4%-%DateString:~4,2%-%DateString:~1,2% %DateString:~12,2%:%DateString:~15,2%
echo git add %File% >> ..\PrepareGitCommits.bat
echo git commit %File% -m "Initial commit with date and time out of DISK_055 backup" --date="%DateString2%" >> ..\PrepareGitCommits.bat
