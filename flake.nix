{
  description = "Control the bullx blade system b520 from the commandline";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      rec {
        pkgs = import nixpkgs { inherit system; };

        name = "bladectl";
        packages.default = (with pkgs;   stdenv.mkDerivation
          rec {
            pname = "bladectl";
            version = "0.0.0";

            src = ./.;

            buildInputs = [
              argbash
              curl
              gnused
              makeWrapper
            ];

            buildPhase = ''
              argbash $src/bladectl.argbash -o bladectl.sh --type bash-script
            '';

            installPhase = ''
              mkdir -p $out/bin
              cp bladectl.sh $out/bin/${pname}
                
              wrapProgram "$out/bin/${name}" --prefix PATH : ${lib.makeBinPath [curl gnused]}
              chmod a+x $out/bin/${pname}
            '';

            meta.mainProgram = "${pname}";
          });
      }
    );
}
