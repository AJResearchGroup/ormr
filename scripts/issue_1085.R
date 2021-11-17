#
# Posted at https://github.com/rstudio/reticulate/issues/1085
#

# We use only one point of contact
folder_name <- tempfile()

# Cool: the Conda environment we are about to create, does not exist yet
testthat::expect_false(
  basename(folder_name) %in% reticulate::conda_list()$name
)

# Great: we can create that new Conda environment
reticulate::conda_create(envname = folder_name)

# Nice: we can see that the environment exists now
testthat::expect_true(
  basename(folder_name) %in% reticulate::conda_list()$name
)

# This Issue: would like to be able to get which environment is active now,
# for example, by writing this:
#
# current_envname <- reticulate::get_current_envname()
#

# We change the environment here
reticulate::use_condaenv(condaenv = folder_name)

# This Issue: would like to be able to get which environment is active now,
# which should be different than before 'reticulate::use_condaenv'
#
# For example, I'd have liked to write this:
#
# new_envname <- reticulate::get_current_envname()
# testthat::expect_false(current_envname == new_envname)
#
# Note that this does not work:
# Sys.getenv("RETICULATE_MINICONDA_PATH")

