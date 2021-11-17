# We use only one point of contact
ormr_folder_name <- tempfile(pattern = "ormr_")
ormr_folder_name

# Initially, nothing is installed, this must be verified
testthat::expect_false(
  basename(ormr_folder_name) %in% reticulate::conda_list()$name
)

# Create and activate
python_path <- reticulate::conda_create(
  envname = ormr_folder_name,
  python_version = "3.6" # From https://stackoverflow.com/a/69978354
)
testthat::expect_true(file.exists(python_path))
reticulate::use_condaenv(condaenv = ormr_folder_name)
reticulate::use_python(python = python_path, required = TRUE)

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

# Lazy loading
testthat::expect_true(is.null(reticulate::py_exe()))

# py_exe is correct, when loadad
if (!is.null(reticulate::py_exe())) {
  testthat::expect_true(
    stringr::str_detect(
      string = reticulate::py_exe(),
      pattern = ormr_folder_name
    )
  )
}


# Our conda env is in the list
# testthat::expect_true(
#   is_miniconda_installed(
#     ormr_folder_name = ormr_folder_name
#   )
# )
testthat::expect_true(
  basename(ormr_folder_name) %in% reticulate::conda_list()$name
)

# Get a list of the installed Python packages
reticulate:::conda_list_packages(envname = ormr_folder_name)

# scipy will not be in that list yet:
# taken from https://anaconda.org/anaconda/scipy
package_name <- "scipy"
testthat::expect_false(
  package_name %in% reticulate:::conda_list_packages(
    envname = ormr_folder_name
  )$package
)

# Running a script gives an error:
python_script_path <- system.file("extdata", "scipy_example.py", package = "ormr")
testthat::expect_error(
  reticulate::py_run_file(
    file = python_script_path
  ),
  "ModuleNotFoundError: No module named 'scipy'"
)

# Faster than 'reticulate::py_install(packages = package_name, envname = ormr_folder_name)'
reticulate::conda_install(
  packages = package_name,
  envname = ormr_folder_name
)


# Now the Python package should be installed:
testthat::expect_true(
  package_name %in% reticulate:::conda_list_packages(
    envname = ormr_folder_name
  )$package
)


# Great, with our environment and packages in place,
# we run a Python script with those packages with command-line arguments
testthat::expect_silent(
  reticulate::py_run_file(
    file = python_script_path
  )
)
