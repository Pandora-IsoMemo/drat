# drat

The Pandora-IsoMemo drat repository: R-Package Source Code Repository

## To install from this repository

```r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
install.packages("BMSC")
```

## Autodeploy R packages to this repo

Add the following to your Jenkinsfile:

```groovy
stage('Deploy R-package') {
  when { branch 'main' }
  steps {
      sh '''
      curl https://raw.githubusercontent.com/Pandora-IsoMemo/drat/main/deploy.sh > deploy.sh
      # Expects environment variables:
      # CUR_PROJ
      # TMP_SUFFIX
      # GH_TOKEN_PSW -- a GitHub personal access token with write access to the drat repo
      # Expected environment:
      # Dockerfile
      # git, docker, curl is available on PATH
      bash deploy.sh
      '''
  }
}
```
