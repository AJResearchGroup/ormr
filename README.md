# ormr

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/ormr/actions)|[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|---------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/ormr/workflows/R-CMD-check/badge.svg?branch=master)   |[![codecov.io](https://codecov.io/github/richelbilderbeek/ormr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/ormr/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/ormr/workflows/R-CMD-check/badge.svg?branch=develop)  |[![codecov.io](https://codecov.io/github/richelbilderbeek/ormr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/ormr/branch/develop)

Work with Python installed at a custom location.

![`ormr` logo](man/figures/ormr_logo_50.png)

# Goal

`ormr` allows a user to install Python packages,
create a Conda environment and run Python scripts
with only one point of contact.

`ormr` heavily depends on `reticulate`, the latter being
more powerful and flexible. `ormr`, however, focuses
on making it trivially simple to install Python
packages and run Python scripts.

# Examples

`ormr` uses one point of contact, `ormr_folder_name`.
For convenience, there is also a default `ormr_folder_name`.

 * 1. Get the default `ormr_folder_name`
 * 2. Create the default Conda environment
 * 3. Install a Python package
 * 4. Run a Python script
 * 5. Run a Python script with command-line arguments

## 1. Get the default `ormr_folder_name`

```r
ormr_folder_name <- get_default_ormr_folder_name()
```

## 2. Create the default Conda environment

```r
ormr_folder_name <- create_default_conda_env()
```

Note that `create_default_conda_env` conveniently returns the
`ormr_folder_name` used to work with this environment.

## 3. Install a Python package

```r
ormr_folder_name <- create_default_conda_env()

install_python_package(
  ormr_folder_name = ormr_folder_name,
  package_name = "scipy"
)
```

## 4. Run a Python script

```r
ormr_folder_name <- create_default_conda_env()
python_script_path <- system.file(
  "extdata", "hello_world.py", package = "ormr"
)
run_python_script(
  ormr_folder_name = ormr_folder_name,
  python_script_path = python_script_path
)
```


## 5. Run a Python script with command-line arguments

```r
ormr_folder_name <- create_default_conda_env()
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
in any folder easily. Such as a system folder of a Singularity container.

## Why not just use `reticulate`?

`ormr` heavily depends on `reticulate`, the latter being
more powerful and flexible. 

`ormr`, however, focuses
on making it trivially simple to install Python
packages and run Python scripts. 
Additionally, `ormr` has a more extensive documentation,
and 100% code coverage.

Beyond the domain of `ormr`, use `reticulate`.

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

# What about the logo?

The original snake image was found when searching for a
public domain image of a snake, using the following DuckDuckGo image seach:

```
https://duckduckgo.com/?q=orm+.png&t=ffab&iar=images&iaf=license%3APublic%2Ctype%3Aclipart&iax=images&ia=images&iai=https%3A%2F%2Fcdn.pixabay.com%2Fphoto%2F2016%2F03%2F31%2F15%2F10%2Fcartoon-1293047_1280.png
```




https://cdn.pixabay.com/photo/2016/03/31/15/10/cartoon-1293047_1280.png

