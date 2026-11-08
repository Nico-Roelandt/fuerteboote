{
  description = "UEFI Secure Boot for GRUB on NixOS";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosModules.default = ./nix/module.nix;

      checks.${system} = import ./nix/tests.nix {
        inherit pkgs;
        module = self.nixosModules.default;
      };
    };
}
