{
  description = "Controls monitor using hyprctl";

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
    in
    {
      packages.${system} = {
        default = monitorScript;
        monitor = monitorScript;
        restore = restoreScript;
      };
    };
}
