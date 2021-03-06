library(ormr)

ormr_folder_name <- "python3"

ormr_report(ormr_folder_name = ormr_folder_name)

python_script_path <- system.file("extdata", "scipy_example.py", package = "ormr")

ormr::run_python_script(
  ormr_folder_name = ormr_folder_name,
  python_script_path = python_script_path
)

if (1 == 2) {
  python_script_path <- "scipy_example.py"
  download.file(
    url = "https://raw.githubusercontent.com/richelbilderbeek/ormr/master/inst/extdata/scipy_example.py",
    destfile = python_script_path
  )
  reticulate::py_run_file(file = python_script_path)
}
