
@echo off
setlocal

:: =================================================================
:: Advent of Code Input Downloader for Windows CMD
:: Usage: get_aoc_input.cmd [day] [year]
:: Defaults to the current day and year if no arguments are provided.
:: Requires a file named 'SESSION' in the same directory containing
:: only the raw Advent of Code session cookie value.
:: =================================================================

:: --- 1. SET DEFAULTS (YEAR AND DAY) using PowerShell ---

:: Get current day (d) and year (yyyy) without leading zeros for the day.
:: We use PowerShell for reliable, locale-independent date formatting.
for /f "delims=" %%i in ('powershell -Command "((Get-Date).Day)"' ) do set "day_default=%%i"
for /f "delims=" %%i in ('powershell -Command "(Get-Date -Format 'yyyy')"' ) do set "year_default=%%i"

:: --- 2. ARGUMENT HANDLING ---

:: Assign Day: Use argument %1 if provided, otherwise use default
set "day=%1"
if "%day%"=="" (
    set "day=%day_default%"
)

:: Assign Year: Use argument %2 if provided, otherwise use default
set "year=%2"
if "%year%"=="" (
    set "year=%year_default%"
)

:: --- 3. SESSION COOKIE CHECK ---

set "session_file=SESSION"
if not exist "%session_file%" (
    echo ERROR: Session file "%session_file%" not found in the current directory.
    echo Please create this file and paste your session cookie value inside.
    goto :end
)

:: Read the first line of the SESSION file into the 'session' variable
for /f "usebackq tokens=*" %%s in ("%session_file%") do (
    set "session=%%s"
    goto :start_curl
)

:: --- 4. CURL EXECUTION ---

:start_curl
set "output_file=%day%.in"
set "aoc_url=https://adventofcode.com/%year%/day/%day%/input"


echo.
echo Attempting to download input for Day %day%, %year%...
echo URL: %aoc_url%


:: Check if 'curl' is available
where /q curl
if errorlevel 1 (
    echo ERROR: 'curl' command not found. Please ensure it is installed and in your PATH.
    goto :end
)

:: Execute the curl command. Note: We use double-quotes around the session
:: variable just in case, but usually not strictly needed for the session cookie value.
curl -s -H "Cookie: session=%session%" "%aoc_url%" > "%output_file%"

:: Check if the curl command was successful (or if the output file is empty)
if not exist "%output_file%" (
    echo ERROR: Download failed. Output file "%output_file%" was not created.
    echo Check your session token and the URL.
) else (
    :: Check if the content is likely the actual input (i.e., not a 'Please log in' message)
    for /f "tokens=*" %%c in ('type "%output_file%" ^| findstr /i /c:"Please log in" /c:"not found" /c:"404"') do (
        echo WARNING: Downloaded file may contain an error message (e.g., "Please log in" or "Not Found"^).
        echo Please check the content of "%output_file%" and ensure your SESSION cookie is correct and valid.
    )
    echo SUCCESS! Input saved to "%output_file%"
)

