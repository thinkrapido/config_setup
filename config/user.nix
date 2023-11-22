{
  root = {
    initialUser = "jbc";
  };
  jbc = rec {
    name = "jbc";
    config = {
        isNormalUser = true;
        description = "Romeo Disca";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
    };
    users = {
      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.${name} = config;
      extraGroups = { 
        audio.members = [ "${name}" ];
        docker.members = [ "${name}" ];
        vboxusers.members = [ "${name}" ];
      };
      extraUsers.${name}.extraGroups = [ "jackaudio" "docker" ];
    };
    nerdfonts = [ "Lekton" "JetBrainsMono" ];
  };
}
