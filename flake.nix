{
  description = "The manual pages for Lua 5.1 C API";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ];
    in
    {
      packages = forAllSystems (system: let
        pkgs = import nixpkgs { inherit system; };
      in {
        default = pkgs.stdenv.mkDerivation {
          pname = "lua-c-manual-pages";
          version = "0.1.3";

          src = ./.;

          buildPhase = ":";

          installTargets = [ "install" ];

          makeFlags = [ "PREFIX=${placeholder "out"}" ];

          meta = with pkgs.lib; {
            description = "The manual pages for Lua 5.1 C API";
            longDescription = ''
              A set of manual pages that covers Lua 5.1 C API described in
              Lua 5.1 Reference Manual. It includes:

              - 3.7 - Functions and Types
              - 3.8 - The Debug Interface
              - 4.1 - Functions and Types
            '';
            homepage = "https://github.com/ligurio/lua-c-manual-pages";
            license = licenses.mit;
            platforms = platforms.linux;
            maintainers = [ "Sergey Bronnikov" ];
          };
        };
      });

      devShells = forAllSystems (system: let
        pkgs = import nixpkgs { inherit system; };
      in {
        default = pkgs.mkShell {
          packages = with pkgs; [
            gnumake
            mandoc
          ];
        };
      });
    };
}
