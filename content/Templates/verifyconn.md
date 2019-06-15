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

---
