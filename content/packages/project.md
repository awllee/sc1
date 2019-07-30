---
title: "Projects: organizing your code"
weight: 1
---

RStudio has a nice interface for programming in R. You may have only been using it to create R scripts / RMarkdown files and execute / render them.

It is generally a good idea to keep code for a "project" in one place. RStudio can help with this by letting you create a "Project", which is little more than a directory with files in it. Opening a project in RStudio automatically sets R's working directory to that directory.

## Project structure

The structure of the files in a project should of course be dictated by the purpose of the project. However, the following top-level folder structure is often used:

```
project/
├── R/
├── README.md
├── data/
├── doc/
└── output/
```

- R scripts containing functions are in the `R` folder. These are usually *not* organized in subdirectories.
- `README.md` describes the project.
- data is in the `data` folder. One might have a `raw` subdirectory for raw data that is never modified, and a `processed` subdirectory for processed data used in the analysis. The processed data should be produced by an R function.
- documentation is in the `doc` folder, e.g. this could be the source files for an academic paper written based on the analysis of the data.
- the results of applying R functions to the data are in the `output` folder. The contents of this folder should be easy to reproduce. A subdirectory might hold figures or tables produced for visualization purposes.

A specific project may require additional folders. For example, in some cases it is useful to write some C or C++ code for performance reasons, and this code would normally reside in a `src/` folder. One popular way to incorporate C++ code is through the [Rcpp package](http://www.rcpp.org/).

If your R code is complicated enough, you may want to add a `tests` folder with test scripts that you can run automatically to check that the functions do what you expect them to do. In some such cases, you might wish to convert your project into a package to take advantage of various tools that work with packages.

## Loading code from files and packages

When code is split across multiple files, there needs to be a mechanism to load it. For R projects and scripts, one can use the `source` command. For example, one could load the code in the "algorithms.R" file in the "R" directory.

```
source("R/algorithms.R")
```

To use an R package, one uses the `library` or `requires` command. For example, one could load the Matrix package, which has support for some sparse matrix computations.

```
library(Matrix)
```

## Example project

An example R project can be found at **insert here**.
