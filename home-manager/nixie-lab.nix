{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # I split up my configuration and imported pieces of it here:
    ./modules/nixpkgs
    ./modules/zsh
    ./modules/bash
    ./modules/neovim
    ./modules/fzf
    ./modules/eza
    ./modules/gpg
    ./modules/zoxide
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "mohammad";
    homeDirectory = "/home/mohammad";
  };

  home.packages = with pkgs; [
    file
    curl
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
