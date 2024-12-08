{ pkgs, ... }: {
  home.packages = [ pkgs.vesktop ];

  home.file = {
	".config/vesktop/settings".source = ./settings;
	".config/vesktop/themes".source = ./themes;
	".config/vesktop/settings.json".source = ./settings.json;
  };
}
