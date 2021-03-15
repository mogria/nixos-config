{ config, pkgs, ... }:

{
  /* driver displaylink requires linux < 5.3, linux_latest is 5.4 and I experienced some breakage anyway (sdcard). */
  # boot.kernelPackages = pkgs.linuxPackages_hardened;
  boot.kernelPackages = pkgs.linuxPackages;
  boot.extraModulePackages = with config.boot.kernelPackages; [ 
    exfat-nofuse
    cpupower
  ];
  boot.initrd.availableKernelModules = [ "ahci" "ohci_pci" "ehci_pci" "pata_atiixp" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];


  # Linux Kernel Hardening guide: https://madaidans-insecurities.github.io/guides/linux-hardening.html#sysctl
# boot.kernel = {

#   # SYSCTL HARDENING
#   sysctl = {
#     # hide kernel pointers & access to them
#     "kernel.kptr_restrict" = 2;
#     # also don't have them in dmesg
#     "kernel.dmesg_restrict" = 1;

#     # eBPF is also a big attack surface
#     "kernel.unprivileged_bpf_disabled" = 1;
#     "net.core.bpf_jit_harden" = 2;

#     # restrict loading TTY line desciplines
#     "dev.tty.ldisc_autoload" = 0;

#     # prevent some use-after-free exploits with userfaultfd()
#     "vm.unprivileged_userfaultfd" = 0;

#     # disable loading of arbitrary kernels
#     "kernel.kexec_load_disabled" = 1;

#     # disable SysRQ
#     # "kernel.unprivileged_userns_clone" = 0;
#     "kernel.unprivileged_userns_clone" = 1; # needs to be 1 to make chromium/electron work
#     # "user.max_user_namespaces" = 0; or even no user namespaces at all?

#     # disable performance events
#     "kernel.perf_event_paranoid" = 3;

#     ## Networking
#     # use SYN-cookies to prevent a SYN-flood
#     "net.ipv4.tcp_syncookies" = 1;

#     # protect against time-wait assassination
#     "net.ipv4.tcp_rfc1337" = 1;

#     # prevent IP-Spoofing by using source validation of packages on all interfaces
#     "net.ipv4.conf.all.rp_filter" = 1;
#     "net.ipv4.conf.default.rp_filter" = 1;

#     # Prevent some Man-In-The Middle attacks which use redirects, wrong advertisements
#     "net.ipv4.conf.all.secure_redirects" = 0;
#     "net.ipv4.conf.all.send_redirects" = 0;
#     "net.ipv4.conf.default.secure_redirects" = 0;
#     "net.ipv4.conf.default.send_redirects" = 0;
#     "net.ipv6.conf.all.accept_ra" = 0;
#     "net.ipv6.conf.all.accept_redirects" = 0;
#     "net.ipv6.conf.default.accept_ra" = 0;
#     "net.ipv6.conf.default.accept_redirects" = 0;

#     # disable tcp SACK
#     "net.ipv4.tcp_sack" = 0;
#     "net.ipv4.tcp_dsack" = 0;
#     "net.ipv4.tcp_fack" = 0;

#     # only allow ptrace with SYS_PTRACE cap
#     "kernel.yama.ptrace_scope" = 2;
#     
#     # improve entropy of ASLR mmap mitigation
#     # "vm.mmap_rnd_bits" = 32;
#     # "vm.mmap_rnd_compat_bits" = 16;
#     # those values are only good for x86

#     # protected symlinks, prevent some data races on files
#     "fs.protected_symlinks" = 1;
#     "fs.protected_hardlinks" = 1;
#     "fs.protected_fifos" = 2;
#     "fs.protected_regular" = 2;

#     # TODO: meltdown / spectre hardening
#     # TODO: intel microcode updates?
#   };
# };

# boot.kernelParams = [
#   # Kernel Hardening Params
#   "slab_nomerge" # prevent slab merging/overwriting heap objects
#   "slab_debug=F" # enable sanity checks for salb operations
#   "page_alloc.shuffle=1" # randomize page allocator freelists, make alloctions less predictable
#   "pti=on" # enable kernel page table isolation, meltdown, KSLR

#   "init_on_alloc=1" # zero memory on alloc
#   "init_on_free=1" # zero memory on free

#   "vsyscall=none" # obsolete and replaced by vDSO
#   "debugfs=off" # diable debugfs information leak

#   # "oops=panic" # kernel oops = panic, maybe problematic with certain drivers

#   # module.sig_enforce=1, # only load signed kernel module (doesn't work, I have NVIDIA graphics)
#   # lockdown=confidentiality

#   # mce=0, crash on ECC memory error which is exploitable (only usable when you have ECC)

#   "quiet" "loglevel=0"

#   # use apparmor instead of SELinux / no microphone in firefox/chromium this way??
#   # "apparmor=1" 
#   # "security=apparmor"
# ];

  # make electron apps & chromium work by enabling unprivileged userns clone
  security.allowUserNamespaces	= true;
}
