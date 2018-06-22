for /f "skip=1 tokens=3" %%s in ('%SystemRoot%\\sysnative\\query.exe user %USERNAME%') do (
  %windir%\\sysnative\\tscon.exe %%s /dest:console
)
