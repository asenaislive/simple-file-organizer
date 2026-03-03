@echo off
setlocal enabledelayedexpansion

echo    ###     ######  ######## ##    ##    ###    
echo   ## ##   ##    ## ##       ###   ##   ## ##  
echo  ##   ##  ##       ##       ####  ##  ##   ##  
echo ##     ##  ######  ######   ## ## ## ##     ## 
echo #########       ## ##       ##  #### ######### 
echo ##     ## ##    ## ##       ##   ### ##     ## 
echo ##     ##  ######  ######## ##    ## ##     ## 

:: ======================================================
:: Asena's File Organizer
:: Features: File sorting, Duplicate detection, Change logs
:: ======================================================
set "SOURCE=D:\test"
set "LOG=%SOURCE%\changelog.txt"
set "LOG_NAME=changelog.txt"
set "SCRIPT_NAME=%~nx0"

echo ==========================================
echo      ASENA'S FILE ORGANIZER
echo ==========================================
echo Target Folder : %SOURCE%
echo Time          : %date% %time%
echo ==========================================
echo.

if not exist "%SOURCE%" (
    echo [ERROR] Source directory missing: %SOURCE%
    pause
    exit /b 1
)

:: Create category folders
for %%F in (Images Documents Videos Audio Archives Other Duplicates TempCleanup SmallFiles MediumFiles LargeFiles Code Ebooks Executables) do (
    if not exist "%SOURCE%\%%F" mkdir "%SOURCE%\%%F"
)

echo [%date% %time%] Organizer Started >> "%LOG%"

:: -------------------------------------------------------
:: Main file loop — root-level files only
:: -------------------------------------------------------
for %%f in ("%SOURCE%\*.*") do call :processFile "%%f"

echo [%date% %time%] Organizer Finished >> "%LOG%"
echo.
echo Organisation complete. Log saved at: %LOG%
echo.
pause
exit /b 0


