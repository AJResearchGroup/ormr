library(ormr)
ormr_report(ormr_folder_name = "/opt/ormr")

download.file(
  url = "https://raw.githubusercontent.com/richelbilderbeek/ormr/master/inst/extdata/scipy_example.py",
  destfile = "scipy_example.py"
)

reticulate::py_run_file(file = "scipy_example.py")

ormr::run_python_script(
  ormr_folder_name = "/opt/ormr",
  python_script_path = "scipy_example.py"
)

