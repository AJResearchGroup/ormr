# ormr

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/ormr/actions)|[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)                                                                                          |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/ormr/actions)          
---------|---------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/ormr/workflows/R-CMD-check/badge.svg?branch=master)   |[![codecov.io](https://codecov.io/github/richelbilderbeek/ormr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/ormr/branch/master)  |![build_singularity](https://github.com/richelbilderbeek/ormr/workflows/build_singularity/badge.svg?branch=master) 
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/ormr/workflows/R-CMD-check/badge.svg?branch=develop)  |[![codecov.io](https://codecov.io/github/richelbilderbeek/ormr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/ormr/branch/develop)|![build_singularity](https://github.com/richelbilderbeek/ormr/workflows/build_singularity/badge.svg?branch=develop)

![`ormr` logo](man/figures/ormr_logo_50.png)

Work with Python installed at a custom location.

# Goal

`ormr` allows a user to install Python packages,
create a Conda environment and run Python scripts
with only one point of contact.

`ormr` heavily depends on `reticulate`, the latter being
more powerful and flexible. `ormr`, however, focuses
on making it trivially simple to install Python
packages and run Python scripts.

# Install `ormr`

As `ormr` is developed on the `master` branch, only a release
is tested to work:

```
remotes::install_github("richelbilderbeek/ormr", ref = "v0.6.1")
```

See FAQ why one needs to install a release.

# Examples

`ormr` uses one point of contact, `ormr_folder_name`.
For convenience, there is also a default `ormr_folder_name`.

  1. Install a Python package
  2. Run a Python script
  3. Run a Python script with command-line arguments

Also, `ormr` uses **eager loading**, which means that
it will setup everything it needs for you. For example,
if you want to run a Python script from a new `ormr_folder_name`,
it will create a Conda environment there for you as well.

Note that `create_default_conda_env` conveniently returns the
`ormr_folder_name` used to work with this environment.

## 1. Install a Python package

Using the default `ormr` environment:

```r
install_python_package(
  package_name = "scipy"
)
```

Using a custom `ormr_folder_name`:

```r
ormr_folder_name <- tempfile()

install_python_package(
  ormr_folder_name = ormr_folder_name,
  package_name = "scipy"
)
```

## 2. Run a Python script

Using the default `ormr` environment:

```r
python_script_path <- system.file(
  "extdata", "hello_world.py", package = "ormr"
)
run_python_script(
  python_script_path = python_script_path
)
```

Using a custom `ormr_folder_name`:

```r
ormr_folder_name <- tempfile()
python_script_path <- system.file(
  "extdata", "hello_world.py", package = "ormr"
)
run_python_script(
  ormr_folder_name = ormr_folder_name,
  python_script_path = python_script_path
)
```

## 3. Run a Python script with command-line arguments

Using the default `ormr` environment:

```r
python_script_path <- system.file(
  "extdata", "show_args.py", package = "ormr"
)
run_python_script_with_args(
  python_script_path = python_script_path,
  args = c("Hello", "world")
)
```

Using a custom `ormr_folder_name`:

```r
ormr_folder_name <- tempfile()
python_script_path <- system.file(
  "extdata", "show_args.py", package = "ormr"
)
run_python_script_with_args(
  ormr_folder_name = ormr_folder_name,
  python_script_path = python_script_path,
  args = c("Hello", "world")
)
```

# FAQ

## What is the goal of `ormr`?

`ormr` allows a user to install Python packages,
create a Conda environment and run Python scripts
with only one point of contact.

## In what context is `ormr` useful?

`ormr` was written to write simpler 
[Singularity](https://singularity.hpcng.org/) (a type of containerization
software, similar to Docker) scripts.

`reticulate` is great when using its default folders on a local computer.
However, for a Singularity container, it is recommended to install
libraries in a systems folder. In that setting, `reticulate` is
harder to work with.

`ormr` allows to install install Python packages,
create a Conda environment and run Python scripts
in any folder easily, for example,
in a system folder (`/opt/ormr`) of a Singularity container.

## Why not just use `reticulate`?

`ormr` heavily depends on `reticulate`, the latter being
more powerful and flexible. 

`ormr`, however, focuses
on making it trivially simple to install Python
packages and run Python scripts,
due to eager loading.
Additionally, `ormr` has a more extensive documentation,
and 100% code coverage.

Beyond the domain of `ormr`, use `reticulate`.

## What do you mean with eager loading?

Eager loading is the opposite of lazy loading.

Here, it is defined as 'if you want `ormr` to do B, which depends on 
the setup of A', `ormr` will setup A, then do B. For example, to install
a package to a certain `ormr_folder_name` ('to do B'), `ormr`
will create a Conda environment for that ('the setup of A').

This means that no setup code is necessary.

## Why does one need to install a release, instead of just `master`?

The development of `ormr` takes place on the `master` branch.
Hence, `master` will break regularily.
A specific release is tested to build correctly.

The reason for this non-traditional workflow, is that the
Singularity script always installs the `master` branch,
as it cannot detect the `git` branch is being built by.

## There is a feature I miss

See [CONTRIBUTING](CONTRIBUTING.md), at `Submitting use cases`

## I want to collaborate

See [CONTRIBUTING](CONTRIBUTING.md), at `Submitting code`

## I think I have found a bug

See [CONTRIBUTING](CONTRIBUTING.md), at `Submitting bugs` 

## There's something else I want to say

Sure, just add an Issue. Or send an email.

## How do I contribute?

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Why is the package called `ormr`?

This name is a pun on `reticulate`. `reticulate` is named after a
type of snake. `ormr` is written in Sweden. In Swedish, `orm`, is a snake.
Following the common tradtion of adding an `r` to the end of an R package 
name (e.g `dplyr`, `tidyr`, etc) resulted in `ormr`.

## What about the logo?

The original snake image was found when searching for a
public domain image of a snake, using the following DuckDuckGo image seach:

```
https://duckduckgo.com/?q=orm+.png&t=ffab&iar=images&iaf=license%3APublic%2Ctype%3Aclipart&iax=images&ia=images&iai=https%3A%2F%2Fcdn.pixabay.com%2Fphoto%2F2016%2F03%2F31%2F15%2F10%2Fcartoon-1293047_1280.png
```

After that, the image was modified using KolourPaint and the R logo was added.

## Singularity container

 * [Find the latest 'ormr' Singularity container](https://cloud.sylabs.io/library/search;query=ormr)

