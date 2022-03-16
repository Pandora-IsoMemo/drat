# drat

The Pandora-IsoMemo drat repository: R-Package Source Code Repository for IsoMemo open-source and academic community.

## Instructions to install specific IsoMemo pacakges and webapps from this repository:

> ## Step 1: Open R and user must run this command: 
```r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
```
> ## Step 2: Proceed to download the relevant R packages and Web Apps
### Install Packages:
> - #### BMSC
```r
install.packages("BMSC")
```
> - #### IsomemoData
```r
install.packages("IsomemoData")
```

### Installing Web Applications:
> - #### ReSources
```r
install.packages("ReSources")
```
> - #### MpiIsoApp
```r
install.packages("MpiIsoApp")
```
> - #### mpiBpred 
```r
install.packages("mpiBpred")
```
> - #### PlotR
```r
install.packages("PlotR")
```
> - #### BMSCApp
```r
install.packages("BMSCApp")
```
> - #### OsteoBioR
```r
install.packages("OsteoBioR")
```
### Installing Data API
> - #### IsomemoData: Package to Retrieve Data from the IsoMemo API (also available on CRAN)
```r
install.packages("IsomemoData")
```
> - #### MpiIsoData: Data for MPI Iso App
```r
install.packages("MpiIsoData")
```



### Instructions for Installing more than one package at once:
```r
# two or more packages at once
install.packages(c("BMSC", "IsomemoData"))
```


# HOW TO REPORT BUGS:

If you have issues installing the packages, please report your issue here with the package name and what steps you have already done, preferably as descriptive as possible (screenshots, etc.). We will get back to you as soon as we can to solve the issue.

## Can please provide:

> - All commands that led to the installation error: 
> - The full output of `sessionInfo()`
> - The output of `options("repos")`
> #### Here is the forum to report installation issues: https://github.com/Pandora-IsoMemo/drat/issues/2



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
