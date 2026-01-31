# Set local library path
lib_dir <- "C:/Users/smrai/Desktop/Bep/R_libs"
.libPaths(c(lib_dir, .libPaths()))

options(repos = c(CRAN = "https://cloud.r-project.org"))

install.packages("emmeans", lib = lib_dir, dependencies = TRUE)
