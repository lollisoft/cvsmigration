
REM for /f %%f in ('dir /b .') do echo %%f
cd train
echo Prepare Git commits with timestamps > ..\PrepareGitCommits.bat
@For /F %%a In ('Dir /b') Do (
CALL ..\CommitFile.bat %%a "%%~ta"
)
cd ..