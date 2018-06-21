::for /f "skip=1 tokens=3" %%s in ('query user %USERNAME%') do (
::  %windir%\System32\tscon.exe %%s /dest:console
::)

for /f 'skip=1 tokens=3' %%s in ('c:\\windows\\sysnative\\query.exe user') do (
 %windir%\sysnative\tscon.exe %%s /dest:console
)