# Set local library path
lib_dir <- "C:/Users/smrai/Desktop/Bep/R_libs"
if (!dir.exists(lib_dir)) dir.create(lib_dir)
.libPaths(c(lib_dir, .libPaths()))

options(repos = c(CRAN = "https://cloud.r-project.org"))

pkgs <- c("readr", "dplyr", "lme4", "ordinal", "sjPlot")

# Install missing packages
for (pkg in pkgs) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, lib = lib_dir, dependencies = TRUE)
  }
}
