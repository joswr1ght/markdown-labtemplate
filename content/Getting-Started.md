# Getting Started

Follow these steps to get started with the virtual machine systems you will use for class exercises.

> If you have already copied the lab VMs to your computer, decompressed, and booted the systems following
> the course lecture introductory material, you don't have to do it again here!

## Brief Intro

Using VMware you will boot and run two virtual machine (VM) systems for the class lab exercises. The
VM systems are supplied on your class USB drive. In this _getting started_ guide you will copy the compressed
VMs to your local hard drive, decompress them, and boot the two systems.

## Walkthrough

### VMware Required

All of the class lab exercises will utilize VMware as the _hypervisor_ to boot and run the lab VMs. Please
ensure you have already downloaded and installed VMware on your laptop.

If you have not already installed VMware, download and install it now for your platform:

+ [VMware Workstation Player for Windows Systems](https://www.vmware.com/products/workstation-player.html)
+ [VMware Fusion for macOS Systems](https://www.vmware.com/products/fusion.html)

You may be eligible for a free trial period of VMware Workstation Player or VMware Fusion.

> We do not support the use of other virtualization products such as VirtualBox or Hyper-V in this class. You are
> welcome to experiment and try to use these platforms, but we cannot support any problems that may arise.

### Copy the VM Files

Insert the USB drive into your laptop. Using Windows Explorer or Finder (macOS), copy the `Class VMs` folder to your
desktop or another convenient location. This will take several minutes to complete.

### Install 7-Zip or The Unarchiver

The Slingshot Linux and Slingshot Linux VMs are compressed using the 7-Zip algorithm. To decompress these files, install
an appropriate decompression tool:

+ For Windows Users: Launch the `7z1900-x64.exe` installer included on the USB drive, accepting the defaults.
+ For macOS Users: Unzip the `TheUnarchiver.zip`, revealing the `TheUnarchiver.app` program.

### Decompress the Windows 10 VM

Decompress the Windows 10 VM using 7-Zip (Windows) or The Unarchiver (macOS). This will take several minutes to
complete.

### Launch the Windows 10 VM

Launch the Windows 10 VM by double-clicking on the VMware `.vmx` file. VMware will indicate that the virtual machine
might have been copied or moved. Select **I Copied It** when prompted.

![VMware Dialog Prompt](pics/vmware-copymove.png)

### Log In to the Windows 10 VM

After the Windows 10 VM finishes booting, log in with the following username and password:

+ Username: **sec504**
+ Password: **sec504**

> That's the last step for Windows! You can keep the Windows 10 VM running and continue to experiment, or shut it
> down until you need it for a lab exercise. Next, we will repeat these steps for the Slingshot Linux VM.

### Decompress the Slingshot Linux VM

Decompress the Slingshot Linux VM using 7-Zip (Windows) or The Unarchiver (macOS). This will take several minutes to
complete.

### Launch the Slingshot Linux VM

Launch the Slingshot Linux VM by double-clicking on the VMware `.vmx` file. VMware will indicate that the virtual machine
might have been copied or moved. Select **I Copied It** when prompted.

![VMware Dialog Prompt](pics/vmware-copymove.png)

### Log In to the Slingshot Linux VM

After the Slingshot Linux VM finishes booting, log in with the following username and password:

+ Username: **sec504**
+ Password: **sec504**

> That's the last step! You can keep the Slingshot Linux VM running and continue to experiment, or shut it
> down until you need it for a lab exercise.
