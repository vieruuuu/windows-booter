import os, osproc, strutils

let response = execProcess("""zenity --height 300 --width 300 --list  --title "Windows Selection" --column="Option" "VM without GUI" "VM show GUI" "VM with GUI" "Boot to Windows"""")

if response.contains("VM without GUI"):
  discard execCmdEx("""/bin/vmrun -T ws start "/root/vmware/Windows 10 x64/Windows 10 x64.vmx" nogui""")
elif response.contains("VM show GUI"):
  discard execCmdEx("""/bin/vmware""")
elif response.contains("VM with GUI"):
  discard execCmdEx("""/bin/vmware -qX "/root/vmware/Windows 10 x64/Windows 10 x64.vmx"""")
elif response.contains("Boot to Windows"):
  discard execCmdEx("""grub-reboot "Windows Boot Manager (on /dev/sda1)" """)
  discard execCmdEx("""reboot """)
