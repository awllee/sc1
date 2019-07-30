---
title: Version control with git & GitHub
weight: 2
show_toc: true
---

Many people think that using version control is a complicated, time-consuming process that is only necessary for large, collaborative software projects. In fact, version control is now very easy, thanks to excellent tools like git and online services like GitHub, and can save a significant amount of time. Moreover, it is helpful in making research reproducible, and public repositories can extend its impact.

There are other version control systems, but we focus on git and GitHub here for simplicity.

A version control system is basically software that tracks changes in files. People use an informal version control system implicitly even if they don't use a software system, e.g. by copying and renaming files. As you might imagine, most ad hoc systems make recovering the state of a software project at a specific time difficult. Modern version control systems have been developed to cater to the needs of most projects with minimal effort.

# Git

## Installing and setting up git

Linux users can install git using their package manager, macOS users can install Xcode (larger) or the Xcode command line tools (smaller). Once you have git on your system, it's a good idea to set up your identity as a global configuration parameter, as this information will be used automatically in certain git commands.

To set your name, execute the following commands in a terminal.

```
git config --global user.name "Your Name"
git config --global user.email name@domain
```

You can check your global configuration.

```
git config --list --show-origin
```


## Initializing a git repository

To initialize a git repository from a terminal, go to the top-level directory you want git to track and type

```
git init
```

You can accomplish the same feat in RStudio (for a given project directory) by choosing git as a version control system in the `Tools -> Version Control` menu.

Initializing a repository does not cause any files to be tracked. You need to add files to the version control system to track them.

## Adding files to the staging area

You can add a new file or a file which has been modified in a terminal via

```
git add <filename>
```

In the RStudio git panel, staging is accomplished by checking the appropriate box next to the file.

This adds the file to the "Staging Area". The change is not actually committed to the version control system.

There are more advanced options, such as staging only certain lines. This can be accomplished via the command line but is also possible to do clicking RStudio's "Diff" button and then choosing lines to stage.

## Committing changes

To commit changes using the terminal you can run

```
git commit
```

which will ask you to provide a commit message.

It is good practice to include in a single commit those changes that are relevant for changing a particular piece of functionality, rather than *all* changes that have been made. The commit message should ideally be informative, and it is common practice to use present tense, as it indicates what the commit does. For example, "add residual checks" might be used if you have added code for checking residuals.

## Reverting

One common situation that arises is that a number of changes have been made locally without being committed, and one wishes to revert back to the last commit. To do this, one can run

```
git revert HEAD
```

In RStudio, one can select individual files and revert (available by first clicking on the gear icon).

## Viewing old versions

In RStudio, you can review previous commits by clicking on the history (clock) icon.

## Creating a branch

In some cases it is desirable to start making a number of changes to code without affecting the default "master" branch of the git repository.

You can create and then start working on a branch by

```
git branch <branch-name>
git checkout <branch-name>
```

or do both together via ```git checkout -b <branch-name>```.

You can then work on both the branch and also on master. If you want to merge the changes from the `<branch-name>` branch into master, you can switch to master , i.e. ```git checkout master```, and then merge via ```git merge <branch-name>```

If there are no conflicts, the merge will occur automatically. If there are conflicts, you will have to manually edit the corresponding file(s) to resolve them before committing.

To delete a branch, one can use ```git branch -d <branch-name>```

## Checking out an old version

One way to checkout an old version of the code into a new branch is to use the command

```
git checkout <commit hash> -b <branch-name>
```

where the commit hash can be found in the git log.

```
git log
```

## Ignoring files

