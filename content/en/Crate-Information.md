# Course Crate Information

Everyone who teaches SEC504 receives a crate of equipment. Here's what you can expect inside:

  + CTF laptops (2, or 4 depending on their age)
  + 20-sided dice (for the tabletop exercise on day 1)
  + Emergency Repair Kit (ERK) with VMware and images for the CTF targets

## Locks

The combo for the crate locks is *7-6-2-7* (S-A-N-S spelled backward using the phone touchpad).

## Laptop Passwords

Login to the laptops with a user ID of Instructor and a password of
thisistheh0stpassword (that’s a zero in h0st, not an O).  The Instructor
account is in the administrators’ group.  If the Instructor account gets messed
up, you could alternatively use the account administrator, with a password also
set to thisistheh0stpassword.

## Restore Snapshots

It's a good idea to restore the laptop VMs to the latest snapshot before starting the CTF. In the
event of a missing flag, or a crashed VM, just restore the latest snapshot.

> Tip: Sometimes VMware will hang when a host is non-communicative (e.g. a BSOD), even when restoring
> a snapshot. If this happens, open Task Manager and kill the `vmware-vmx` process to terminate the
> problematic VM, then restore the snapshot to jump to the running state.

## Emergency Download

If needed, the CTF VMs can be downloaded here from the SEC504 S3 bucket:

+ Please go to cyberduck.io and install Cyberduck
+ Launch Cyberduck
+ Click open Connection and change drop down from FTP to Amazon S3
+ Enter the following Access Key ID and password:

> Access Key ID: REDACTED

> Password: REDACTED

## Returning Your Crate

After class, repack the crate carefully. Return the crate to the conference/event manager, or
ship back to the SANS Warehouse for Onsite or Community events. If in doubt, reach out to
your event coordinator for assistance.
