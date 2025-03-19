{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #     nixvim = {
    #       url = "github:Ram-256bit/nixvim";
    #       inputs.nixpkgs.follows = "nixpkgs";
    #     };
    #     ghostty = {
    #       url = "github:ghostty-org/ghostty";
    #       #inputs.nixpkgs.follows = "nixpkgs/nixos-unstable";
    #     };
    #     firefox-nightly = {
    #       url = "github:nix-community/flake-firefox-nightly";
    #     };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      # catppuccin,
      # nixvim,
      # ghostty,
      # zed,
      nixpkgs-unstable,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = { inherit inputs; }; # Pass inputs to configuration.nix
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.rishabh = import ./home.nix;

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }
            # catppuccin.nixosModules.catppuccin
            # {
            #   nix.settings.extra-substituters = [
            #     "https://ghostty.cachix.org"
            #   ];
            #   nix.settings.extra-trusted-public-keys = [
            #     "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
            #   ];
            # }
          ];
        };
      };
    };
}
