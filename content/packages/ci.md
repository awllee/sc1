---
title: Testing a package using GitHub Actions
weight: 4
---

An R package that is publicly available on GitHub can be tested using [GitHub Actions](https://github.com/features/actions). This is one example of continuous integration (CI).

CI is a useful tool when developing software collaboratively because pull requests can automatically trigger tests. This means that the reviewer of the pull request can be sure that the code works, insofar as the tests pass, and focus on other aspects of the code.

Even in non-collaborative development, this can be useful as tests can be configured to run systematically against different configurations. For example, operating systems and versions of R.

## Security

In order to create workflows, GitHub requires you to use a personal access token with workflow scope. You can do this via

`Settings -> Developer Settings -> Personal access tokens`

## A simple example: package testing

A simple example of an R package using GitHub Actions for CI is the [SC1ExamplePackage](https://github.com/awllee/SC1ExamplePackage). The instructions for CI are contained in the `.github` directory, and in particular in the `workflows` subdirectory. There are two workflows.

`R-CMD-check.yaml`: this workflow runs the tests defined in the package on Windows, macOS and Linux with the latest release of R, and also on Linux with the latest development build of R. It was created automatically by running
```
usethis::use_github_action("check-standard")
```

`test-coverage.yaml`: this workflow runs `covr::codecov()`, which essentially runs the package tests on macOS and monitors which lines of source code have been run, and then uploads the results to [Codecov.io](https://about.codecov.io/). It was created automatically by running
```
usethis::use_github_action("test-coverage")
```
You can log on to Codecov using GitHub credentials and manage coverage settings for your GitHub repository there.

## Hosting pages using GitHub pages

In fact, you can also have Github Actions build RMarkdown pages and deploy them to a GitHub Pages website associated with your GitHub repository.

This is how this [website is created](https://github.com/awllee/sc1).

Here are some other examples:

- [basic RMarkdown project](https://github.com/awllee/rmarkdown-pages-demo) + [webpage](https://awllee.github.io/rmarkdown-pages-demo/example.html)
- [some slides](https://github.com/awllee/smc-tutorial) + [webpage](https://awllee.github.io/smc-tutorial/smc-tutorial.html)
