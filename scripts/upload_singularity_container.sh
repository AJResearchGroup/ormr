#!/bin/bash
# Upload the Singularity container

singularity remote use SylabsCloud

# Log in, prevents error:
#
# FATAL:   Unable to push image to library: request did not succeed: Unauthorized (401 Unauthorized)
#
#
echo "To login, paste '~/.singularity/sylabs-token'"
echo 'Note that a token is valid for only 30 days, i.e. until february 14th 2022'
echo 'singularity remote login'

# Sign container
echo "To sign the container, paste your passphrase"
singularity sign ormr.sif

# Upload the latest version
singularity push ormr.sif library://richelbilderbeek/default/ormr:0.6.2.2

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done uploading 'ormr.sif'" "Done uploading 'ormr.sif'"
fi


