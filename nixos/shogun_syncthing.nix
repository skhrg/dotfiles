{ config, pkgs, ... }:

{
  services.syncthing = {
    settings = {
      folders = {
        "ogg_music" = {
          id = "hry7g-lepps";
          path = "/home/lordskh/Music";
          devices = [ "phone" "emperor" "shogun" ];
        };
      };
    };
  };
}
