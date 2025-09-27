:: Extract 608CC Data from 436M Ancillary Data in a MXF file to an SCC file
:: Requires a version of ffmpeg which includes the smpte436m_to_eia608 bitstream filter

:: Create escaped path for Source File
set SOURCE=%1
set slashes=%SOURCE:\=\\\\%
set ESCSOURCE=%slashes::\=\\\:\%

:: Define Output Location
set OUTDIR=D:\Temp\Output

:: Run FFMPEG Command
ffmpeg.exe -hide_banner -y ^
 -i %1 -bsf:d smpte436m_to_eia608 ^
 -map 0:d? ^
 -c:s copy %OUTDIR%\%~n1.scc
 
pause
