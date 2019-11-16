{ pkgs, ...}:

{
  # nix.distributedBuilds = true;

  nix.buildMachines = [{
    hostName = "voidbook";
    sshUser = "nix-ssh";
    sshKey = "/root/.ssh/id_buildfarm";
    system = "x86_64-linux";
    maxJobs = 8;
    speedFactor = 8;
  }];
}
