#!/usr/bin/env sh
brew tap slp/krunkit
brew install \
  hexcurse \
  wireshark wireshark-app \
  utm crystalfetch \
  lnav \
  podman podman-tui podman-compose podman-desktop krunkit


function is_podman_ready {
  # echo "is podman ready ?"
  machines_count=$(podman machine list |wc -l)
  if [ "$?" -ne 0 ]
  then
  # echo "echec de machine list" 
    echo -1
    return
  fi
  if [ "$machines_count" -lt 1 ]
  then
  # echo "echec de machine count" 
    echo -2
    return
  fi
  podman machine
  # echo "podman is ready" 
  echo 0
}
function init_podman {
  podman machine init -m 4096 -c 8 podman-machine-default
  podman machine start podman-machine-default
}

function download_podman_images {
  # echo "download podman images" 
  podman pull remnux/remnux-distro:focal
}

init_podman && download_podman_images
