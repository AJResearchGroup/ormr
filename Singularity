Bootstrap: library
From: richelbilderbeek/default/plinkr:0.17.2.1

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get -y update
    apt-get -y install python3 wget
    apt-get -y clean

    # 'ormr' needs this
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -b -p miniconda
    export PATH=/miniconda/bin:$PATH
    rm Miniconda3-latest-Linux-x86_64.sh
    conda update conda

    Rscript -e 'install.packages("semver")'
    Rscript -e 'install.packages("reticulate")'
    Rscript -e 'remotes::install_github("richelbilderbeek/ormr")'
    Rscript -e 'install_python_package(ormr_folder_name = "/opt/ormr", package_name = "scipy")'
    Rscript -e 'ormr::ormr_report(ormr_folder_name = "/opt/ormr")'

# 'ormr' needs this
%environment
    export PATH=/miniconda/bin:$PATH

%runscript
exec R --vanilla --silent --no-echo "$@"

%test
    Rscript -e 'ormr::is_gcae_installed(gcae_options = ormr::create_gcae_options(gcae_folder = "/opt/ormr"), verbose = TRUE)'

%help

This container has the R package ormr installed.

To make the container run a script called, e.g. `script.R`, do:

```
cat script.R | ./ormr.sif
```

Within the script, set `ormr_folder_name` to `"/opt/ormr"`, for example:

```
library(ormr)
ormr_report(ormr_folder_name = "/opt/ormr")
```

%labels

    AUTHOR Richel J.C. Bilderbeek

    NAME ormr

    DESCRIPTION The ormr R package, with PLINK and the minimal ormr Python packages installed

    USAGE simply run the container

    URL https://github.com/richelbilderbeek/ormr

    VERSION 0.6.0

