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
MKLINK /D d33 d32
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d34 d33
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d35 d34
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d36 d35
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d37 d36
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d38 d37
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d39 d38
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d40 d39
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d41 d40
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d42 d41
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d43 d42
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d44 d43
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d45 d44
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d46 d45
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d47 d46
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d48 d47
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d49 d48
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d50 d49
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d51 d50
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d52 d51
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d53 d52
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d54 d53
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d55 d54
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d56 d55
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d57 d56
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d58 d57
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d59 d58
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d60 d59
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d61 d60
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d62 d61
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d63 d62
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)
MKLINK /D d64 d63
IF ERRORLEVEL 1 (
  ECHO ERROR: mklink failed.  This script must be run as an administrator.
  GOTO :go_back_to_orig_dir
)


:go_back_to_orig_dir

CD "%orig_working_dir%"
