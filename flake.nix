{
  description = "A collection of scripts for my personal use";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      monitorScript = (
        pkgs.writeShellScriptBin "reisen-monitor" (builtins.readFile ./monitor.sh)
      );
      restoreScript = (
        pkgs.writeShellScriptBin "reisen-restore" (builtins.readFile ./restore.sh)
      );
      nexus = (
        pkgs.writeShellScriptBin "nexus" (builtins.readFile ./ss.sh)
      );
    in
    {
      packages.${system} = {
        default = monitorScript;
        monitor = monitorScript;
        restore = restoreScript;
        inherit nexus;
      };
    };
}
