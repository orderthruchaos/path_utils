@ECHO OFF
SET orig_working_dir="%CD%"

REM Ensure we are in a directory we can process properly.
IF NOT EXIST "%orig_working_dir%\test\win32_link_setup.bat" (
  ECHO This script must be run in the top-level directory of the canon_path
  ECHO project.
  GOTO :go_back_to_orig_dir
)

SET test_data_dir="%orig_working_dir%\test\data\win32"
CD "%test_data_dir%"
MKLINK rel_link.txt some_file.txt
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)

CD "%test_data_dir%\rec"
MKLINK /D d02 d01
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d03 d02
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d04 d03
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d05 d04
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d06 d05
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d07 d06
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d08 d07
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d09 d08
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d10 d09
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d11 d10
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d12 d11
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d13 d12
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d14 d13
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d15 d14
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d16 d15
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d17 d16
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d18 d17
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d19 d18
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d20 d19
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d21 d20
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d22 d21
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d23 d22
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d24 d23
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d25 d24
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d26 d25
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d27 d26
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d28 d27
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d29 d28
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d30 d29
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d31 d30
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d32 d31
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)


:go_back_to_orig_dir

CD "%orig_working_dir%"
