# Firefox Audit - Script Execution Outputs

This document contains simulated terminal outputs for the 5 audit scripts.

---

## 1. System Identity Report (`01-identify.sh`)
```bash
Siddharthtomar006@ubuntu-server:~/Firefox$ ./01-identify.sh
================================================================================
                   Firefox AUDIT - SYSTEM IDENTITY                    
================================================================================
Linux Distribution: Ubuntu 22.04.3 LTS
Kernel Version:     5.15.0-89-generic
Current User:       Siddharthtomar006
Home Directory:     /home/Siddharthtomar006
System Uptime:      up 2 hours, 45 minutes
Current Date/Time:  Mon Mar 30 2026 19:47:44 GMT+0000 (Coordinated Universal Time)
--------------------------------------------------------------------------------
Message: This system runs on Open Source software, providing freedom to study, change, and distribute.
================================================================================
```

---

## 2. FOSS Package Inspector (`02-packages.sh`)
```bash
Siddharthtomar006@ubuntu-server:~/Firefox$ ./02-packages.sh
================================================================================
                   Firefox AUDIT - PACKAGE INSPECTOR                 
================================================================================
Status: firefox is INSTALLED on this ubuntu system.
Version: 129.0+buildxyz
--------------------------------------------------------------------------------
FOSS Philosophy Notes:
 - Firefox: A web browser that champions open web standards and user privacy.
 - LibreOffice: Provides a free, feature‑rich office suite, ensuring document freedom.
 - GIMP: A powerful image editor that respects artists' rights to modify their work.
 - VLC: A versatile media player that supports countless formats without DRM.
================================================================================
```

---

## 3. Disk and Permission Auditor (`03-auditor.sh`)
```bash
Siddharthtomar006@ubuntu-server:~/Firefox$ ./03-auditor.sh
================================================================================
                   Firefox AUDIT - DISK & PERMISSION AUDITOR          
================================================================================
Directory                       Size       Permissions   Owner
--------------------------------------------------------------------------------
/etc                            12M        drwxr-xr-x    root
/var/log                        48M        drwxr-xr-x    syslog
/usr/share                      1.2G       drwxr-xr-x    root
/opt                            0          N/A           N/A
/usr/lib/firefox                250M       drwxr-xr-x    root
/etc/firefox                    4.0K       drwxr-xr-x    root
================================================================================
```

---

## 4. Log File Analyzer (`04-logs.sh`)
```bash
Siddharthtomar006@ubuntu-server:~/Firefox$ ./04-logs.sh /var/log/syslog error
================================================================================
                   Firefox AUDIT - LOG FILE ANALYZER                
================================================================================
Log File   : /var/log/syslog
Keyword    : error
Total Matches Found: 7
--------------------------------------------------------------------------------
Last 5 matching entries:
Mar 30 19:12:01 ubuntu-server systemd[1]: Failed to start error handling service.
Mar 30 19:15:44 ubuntu-server firefox[2745]: [ERROR] Failed to load profile.
Mar 30 19:20:10 ubuntu-server kernel: [error] Unexpected IRQ.
Mar 30 19:35:22 ubuntu-server firefox[2745]: [ERROR] Network request failed.
Mar 30 19:45:55 ubuntu-server systemd[1]: error while processing unit.
================================================================================
```

---

## 5. Open Source Manifesto Generator (`05-manifesto.sh`)
```bash
Siddharthtomar006@ubuntu-server:~/Firefox$ ./05-manifesto.sh
1) What core principle of Open Source inspires you the most? Collaboration and transparency
2) In one sentence, why do you prefer Firefox over other browsers? Because it respects my privacy while supporting web standards
3) How will you contribute to the Open Source community this year? By submitting bug reports and writing documentation for Firefox extensions
Your manifesto has been saved to Siddharthtomar006_manifesto.txt
```
