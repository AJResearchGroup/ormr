#!/bin/bash
#
# Build the Singularity container called `ormr.sif`
# from the Singularity recipe `Singularity` (which is a default
# name for a Singularity recipe)
#
# Usage:
#
# ./scripts/build_singularity_container.sh
#
#
sudo -E singularity --quiet build ormr.sif Singularity

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done creating 'ormr.sif'" "Done creating 'ormr.sif'"
fi

