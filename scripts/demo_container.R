library(ormr)

# Remove these in the future, make 'ormr_report' more eager
reticulate::use_condaenv(condaenv = "/opt/ormr")
reticulate::use_python(python = reticulate:::python_binary_path("/opt/ormr"), required = TRUE)

ormr_report(ormr_folder_name = "/opt/ormr")

python_script_path <- system.file("extdata", "scipy_example.py", package = "ormr")

if (1 == 2) {
  python_script_path <- "scipy_example.py"
  download.file(
    url = "https://raw.githubusercontent.com/richelbilderbeek/ormr/master/inst/extdata/scipy_example.py",
    destfile = python_script_path
  )
  reticulate::py_run_file(file = python_script_path)
}


ormr::run_python_script(
  ormr_folder_name = "/opt/ormr",
  python_script_path = python_script_path
)

