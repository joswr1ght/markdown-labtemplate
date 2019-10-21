# Course Update Information

## SEC504 E01 Change Summary

Joshua Wright and Mike Murr, 4/2/2019

### Labs

+ Every lab has been rewritten to remove screenshots, replaced with inline text. This change improves legibility and accessibility throughout the course.
+ Inline text has been formatted so it is very clear what the student needs to type to complete each exercise using bold, red text.
+ Each lab has been modified to identify the requirements for the lab (Windows VM, Linux VM, or both).
+ Legibility and format of labs has been redone to make them consistent, easy to follow, and extensible for future enhancements to delivery format.
+ Modified labs to fully embrace the transition to supplying a Windows 10 VM to students. References to Windows XP and Windows 7 lab VMs have been removed. All references to IP addresses and other steps intended to deal with disparate student VMs have been removed.
+ Added new lab: OSINT with Spiderfoot.
+ Rewrote the XSS and SQLi labs to use the new target website _Rook Aviary Services_ (graciously developed by Derek Rook!)
+ Lots of modifications to the John the Ripper and Hashcat exercises. Split into two labs where formerly it was one.
+ Updated Windows 10 VM to current patch level
+ Added SysInternals, Sysmon-Modular, and Sysmon-Config-Master to Windows (not used in any labs at the moment but available for instructor walkthroughs or new lab exercises)
+ Added update-wiki.ps1, update-labs.ps1 to Windows
+ Lots of small tweaks to Slingshot, but substantially:
  + Removed Nessus
  + Updated Metasploit to v5.0.14-dev
  + Lots of cleanup of unnecessary files, deleted items, old log files, etc.
  + Added update-wiki, update-labs

### Day 1

+ Rewrote directions for setting up the class VMs
+ Rewrote the directions for online students for the _My Labs_ Portal feature per Charlie McCowan
+ New slides to introduce labs, describing the option to use the print workbook or wiki, and _Anatomy of Labs_ to set student expectations for what is included in a lab exercise.
+ Cleaned up formatting on all transition slides
- Changed *Enterprise-Wide Identification and Analysis* to *Enterprise Ident. &
  Analysis* on all transition slides
- Changed *Intro to Linux Workshop* to *Intro to VMware & Linux Workshop*
- Updated the arrow shapes on *Intro to Linux* transition slides
- Renamed many slides
- Removed Appendix B (Linux Cheatsheet) since it was moved to the wiki.
- Removed *Intellectual Property* section.
- Removed the *Key Points: Interface with Law Enforcement* slide.
- Removed several Jump Bag slides.
- Removed *Now Ping* slide.
- Added a new slide with screenshot of GRR (no title, page 40)
- Added a new slide with screenshot from *Host Perimeter Detect: netstat* slide (no title, page 50)
- Added a new slide with updated screenshot from the *Application-Level Detection* slide (*Application-Level Detect: Wordpress*, page 55)
- Added a new slide by separating out the contents of the *Examining Processes* slide (*Examining Processes with WMIC*, page 65)


### Day 2

+ Removed Remux.py
+ Removed Enum.exe
+ Added SharpView for SMB enumeration (replacing enum)
+ Revised SMB password guessing (mostly reformatting, reflecting Enum removal)
+ Removed content on NULL SMB sessions
+ Removed _General Trends: Software Distro Site Attacks_ and associated defenses (ISR-Evilgrade is unmaintained)
+ All new Wi-Fi module (all GIAC questions on Wi-Fi should be reevaluated)
+ Removed slide "Additional Search Tips and Types" (web searches)
+ Removed slide "Google Maps and Planning Physical Access" (covered later in the course)
+ Removed a screenshot of Pushpin
+ Removed Dsniff references (tool had already been removed, just cleaning up remnants)



### Day 3

+ Removed slide _Essential Netcat Command Switches_
+ Removed the vulnerability assessment feature discussion for Netcat (retained port scanning)
+ Integrated slide _More Netcat Backdoors: Reverse Shells_ with previous content _Netcat Backdoors_
+ Removed Subterfuge slide
+ New slide, _Netcat Closing_
+ Removed EMET in favor of Windows Defender Exploit Guard
+ Removed some historical information about stack canaries including the Phrack 56 reference from 2000
+ Removed Veracode binary analysis tools (no longer available)
+ Expanded Ghostwriting section with examples, commands
+ Removed references to Application Whitelisting Bypassing being an "_art_".
+ Endpoint bypass, removed InstallUtil slide for `InstallUtil-Shellcode-cs`, merging some of the concepts into the prior slide.
+ Removed SCT endpoint bypass slides.
+ Removed BGP section (1 slide and title transition slide)
+ Replaced Xplico with Network Miner
+ Removed Dsniff references (tool had already been removed, just cleaning up remnants)
+ Updated slide "Creating Evil Macros in Veil" to reflect current Veil version
+ Added Logstash CAMTableExport.ps1 by Justin Henderson to ARP hijacking defenses/Identification

### Day 4

+ Removed Cain
+ Rework order and arrangement of password cracking sections
+ Wrote a new section on password hashing, trimming a lot of content on LANMAN (but retaining one slide explaining it)
+ Removed detailed field explanations for /etc/passwd and /etc/shadow from JtR section
+ Added examples of JtR in use
+ Expanded Hashcat section
+ Removed several slides from Worms and Bots section (Warhol/Flash, Polymorphism, Truly Nasty Payload, Metamorphic Worms, Fast Flux Bot
+ Removed "XSS via Other Mechanisms" including notes on the Bell-LaPadula system
+ Removed slide "Bot DoS Suites" (it's a one-slide section)
+ Removed references to WebScarab (no longer maintained, OWASP recommends ZAP)
+ Removed references to HP SPI Dynamics (no longer commercial product from HP)
+ Removed slide "Dictionary Attacks" (topic covered in previous slide "Methods of Password Cracking"
+ Removed slide "Brute Force Attacks" (topic covered in previous slide "Methods of Password Cracking"
+ Removed slide "Hybrid Attacks" (topic covered in previous slide "Methods of Password Cracking"
+ Removed the advice to disable LANMAN and NTLMv1 network auth (to which I think it means MS-CHAPv2 authentication). This advice is already in day 3 with SMB configuration recommendations.
+ Removed slide "Defenses: UNIX Password Cracking" (merged advice into next slide)
+ Removed slide "Examples: Dropping Data" (feels like one too many SQL injection impact slides)
+ Rewrote defenses for SQL injection to prioritize the use of parameterized queries vs. input filtering
+ Added server-based defenses and client-specific controls for XSS defense including Content-Security-Policy.
+ Lots of changes to this day; a _net_ 5-slide trim from D01

### Day 5

+ Removed Ionx Data Sentinel tool (no notes supporting why this is a useful alternative to other previously mentioned commercial tools)
+ Removed slide "Altering the Kernel"; this topic is explained in subsequent slides with better examples, redundant to cover it here as well.
+ Removed slide "Editing Logs with Physical Access" (this section doesn't actually cover editing logs, only booting from alternate medium and deleting log files).
+ Removed all references to Avian Transport Protocol because 🐦
+ Removed Course Roadmap slide section markets separating the Covering Tracks on the Network section, making it one unified, uninterrupted module
+ Removed slide "Extending the Ideas of Covert_TCP"
+ Removed slide "Rootkit Platforms"
+ Added references to NSA Ghidra RE platform

### Day 6

+ Removed slides "VMware Bridged Networking", "Setting up Windows", "Setting up Linux" (in favor of detailed instructions in wiki/lab workbook)





