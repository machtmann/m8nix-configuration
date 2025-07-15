{ inputs, pkgs, ... }: {

  programs = {
    firefox = {
      enable = true;
        languagePacks = [ "de" "en-US" ];
        profiles = {
          default = {
            id = 0;
            name = "default";
            isDefault = true;
            settings = {
              "browser.startup.homepage" = "https://mail.google.com";
              "browser.search.defaultenginename" = "Google";
              "browser.search.order.1" = "Google";
            };
            bookmarks = {
              force = true;
              settings = [
                # {
                #   name = "";
                #   tags = "";
                #   keyword = "";
                #   url = "";
                # }
              ];
            };
            search = {
              force = true;
              default = "google";
              order = [ "google" ];
              engines = {
                "Nix Packages" = {
                  urls = [{
                    template = "https://search.nixos.org/packages";
                    params = [
                      { name = "type"; value = "packages"; }
                      { name = "query"; value = "{searchTerms}"; }
                    ];
                  }];
                  icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                  definedAliases = [ "@np" ];
                };
                "MyNixOS" = {
                  urls = [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
                  icon = "https://mynixos.com/icon.svg";
                  updateInterval = 24 * 60 * 60 * 1000; # every day
                  definedAliases = [ "@nw" ];
                };
                "NixOS Wiki" = {
                  urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                  icon = "https://nixos.wiki/favicon.png";
                  updateInterval = 24 * 60 * 60 * 1000; # every day
                  definedAliases = [ "@nw" ];
                };
                google.metaData.alias = "@g";
              };
            };

            # lookup available extensions here https://nur.nix-community.org/repos/
            extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
              darkreader
              keepassxc-browser
              ublock-origin
              vimium
            ] ++ [
              pkgs.nur.repos.meain.firefox-addons.netflix-prime-auto-skip
            ];
          };
        };
      };
    };
  }

