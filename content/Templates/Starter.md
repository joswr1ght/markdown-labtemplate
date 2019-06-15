# Title of Lab

Use this template as a starting point for your lab exercise.

## Brief Intro

Introduce the lab briefly

## Try It Yourself

Basic directions for the lab, such that advanced students could complete on their own additional direction.

## Walk Through

In this lab, you will ...

First, test that your VMs are networked correctly.

~~Retain or delete Verify Connectivity based on lab needs~~

### Verify Connectivity

On the Linux VM, test connectivity to the Windows VM using the `ping` utility:

<pre>
sec504@slingshot:~$ <b>ping -c 3 10.10.0.1</b>
PING 10.10.0.1 (10.10.0.1) 56(84) bytes of data.
64 bytes from 10.10.0.1: icmp_seq=1 ttl=128 time=0.872 ms
64 bytes from 10.10.0.1: icmp_seq=2 ttl=128 time=1.14 ms
64 bytes from 10.10.0.1: icmp_seq=3 ttl=128 time=1.40 ms

--- 10.10.0.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 0.872/1.141/1.404/0.218 ms
</pre>

Repeat this step, this time testing the connectivity from the Windows VM to the Linux VM:

<pre>
C:\Users\Sec504> <b>ping 10.10.75.1</b>

Pinging 10.10.75.1 with 32 bytes of data:
Reply from 10.10.75.1: bytes=32 time<1ms TTL=64
Reply from 10.10.75.1: bytes=32 time=1ms TTL=64
Reply from 10.10.75.1: bytes=32 time<1ms TTL=64
Reply from 10.10.75.1: bytes=32 time=1ms TTL=64

Ping statistics for 10.10.75.1:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 0ms, Maximum = 1ms, Average = 0ms
</pre>

If you are unable to get a response from the Windows VM or the Linux VM, take a
look at the [Testing Virtual Machine Connectivity](VM-Connectivity-Test.md)
module for troubleshooting steps.

### Step 1 Here

Directions for the lab. Command examples should be in &lt;pre&gt; tags using &lt;b&gt; for the parts
the user types in.

<pre>
sec504@slingshot:~$ <b>nc -l -p 2222</b>

</pre>

> Notes, tips, and other important pieces are called out with blockquotes like this.

Images have alt descriptions, referencing a path like this:

![Netcat Simple Chat Illustration](../pics/504.3/stdinnetcatlab.png)

After sending some data back and forth as _chat_ messages, close both the Netcat sessions by pressing

### Step 2 Here

In this next step, you will ...

## The Challenge 

Optional, special challenge for the lab for advanced students.

### DO NOT SCROLL FURTHER UNLESS YOU WANT HINTS


#### Hint #1 

Hint text here.

#### Hint #2

Hint test here.

#### One Possible Answer

Answer to challenge here.

<pre>
sec504@slingshot:~$ <b>nc -l -p 4444 -e /bin/sh</b>

</pre>

## Why This Lab is Important

## Bonus (If Time Permits or for Homework)

* Suggestions and steps for bonus material.


## Additional Resources

Links, reading material, course references.

