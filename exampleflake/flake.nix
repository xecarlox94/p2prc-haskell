{
  description = "Example project using P2PRC";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    p2prc.url = "github:xecarlox94/p2p-rendering-computation";
  };

  outputs = { self, nixpkgs, p2prc, ... }:
    let

      system = "x86_64-linux";

      npkgs = import nixpkgs {
        inherit system;
      };

    in {

      # packages.${system}.default = haskellPackages.developPackage {
        # root = ./.;
      # };

      devShells.${system}.default = npkgs.mkShell {
        buildInputs = [
          p2prc.packages.${system}.default
          npkgs.cabal-install
          npkgs.cabal2nix
          npkgs.zlib
        ];

      };


    };
}

