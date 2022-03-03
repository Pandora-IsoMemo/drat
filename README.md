# drat

The Pandora-IsoMemo drat repository: R-Package Source Code Repository

## To install specific pacakges and webapps from this repository
Official names of the IsoMemo Packages:

## Packages:
- ### BMSC
```r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
install.packages("BMSC")
```
- ### IsomemoData
```r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
install.packages("IsomemoData")
```

## Web Applications:
- ### ReSources
- ### Pandora-Isomemo
- ### Bpred
- ### PlotR

### Instructions for Installing packages: BMSC, IsomemoData
```r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
install.packages("BMSC")

# or two packages at once
install.packages(c("BMSC", "IsomemoData"))
```
### Installing Web-applcations: ReSources app, Pandora-Isomemo app, Plot-R app, OstebioR app, B-pred
```r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
install.packages("BMSC")
```

### Installation Forums
If you have issues installing the packages, please report your issue under Installation Forums with the package name and what steps you have already done.


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