:: ======================================================
:: SUBROUTINE: processFile
:: ======================================================
:processFile
    set "FILEPATH=%~1"
    set "FILE=%~nx1"
    set "EXT=%~x1"
    set "DEST="

    :: Skip the script and log file
    if /i "%FILE%"=="%SCRIPT_NAME%" exit /b
    if /i "%FILE%"=="%LOG_NAME%"    exit /b

    :: Duplicate check
    if exist "%SOURCE%\Duplicates\%FILE%" (
        move "%FILEPATH%" "%SOURCE%\Duplicates\" >nul 2>&1
        echo [DUPLICATE]  %FILE% >> "%LOG%"
        exit /b
    )

    :: -------------------------------------------------------
    :: IMAGES
    :: -------------------------------------------------------
    if /i "%EXT%"==".jpg"        set "DEST=Images"
    if /i "%EXT%"==".jpeg"       set "DEST=Images"
    if /i "%EXT%"==".png"        set "DEST=Images"
    if /i "%EXT%"==".gif"        set "DEST=Images"
    if /i "%EXT%"==".bmp"        set "DEST=Images"
    if /i "%EXT%"==".webp"       set "DEST=Images"
    if /i "%EXT%"==".heic"       set "DEST=Images"
    if /i "%EXT%"==".heif"       set "DEST=Images"
    if /i "%EXT%"==".tiff"       set "DEST=Images"
    if /i "%EXT%"==".tif"        set "DEST=Images"
    if /i "%EXT%"==".raw"        set "DEST=Images"
    if /i "%EXT%"==".cr2"        set "DEST=Images"
    if /i "%EXT%"==".cr3"        set "DEST=Images"
    if /i "%EXT%"==".nef"        set "DEST=Images"
    if /i "%EXT%"==".arw"        set "DEST=Images"
    if /i "%EXT%"==".dng"        set "DEST=Images"
    if /i "%EXT%"==".orf"        set "DEST=Images"
    if /i "%EXT%"==".rw2"        set "DEST=Images"
    if /i "%EXT%"==".svg"        set "DEST=Images"
    if /i "%EXT%"==".ico"        set "DEST=Images"
    if /i "%EXT%"==".psd"        set "DEST=Images"
    if /i "%EXT%"==".ai"         set "DEST=Images"
    if /i "%EXT%"==".eps"        set "DEST=Images"
    if /i "%EXT%"==".xcf"        set "DEST=Images"
    if /i "%EXT%"==".jfif"       set "DEST=Images"
    if /i "%EXT%"==".avif"       set "DEST=Images"

    :: -------------------------------------------------------
    :: DOCUMENTS
    :: -------------------------------------------------------
    if /i "%EXT%"==".pdf"        set "DEST=Documents"
    if /i "%EXT%"==".doc"        set "DEST=Documents"
    if /i "%EXT%"==".docx"       set "DEST=Documents"
    if /i "%EXT%"==".docm"       set "DEST=Documents"
    if /i "%EXT%"==".dot"        set "DEST=Documents"
    if /i "%EXT%"==".dotx"       set "DEST=Documents"
    if /i "%EXT%"==".txt"        set "DEST=Documents"
    if /i "%EXT%"==".rtf"        set "DEST=Documents"
    if /i "%EXT%"==".odt"        set "DEST=Documents"
    if /i "%EXT%"==".ods"        set "DEST=Documents"
    if /i "%EXT%"==".odp"        set "DEST=Documents"
    if /i "%EXT%"==".xlsx"       set "DEST=Documents"
    if /i "%EXT%"==".xls"        set "DEST=Documents"
    if /i "%EXT%"==".xlsm"       set "DEST=Documents"
    if /i "%EXT%"==".xltx"       set "DEST=Documents"
    if /i "%EXT%"==".pptx"       set "DEST=Documents"
    if /i "%EXT%"==".ppt"        set "DEST=Documents"
    if /i "%EXT%"==".pptm"       set "DEST=Documents"
    if /i "%EXT%"==".csv"        set "DEST=Documents"
    if /i "%EXT%"==".tsv"        set "DEST=Documents"
    if /i "%EXT%"==".xml"        set "DEST=Documents"
    if /i "%EXT%"==".xps"        set "DEST=Documents"
    if /i "%EXT%"==".wps"        set "DEST=Documents"
    if /i "%EXT%"==".wpd"        set "DEST=Documents"
    if /i "%EXT%"==".md"         set "DEST=Documents"
    if /i "%EXT%"==".tex"        set "DEST=Documents"

    :: -------------------------------------------------------
    :: VIDEOS
    :: -------------------------------------------------------
    if /i "%EXT%"==".mp4"        set "DEST=Videos"
    if /i "%EXT%"==".avi"        set "DEST=Videos"
    if /i "%EXT%"==".mkv"        set "DEST=Videos"
    if /i "%EXT%"==".mov"        set "DEST=Videos"
    if /i "%EXT%"==".wmv"        set "DEST=Videos"
    if /i "%EXT%"==".flv"        set "DEST=Videos"
    if /i "%EXT%"==".webm"       set "DEST=Videos"
    if /i "%EXT%"==".m4v"        set "DEST=Videos"
    if /i "%EXT%"==".3gp"        set "DEST=Videos"
    if /i "%EXT%"==".3g2"        set "DEST=Videos"
    if /i "%EXT%"==".mts"        set "DEST=Videos"
    if /i "%EXT%"==".m2ts"       set "DEST=Videos"
    if /i "%EXT%"==".vob"        set "DEST=Videos"
    if /i "%EXT%"==".ogv"        set "DEST=Videos"
    if /i "%EXT%"==".rmvb"       set "DEST=Videos"
    if /i "%EXT%"==".divx"       set "DEST=Videos"
    if /i "%EXT%"==".f4v"        set "DEST=Videos"
    if /i "%EXT%"==".asf"        set "DEST=Videos"

    :: -------------------------------------------------------
    :: AUDIO
    :: -------------------------------------------------------
    if /i "%EXT%"==".mp3"        set "DEST=Audio"
    if /i "%EXT%"==".wav"        set "DEST=Audio"
    if /i "%EXT%"==".flac"       set "DEST=Audio"
    if /i "%EXT%"==".aac"        set "DEST=Audio"
    if /i "%EXT%"==".ogg"        set "DEST=Audio"
    if /i "%EXT%"==".wma"        set "DEST=Audio"
    if /i "%EXT%"==".m4a"        set "DEST=Audio"
    if /i "%EXT%"==".opus"       set "DEST=Audio"
    if /i "%EXT%"==".aiff"       set "DEST=Audio"
    if /i "%EXT%"==".aif"        set "DEST=Audio"
    if /i "%EXT%"==".mid"        set "DEST=Audio"
    if /i "%EXT%"==".midi"       set "DEST=Audio"
    if /i "%EXT%"==".ape"        set "DEST=Audio"
    if /i "%EXT%"==".mka"        set "DEST=Audio"

    :: -------------------------------------------------------
    :: ARCHIVES
    :: -------------------------------------------------------
    if /i "%EXT%"==".zip"        set "DEST=Archives"
    if /i "%EXT%"==".rar"        set "DEST=Archives"
    if /i "%EXT%"==".7z"         set "DEST=Archives"
    if /i "%EXT%"==".tar"        set "DEST=Archives"
    if /i "%EXT%"==".gz"         set "DEST=Archives"
    if /i "%EXT%"==".bz2"        set "DEST=Archives"
    if /i "%EXT%"==".xz"         set "DEST=Archives"
    if /i "%EXT%"==".tgz"        set "DEST=Archives"
    if /i "%EXT%"==".cab"        set "DEST=Archives"
    if /i "%EXT%"==".iso"        set "DEST=Archives"
    if /i "%EXT%"==".img"        set "DEST=Archives"
    if /i "%EXT%"==".dmg"        set "DEST=Archives"
    if /i "%EXT%"==".lzma"       set "DEST=Archives"
    if /i "%EXT%"==".zst"        set "DEST=Archives"

    :: -------------------------------------------------------
    :: EBOOKS
    :: -------------------------------------------------------
    if /i "%EXT%"==".epub"       set "DEST=Ebooks"
    if /i "%EXT%"==".mobi"       set "DEST=Ebooks"
    if /i "%EXT%"==".azw"        set "DEST=Ebooks"
    if /i "%EXT%"==".azw3"       set "DEST=Ebooks"
    if /i "%EXT%"==".djvu"       set "DEST=Ebooks"
    if /i "%EXT%"==".fb2"        set "DEST=Ebooks"
    if /i "%EXT%"==".lit"        set "DEST=Ebooks"
    if /i "%EXT%"==".cbz"        set "DEST=Ebooks"
    if /i "%EXT%"==".cbr"        set "DEST=Ebooks"

    :: -------------------------------------------------------
    :: CODE / SCRIPTS
    :: -------------------------------------------------------
    if /i "%EXT%"==".py"         set "DEST=Code"
    if /i "%EXT%"==".js"         set "DEST=Code"
    if /i "%EXT%"==".ts"         set "DEST=Code"
    if /i "%EXT%"==".html"       set "DEST=Code"
    if /i "%EXT%"==".htm"        set "DEST=Code"
    if /i "%EXT%"==".css"        set "DEST=Code"
    if /i "%EXT%"==".cpp"        set "DEST=Code"
    if /i "%EXT%"==".c"          set "DEST=Code"
    if /i "%EXT%"==".h"          set "DEST=Code"
    if /i "%EXT%"==".cs"         set "DEST=Code"
    if /i "%EXT%"==".java"       set "DEST=Code"
    if /i "%EXT%"==".kt"         set "DEST=Code"
    if /i "%EXT%"==".swift"      set "DEST=Code"
    if /i "%EXT%"==".go"         set "DEST=Code"
    if /i "%EXT%"==".rs"         set "DEST=Code"
    if /i "%EXT%"==".php"        set "DEST=Code"
    if /i "%EXT%"==".rb"         set "DEST=Code"
    if /i "%EXT%"==".sh"         set "DEST=Code"
    if /i "%EXT%"==".bat"        set "DEST=Code"
    if /i "%EXT%"==".cmd"        set "DEST=Code"
    if /i "%EXT%"==".ps1"        set "DEST=Code"
    if /i "%EXT%"==".lua"        set "DEST=Code"
    if /i "%EXT%"==".r"          set "DEST=Code"
    if /i "%EXT%"==".json"       set "DEST=Code"
    if /i "%EXT%"==".yaml"       set "DEST=Code"
    if /i "%EXT%"==".yml"        set "DEST=Code"
    if /i "%EXT%"==".toml"       set "DEST=Code"
    if /i "%EXT%"==".ini"        set "DEST=Code"
    if /i "%EXT%"==".cfg"        set "DEST=Code"
    if /i "%EXT%"==".sql"        set "DEST=Code"
    if /i "%EXT%"==".vue"        set "DEST=Code"
    if /i "%EXT%"==".jsx"        set "DEST=Code"
    if /i "%EXT%"==".tsx"        set "DEST=Code"
    if /i "%EXT%"==".dart"       set "DEST=Code"

    :: -------------------------------------------------------
    :: EXECUTABLES / INSTALLERS
    :: -------------------------------------------------------
    if /i "%EXT%"==".exe"        set "DEST=Executables"
    if /i "%EXT%"==".msi"        set "DEST=Executables"
    if /i "%EXT%"==".msix"       set "DEST=Executables"
    if /i "%EXT%"==".appx"       set "DEST=Executables"
    if /i "%EXT%"==".apk"        set "DEST=Executables"
    if /i "%EXT%"==".ipa"        set "DEST=Executables"
    if /i "%EXT%"==".deb"        set "DEST=Executables"
    if /i "%EXT%"==".rpm"        set "DEST=Executables"
    if /i "%EXT%"==".pkg"        set "DEST=Executables"
    if /i "%EXT%"==".run"        set "DEST=Executables"
    if /i "%EXT%"==".bin"        set "DEST=Executables"
    if /i "%EXT%"==".com"        set "DEST=Executables"
    if /i "%EXT%"==".dll"        set "DEST=Executables"
    if /i "%EXT%"==".sys"        set "DEST=Executables"

    :: -------------------------------------------------------
    :: TEMP / JUNK
    :: -------------------------------------------------------
    if /i "%EXT%"==".tmp"        set "DEST=TempCleanup"
    if /i "%EXT%"==".temp"       set "DEST=TempCleanup"
    if /i "%EXT%"==".bak"        set "DEST=TempCleanup"
    if /i "%EXT%"==".old"        set "DEST=TempCleanup"
    if /i "%EXT%"==".crdownload" set "DEST=TempCleanup"
    if /i "%EXT%"==".part"       set "DEST=TempCleanup"
    if /i "%EXT%"==".cache"      set "DEST=TempCleanup"

    :: Unrecognised — sort by size
    if not defined DEST call :sortBySize "%~z1"

    move "%FILEPATH%" "%SOURCE%\%DEST%\" >nul 2>&1
    if errorlevel 1 (
        echo [FAILED]     %FILE%  ->  %DEST% >> "%LOG%"
    ) else (
        echo [MOVED]      %FILE%  ->  %DEST% >> "%LOG%"
    )
exit /b


:: ======================================================
:: SUBROUTINE: sortBySize
:: ======================================================
:sortBySize
    set "SIZE=%~1"
    if %SIZE% GEQ 104857600 (
        set "DEST=LargeFiles"
    ) else if %SIZE% GEQ 1048576 (
        set "DEST=MediumFiles"
    ) else (
        set "DEST=SmallFiles"
    )
exit /b