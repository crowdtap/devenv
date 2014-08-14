#!/bin/bash
#
# Crowdtap Dev Environment
#

set -e

if [ "$#" -ne 1 ]; then
  echo "Usage: devenv <ssh|start|stop|update>"
  echo ""
  echo "  rebuild: Wipe out the VM and rebuild from scratch"
  echo "  ssh:     SSH into the environment"
  echo "  start:   Bring up the environment"
  echo "  stop:    Bring down the environment"
  echo "  update:  Update all components"
  echo ""
  exit 0
fi

WHERE_AM_I="$( cd "$(dirname "$0")" && pwd )"
cd $WHERE_AM_I/..

case "$1" in
  rebuild)
    vagrant reload --provision
    ;;
  ssh)
    vagrant ssh
    ;;
  start)
    vagrant up
    ;;
  stop)
    vagrant halt
    ;;
  update)
    git pull
    vagrant ssh -c "find /vagrant/images/* -type d | xargs -i basename {} | xargs -i docker pull crowdtap/{}"
    ;;
esac

cd - > /dev/null
