on:
  push:
  pull_request:

name: run_issue_1085

jobs:
  run_issue_1085:

    runs-on: ubuntu-latest
    env:
      GITHUB_PAT: ${{ secrets.GITHUB_TOKEN }}
    steps:
      - uses: actions/checkout@v2

      - uses: r-lib/actions/setup-r@v1

      - name: Install libcurl4-openssl-dev
        run: sudo apt install -qq libcurl4-openssl-dev

      - name: Install dependencies
        run: |
          install.packages(c("remotes", "rcmdcheck"))
          remotes::install_deps(dependencies = TRUE)
          remotes::install_github("richelbilderbeek/plinkr")
        shell: Rscript {0}

      - name: Run
        run: Rscript scripts/issue_1085.R

