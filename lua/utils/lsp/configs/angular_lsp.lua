return {
  cmd = {
    "/home/tma/.asdf/installs/nodejs/22.16.0/bin/ngserver",
    "--stdio",
    "--tsProbeLocations",
    "/home/tma/.asdf/installs/nodejs/22.16.0/lib/node_modules/@angular/language-server",
    "--ngProbeLocations",
    "/home/tma/.asdf/installs/nodejs/22.16.0/lib/node_modules/@angular/language-server",
  },
  on_new_config = function(new_config, new_root_dir)
    local ng_lib_path = "/home/tma/.asdf/installs/nodejs/22.16.0/lib/node_modules/@angular/language-server"
    new_config.cmd = {
      "ngserver",
      "--stdio",
      "--tsProbeLocations",
      ng_lib_path .. "," .. new_root_dir,
      "--ngProbeLocations",
      ng_lib_path .. "," .. new_root_dir,
    }
  end,
}
