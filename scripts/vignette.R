# We use only one point of contact
ormr_folder_name <- tempfile(pattern = "ormr_")
ormr_folder_name

# Initially, nothing is installed, this must be verified
testthat::expect_false(
  basename(ormr_folder_name) %in% reticulate::conda_list()$name
)
testthat::expect_false(
  ormr::does_conda_env_exists(ormr_folder_name = ormr_folder_name)
)

# Create and activate
if (1 + 1 == 2) {
  ormr::create_conda_env(ormr_folder_name = ormr_folder_name)
  python_path <- ormr::get_python_binary_path(ormr_folder_name = ormr_folder_name)

} else {
  python_path <- reticulate::conda_create(
    envname = ormr_folder_name,
    python_version = "3.6" # From https://stackoverflow.com/a/69978354
  )
}
testthat::expect_true(file.exists(python_path))

# ormr should not need to activate these
if (1 == 2) {
  reticulate::use_condaenv(condaenv = ormr_folder_name)
  reticulate::use_python(python = python_path, required = TRUE)
}

if (1 == 2) {
  # Some peeking
  #reticulate::conda_binary(conda = ormr_folder_name)
  reticulate::conda_list()
  reticulate::conda_python(envname = ormr_folder_name)
  #reticulate::conda_version(conda = ormr_folder_name)
  reticulate::py_config()
  reticulate::py_exe()
  reticulate:::conda_list_packages(envname = ormr_folder_name)
  # Sys.getenv("RETICULATE_PYTHON")
}

# We don't care about reticulate lazy loading
if (1 == 2) {
  # Lazy loading: Python is not initialized
  testthat::expect_true(is.null(reticulate::py_exe()))
  # Load Python
  reticulate::py_config()
  testthat::expect_false(is.null(reticulate::py_exe()))
  # Python is correct
  testthat::expect_true(
    stringr::str_detect(
      string = reticulate::py_exe(),
      pattern = ormr_folder_name
    )
  )

}


# Our conda env is in the list
if (1 + 1 == 2) {
  testthat::expect_true(
    ormr::does_conda_env_exists(ormr_folder_name = ormr_folder_name)
  )
} else {
  testthat::expect_true(
    basename(ormr_folder_name) %in% reticulate::conda_list()$name
  )
}

# Get a list of the installed Python packages
if (1 + 1 == 2) {
  installed_python_packages <- ormr::get_installed_python_packages(ormr_folder_name = ormr_folder_name)
  installed_python_packages
} else {
  reticulate:::conda_list_packages(envname = ormr_folder_name)
}

# scipy will not be in that list yet:
# taken from https://anaconda.org/anaconda/scipy
package_name <- "scipy"
if (1 + 1 == 2) {
  testthat::expect_false(
    ormr::is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )
} else {
  testthat::expect_false(
    package_name %in% installed_python_packages$package
  )
}



# Running a script gives an error:
python_script_path <- system.file("extdata", "scipy_example.py", package = "ormr")
if (1 + 1 == 2) {
  testthat::expect_error(
    ormr::run_python_script(
      ormr_folder_name = ormr_folder_name,
      python_script_path = python_script_path
    ),
    "ModuleNotFoundError: No module named 'scipy'"
  )
} else {
  testthat::expect_error(
    reticulate::py_run_file(
      file = python_script_path
    ),
    "ModuleNotFoundError: No module named 'scipy'"
  )
}


# Faster than 'reticulate::py_install(packages = package_name, envname = ormr_folder_name)'
if (1 + 1 == 2) {
  ormr::install_python_packages(
    ormr_folder_name = ormr_folder_name,
    package_names = package_name
  )
} else {
  reticulate::conda_install(
    packages = package_name,
    envname = ormr_folder_name
  )
}


# Now the Python package should be installed:
if (1 + 1 == 2) {
  testthat::expect_true(
    ormr::is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )
} else {
  testthat::expect_true(
    package_name %in% ormr::get_installed_python_packages(
      ormr_folder_name = ormr_folder_name
    )$package
  )

}

# Great, with our environment and packages in place,
# we run a Python script with those packages with command-line arguments
if (1 + 1 == 2) {
  testthat::expect_silent(
    ormr::run_python_script(
      ormr_folder_name = ormr_folder_name,
      python_script_path = python_script_path
    )
  )
} else {
  testthat::expect_silent(
    reticulate::py_run_file(
      file = python_script_path
    )
  )
}