A file will only be added to version control if you stage it at least once. However, it can be irritating to see files in the unstaged area that you will never want to stage. Files that should never be staged can be specified in a [`.gitignore`](https://git-scm.com/docs/gitignore) file in the main directory of the git project. You can also ignore files specified using some types of [regular expressions](https://en.wikipedia.org/wiki/Regular_expression). For example, one can ignore all files with extension `.ext` by adding `*.ext`. If you only want to ignore files in a folder and its subfolders, you can create a `.gitignore` file in that folder. The prefix `!` can be used to negate a previous pattern. For example, `!` can be used to version control the `special.ext` file even if `*.ext` appears earlier in the `.gitignore` file.

## More advanced command line options

There are a very large number of use cases that git caters to, and it would be impossible to cover even a fraction of them here. If you want to find out how to do something, it is quite likely someone else has asked how to do it online.

In most cases, one should usually be staging and committing changes more frequently than performing any other operation. It is good practice to develop on feature-specific branches, particularly in collaborative projects, but it is not unusual to work primarily on the master branch for smaller projects.

# GitHub

## Creating a repository

Using git for version control of a local repository can be useful. Having a repository online and useful tools for interacting with it adds even more benefit.

You can create a new GitHub user account by signing up on the [website](https://github.com/). As a student or academic you can obtain additional benefits via the [education website](https://education.github.com/).

Once you have an account you can [create a new repository](https://help.github.com/en/articles/create-a-repo). You can choose whether it should be public or private. Private repositories are only visible to people you choose to collaborate with, and you can use them to test out ideas that you are not ready to share publicly. In this course, we focus more on public repositories.

**New projects with no existing content**

If you are starting a new project with no existing content, you can initialize the project with a README.md, .gitignore (choose R for a default R .gitignore file) and LICENSE file.

You can then clone the repository on your system using a terminal. The repository will be a subfolder of the current working directory of the terminal.

```
git clone https://github.com/<username>/<repository-name>.git
```

This essentially copies the files in the repository to your local repository, and sets the GitHub online repository as the "origin". After changing your working directory to the local repository, you can check this from the terminal.

```
git remote -v
```

**New projects from a local git repository**

If you are planning to "push" from a local git repository to populate the new project, it's easier if you do not initialize the project with any files.

Then, instead of cloning the repository, you add the GitHub repository as the remote "origin" repository, and push.

```
git remote add origin https://github.com/<username>/<repository-name>.git
git push -u origin master
```

## Choosing a software license

When software is written in the UK, the author [automatically receives copyright protection](https://www.gov.uk/copyright). Making code publicly available on GitHub allows people to [view it and to fork the repository](https://help.github.com/en/articles/github-terms-of-service#5-license-grant-to-other-users), but does not give people the rights required to modify and distribute the code, or create derivative works, as this would constitute copyright infringement.

A software license grants people the right to do specific things, such as create derivative works. You may find GitHub's [choose a license](https://choosealicense.com/) website helpful. One of the main distinctions is between [permissive](https://en.wikipedia.org/wiki/Permissive_software_license) and [copyleft](https://en.wikipedia.org/wiki/Copyleft) licenses. The text of the license can be placed in a "LICENSE", "LICENSE.txt" or "LICENSE.md" file in the root of your repository.

Copyright and licensing are legal matters for which many questions require professional legal opinions, and **there is no legal advice here**. There appear to be significant differences of opinion on some topics, such as [linking and derived works](https://en.wikipedia.org/wiki/GNU_General_Public_License#Linking_and_derived_works) with respect to the GNU General Public License. It appears that many R packages that *use* GPLv2 or GPLv3 packages have released their package source code under more permissive licenses such as MIT, even though if the *combined program* was ever released it would need to be released under the relevant GPL license.

When contributing to an existing project on GitHub that has a clear license, and in the absence of an explicit alternative agreement, [the contribution is licensed under the same terms](https://help.github.com/en/articles/github-terms-of-service#6-contributions-under-repository-license).

## Fetching, pulling, merging & pushing

With a remote repository, e.g. hosted on GitHub, you can fetch, merge, pull and push code changes.

- `git fetch <remote>` fetches updates from the remote repository.
- `git merge <remote>/<branch>` merges fetched updates into your local branch.
- `git pull <remote> <branch>` combines fetching and merging.
- `git push <remote> <branch>` pushes local commits to the remote repository.

In RStudio, one can pull and push using the corresponding buttons in the Git panel.

It is often preferable to avoid complicated merge operations by keeping both the local and remote repositories up to date with each other.

## Contributing code: forks and pull requests

One of the main collaborative mechanisms provided by GitHub is the ease with which one can fork a repository, make changes and then submit a "pull request".

To fork a repository, you can just click the "Fork" button on GitHub. This creates a personal copy of the original repository. You can clone the repository to your computer using

```
git clone https://github.com/<username>/<fork-name>.git
```

or you can do this via the "New Project -> Version Control -> git" menu options in RStudio.

This sets up your local repository with **your fork** as the remote. You can make changes locally and push them to the remote. When you have made the changes you wanted to the code, you can *ask* a maintainer of the original repository to incorporate the changes via a pull request.

It is easiest to do this using GitHub's web interface. You can click on "New pull request" or "Pull request", to do this. The pull request will include all the commit information and you can add information that explains why the code changes should be merged. If a maintainer approves the request, the changes can then be merged. It is not uncommon for a discussion to lead to further commits to the branch associated with the pull request; these commits will automatically update the pull request.

When a pull request is made, it is possible for there to be conflicts due to other commits being made to the original repository. One common strategy to keep pull requests simple is to ensure that the pull request can be merged automatically. To do this, one should tell the local repository about the "upstream" (original) repository.

```
git remote add upstream <upstream address>
```

You can then fetch and merge upstream changes into your branch.

```
git fetch upstream
git merge upstream/master
```

After merging, if you commit and then push, the pull request will automatically be updated. It is often useful to keep a fork up to date with the upstream, i.e. original repository.
