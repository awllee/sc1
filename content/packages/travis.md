---
title: Testing a package using Travis
weight: 4
---

An R package that is publicly available on GitHub can be tested using [Travis CI (.co,)](https://travis-ci.com/). CI stands for continuous integration.

CI is a useful tool when developing software collaboratively because pull requests can automatically trigger tests. This means that the reviewer of the pull request can be sure that the code works, insofar as the tests pass, and focus on other aspects of the code.

Even in non-collaborative development, this can be useful as tests can be configured to run systematically against different configurations. For example, operating systems and versions of R.

## Travis CI .org vs .com

There have historically been two different services for public and private repositories. However, now Travis CI is aiming to service both types of repositories on [Travis CI .com](https://travis-ci.com/).

## Getting set up

You can log in to Travis using your GitHub account.

Your repositories should be listed in Travis, and you can choose which ones undergo continuous integration by toggling them. You may need to synchronize your GitHub account within Travis to see new repositories.

In order for Travis to build your R package, a file called `.travis.yml` should be placed in your repository.

For a simple R package, the following should be sufficient:

```
language: r
dist: xenial
cache: packages
branches:
  only:
    - master

r_github_packages:
  - r-lib/covr

after_success:
  - Rscript -e 'covr::codecov()'
```
Next, you have to tell R to ignore this file. You do this by adding the following code to the **.Rbuildignore** file in your package.

```
## Ignore travis config file
^\.travis\.yml$
```

The information in the file tells Travis to build the master branch on an Ubuntu 16.04 (Xenial Xerus) system. If you have added tests using "testthat" these will be automatically run as part of the package build. Code coverage will also be run.

You can view the code coverage results by going to [Codecov](https://codecov.io), logging in using your GitHub account and selecting the appropriate repository.

## Hosting pages using GitHub pages

In fact, you can also have Travis build RMarkdown pages and deploy them to a GitHub Pages website associated with your GitHub repository.

This is how this website is created.

Here are simple examples:

- [basic RMarkdown project](https://github.com/awllee/rmarkdown-travis-demo) + [webpage](https://awllee.github.io/rmarkdown-travis-demo/example.html)
- [some slides](https://github.com/awllee/smc-tutorial) + [webpage](https://awllee.github.io/smc-tutorial/smc-tutorial.html)

The only minor complication here is that you need to allow Travis to deploy to your GitHub repository. One way to do this is to create a "Personal Access Token" via

`Settings -> Developer Settings -> Personal access tokens`

in your GitHub account, which can be used to perform actions in GitHub that otherwise only you would be able to do.

You should given the token a meaningful name (such as "Travis GitHub pages deployment", and save the token in an encrypted file. You can then add this string to your Travis settings for that repository as an "environment variable". For example, you could call it `GITHUB_PAT`. Make sure it is not shown in the build log.

Then you can follow the Travis build instructions in the [basic RMarkdown project](https://github.com/awllee/rmarkdown-travis-demo) listed above. In particular, for that project the `.travis.yml` file contains the following text:

```
language: r
dist: xenial
cache: packages
branches:
    only:
        - master
r_packages:
    - rmarkdown

script:
    - Rscript -e 'rmarkdown::render("example.Rmd", output_dir="public")'

deploy:
    provider: pages
    skip_cleanup: true
    github_token: $GITHUB_PAT
    on:
        branch: master
    local_dir: public
    target_branch: gh-pages
```

Rather than building an R package, Travis will render the RMarkdown file and place it in the "public" subdirectory. Then the deploy options tell Travis to copy the public directory to the `gh-pages` branch of the repository.

For Travis to successfully deploy the webpages, you should create a `gh-pages` branch in your repository. You can do this using the GitHub web interface. You should also go to the settings page for the repository and in the GitHub Pages section you should select the `gh-pages` branch as the source.

If you have succeeded, the webpage will be available at

```
https://<username>.github.io/<repository-name>/<filename>.html
```
