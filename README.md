# drat

The Pandora-IsoMemo drat repository: R-Package Source Code Repository for IsoMemo open-source and academic community.

## Instructions to install specific IsoMemo pacakges and webapps from this repository:
> ## Step 0: You must install R open source software
- windows: https://cran.r-project.org/bin/windows/base/
- MacOS: https://cran.r-project.org/bin/macosx/
> You might be asked to select a mirror, a regional CRAN repo geographically close to you, then just select your region to complete the download.

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

## Step 3: How to Start Web Application
First you need the devtools package, which help load and initialize the IsoMemo apps and databases, run these commands:
```r
install.packages("devtools") # if you don't have the package
library(devtools)
```
After you finish installing all the dependencies please run:
`devtools::load_all('.')`

> ### How to start the application interface:
  start the ReSources Application user Interface locally run:
`startApplication()`
  
  **Note**: _if you want to run multiple apps at once, then you will have to open another R console and repeat the steps to start the apps. The reasons is that two apps cannot be started from the same R console, just open another R window session, and repeat steps 1 and 2. Now, a browser should pop and the app is now ready to be used!_


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
