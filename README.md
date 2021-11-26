# ormr

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/ormr/actions)|[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|---------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/ormr/workflows/R-CMD-check/badge.svg?branch=master)   |[![codecov.io](https://codecov.io/github/richelbilderbeek/ormr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/ormr/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/ormr/workflows/R-CMD-check/badge.svg?branch=develop)  |[![codecov.io](https://codecov.io/github/richelbilderbeek/ormr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/ormr/branch/develop)

Work with Python installed at a custom location.

# Goal

`ormr` allows a user to install Python packages,
create a Conda environment and run Python scripts
with only one point of contact.

# Examples

`ormr` uses one point of contact, `ormr_folder_name`.
For convenience, there is also a default `ormr_folder_name`.

## Get the default `ormr_folder_name`

```{r}
ormr_folder_name <- get_default_ormr_folder_name()
```

## Create the default Conda environment

```{r}
ormr_folder_name <- create_default_conda_env()
```

Note that `create_default_conda_env` conveniently returns the
`ormr_folder_name` used to work with this environment.

## Install a Python package

```{r}
ormr_folder_name <- create_default_conda_env()

install_python_package(
  ormr_folder_name = ormr_folder_name,
  package_name = "scipy"
)
```

## Run a Python script

```{r}
ormr_folder_name <- create_default_conda_env()
python_script_path <- system.file(
  "extdata", "hello_world.py", package = "ormr"
)
run_python_script(
  ormr_folder_name = ormr_folder_name,
  python_script_path = python_script_path
)
```

## Run a Python script with command-line arguments

```{r}
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

