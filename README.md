# drat

The Pandora-IsoMemo drat repository: R-Package Source Code Repository

## To install from this repository

```r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
```

## Autodeploy R packages to this repo

Add the following to your .travis.yml file:

```yml
after_success:
    - test $TRAVIS_PULL_REQUEST == "false" && test $TRAVIS_BRANCH == "master" && curl
      https://raw.githubusercontent.com/Pandora-IsoMemo/drat/main/deploy.sh > deploy.sh && bash
      deploy.sh
```

Add a deploy key to your travis job

1. Generate a new personal access token. Needs read access to public repos
2. Alternatively go to the settings of your project on travis-ci.com and add the env variable there.
3. Get Help
   [here](https://cran.r-project.org/web/packages/drat/vignettes/CombiningDratAndTravis.html)
