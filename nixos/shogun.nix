{ config, pkgs, ... }:

{
  services.keyd = {
    enable = true;
    keyboards = {
    # The name is just the name of the configuration file, it does not really matter
    default = {
      ids = [ "*" ]; # what goes into the [id] section, here we select all keyboards
      # Everything but the ID section:
      settings = {
        # The main layer, if you choose to declare it in Nix
        main = {
          capslock = "enter";
          delete = "backspace";
          rightalt = "backslash"; 
        };
        control = {
           insert = "delete";
           rightalt = "|";
	};
      };
      extraConfig = ''
        # put here any extra-config, e.g. you can copy/paste here directly a configuration, just remove the ids part
      '';
    };
  };
  };
}
