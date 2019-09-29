---
title: Creating an R package
weight: 3
---

Creating a package in RStudio is straightforward. Just click

```
File -> New Project -> New Directory -> R Package
```

You can choose a name for your package, the parent directory for the package and whether or not you want to also initialize an empty git repository.

The package will be populated with various files and folders.

## Package structure

```
package/
├── DESCRIPTION
├── LICENSE
├── LICENSE.md
├── NAMESPACE
├── R
├── man
└── tests
```

## Edit DESCRIPTION

- Add license, e.g. GPL-2, GPL-3, GPL-2 | GPL-3, or MIT + file LICENSE
- Add LICENSE.md with actual license so it's easy to read on GitHub
- Add LICENSE.md to .Rbuildignore
- Add title, author (you), maintainer (you) and description.
- Add version, perhaps using [semantic versioning](https://semver.org/).

## Documentation and exporting functions

Make sure you have the `devtools` package installed.

You can add automatic documentation building in RStudio by checking `Build -> Configure Build Tools... -> Generate documentation with Roxygen`. Otherwise, you can run devtools::document() when you want to create the documentation.

In RStudio, you can add skeleton documentation to each function you want to export by placing your cursor on the function and clicking `Code -> Insert Roxygen skeleton`. Then you can provide additional information, which will show up in help documentation for that function. This is accomplished by automatically creating `.Rd` files in the `man` folder.

The documentation builder also creates/overwrites the NAMESPACE file, which specifies which functions are exported by the package (via `@export`). This file is not overwritten by Roxygen if it was not created by Roxygen, so you may have to delete it if it exists.

## Testing

Package functions should meet certain criteria. One can check that they meet these criteria by writing test functions that only "pass" if the criteria are met.

In many cases, developers write informal test scripts that they run while working on a particular piece of functionality. When the functionality they are working on is "complete", they then commit their code changes and often never test the functionality again unless a bug appears later.

Test suites are a mechanism for ensuring that code changes do not break existing functionality that is measured by the test suite. They involve retaining test scripts that are run collectively as part of a suite after changes have been made to code. In practice, this can be very helpful for preventing bugs. Moreover, once a test suite has been designed, running it usually takes very little programmer effort.

To begin testing, install the "testthat" R package and then run `usethis::use_test("<name>")`. This will create a `tests` directory and populate it. You can add tests to the created file `tests/test-<name>.R`, or create more test files.

Tests in the `tests/test-<name>.R` will often be of the form

```
test_that("<feature name>", {
  expect_equal(a, b)
  expect_true(c >= 1)
})
```

There is more information on various different `expect_` functions in the [R Packages](https://r-pkgs.org/tests.html) book. For example, you can test that some code produces an error or a warning, or that something will be printed.

You can run tests from the Build pane or via `devtools::test()`.

There are many different approaches to testing. Some people do not routinely test their code, while some others adopt a very [test-centric view of development](https://en.wikipedia.org/wiki/Test-driven_development). For collaborative projects, tests can be run automatically whenever a pull request is made to ensure that modified code passes all tests: this can ease the burden of code review and ensure that tests are *always* passing on the relevant branch (e.g. `master`).

## Coverage

Routine testing is useful for checking that changes in code do not break existing functionality, as measured by the test suite. However, there may be many lines of code that are not tested, and it is possible that these lines of code contain bugs, or even cause serious errors whenever they are run.

One way to mitigate this issue, is to use automated tools for checking which lines of code have been run during the automated tests, i.e. by computing [code coverage](https://en.wikipedia.org/wiki/Code_coverage). This is very easy to do with R packages.

Begin by installing the "covr" package, if it is not already installed. Then run

```
covr::report()
```

A simple report with code coverage for each file will appear in R's viewer pane. File names can be clicked to see how many times each line is covered.

Code coverage tools only tell us which lines are covered. When lines are not covered, one might introduce new tests to cover additional lines. In general, more coverage is better, but it is not uncommon for large projects to have less than 100% coverage.

## Example package

An example R package can be found [here](https://github.com/awllee/SC1ExamplePackage).

You can install a package from GitHub in R via ```devtools::install_github("https://github.com/awllee/SC1ExamplePackage")
```

This is why the git repository includes computer-generated content, specifically `NAMESPACE` and the `man` folder.
