# Errata

> Last Updated: 10/21/2019

We don't ever want to have problems with the course material, but sometimes it happens. Check this space for
the latest information on any known issues, and how to mitigate any negative impact for students.

If you uncover a problem with the course material that isn't covered here,
email [Josh](jwright@willhackforsushi.com) or [Mike](mike@socialexploits.com).
You can also check the [GitHub Issue
Tracker](https://github.com/joswr1ght/SANS-504-Labs-wiki/issues) (email
[Josh](jwright@willhackforsushi) with your GitHub username for access).

## SEC504-E01.4, USB 504.19.4

> 10/21/2019

Two issues affecting labs.

### RITA is Missing

#### Problem

<pre>
sec504@slingshot:~$ rita
No command 'rita' found, did you mean:
 Command 'krita' from package 'krita' (universe)
rita: command not found
</pre>

#### Workaround

Ask students to run `update-labs` to restore RITA:

<pre>
sec504@slingshot:~$ update-labs
[sudo] password for sec504: 
Connected.
Running lab update script.
--2019-10-21 18:34:57--  https://joswr1ght.github.io/update-labs/sec504/go.tgz
Resolving joswr1ght.github.io (joswr1ght.github.io)... 185.199.111.153, 185.199.109.153, 185.199.110.153, ...
Connecting to joswr1ght.github.io (joswr1ght.github.io)|185.199.111.153|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 38253377 (36M) [application/octet-stream]
Saving to: ‘/tmp/go.tgz’

/tmp/go.tgz         100%[=================>]  36.48M  17.9MB/s    in 2.0s    

2019-10-21 18:35:00 (17.9 MB/s) - ‘/tmp/go.tgz’ saved [38253377/38253377]

Update complete!
Done.
sec504@slingshot:~$ rita
NAME:
   rita - Look for evil needles in big haystacks.

USAGE:
   rita [global options] command [command options] [arguments...]

VERSION:
   v1.0.0-alpha-128-g3cec55b

COMMANDS:
     analyze                 Analyze imported databases, if no [database,d] flag is specified will attempt all
     delete-database         Delete an imported database
     import                  Import bro logs into the database
     html-report             Write analysis information to html output
     reset-analysis          Reset analysis of one or more databases
     show-beacons            Print beacon information to standard out
     show-blacklisted        Print blacklisted information to standard out
     show-databases          Print the databases currently stored
     show-exploded-dns       Print dns analysis. Exposes covert dns channels.
     show-long-connections   Print long connections and relevant information
     show-scans              Print scanning information
     show-long-urls          Print the longest urls
     show-most-visited-urls  Print the most visited urls
     show-user-agents        Print user agent information
     testconfig              Check the configuration file for validity
     help, h                 Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h     show help
   --version, -v  print the version
sec504@slingshot:~$ 
</pre>

#### Fix

The 504.19.5 USB image restores RITA.

### Incorrect Rook Aviary TCP Port in Printed Workbook

> 10/21/2019

#### Problem

For the XSS and SQLi labs, the printed workbook tells students to browse to `http://localhost:8080`. In the Slingshot
Linux VM, the Rook Aviary site is listening on TCP/9000.

#### Workaround

Ask students to browse to `http://localhost:9000` for the XSS and SQLi labs. Students working from the Wiki
will see the correct port number in the electronic workbook material.

#### Fix

The SEC504-E01.5 printed workbook correctly instructs students to browse to `http://localhost:9000` for the XSS and
SQLi labs.
