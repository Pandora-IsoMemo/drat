# drat

The Pandora-IsoMemo drat repository: R-Package Source Code Repository for IsoMemo open-source and academic community.

## Instructions to install specific IsoMemo pacakges and webapps from this repository:
> ## Step 0: You must install R open source software
- windows: https://cran.r-project.org/bin/windows/base/
- MacOS: https://cran.r-project.org/bin/macosx/
> You might be asked to select a mirror, a regional CRAN repo geographically close to you, then just select your region to complete the download.

> ## Step 1: Open R Console and user must run this command: 
More directions here: https://www.dataquest.io/blog/tutorial-getting-started-with-r-and-rstudio/
```r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
```
> ## Step 2: Proceed to download the relevant R packages and Web Apps
### Install Packages:
> - #### [BMSC](https://github.com/Pandora-IsoMemo/drat/issues/5)
```r
install.packages("BMSC")
```
> - #### [IsoMemo](https://github.com/Pandora-IsoMemo/drat/issues/10): Package to Retrieve Data from the IsoMemo API (also available on CRAN)
```r
install.packages("IsoMemo")
```

### Installing Web Applications:
> - #### [ReSources](https://github.com/Pandora-IsoMemo/drat/issues/4)
```r
install.packages("ReSources")
```
> - #### [MpiIsoApp](https://github.com/Pandora-IsoMemo/drat/issues/3)
```r
install.packages("MpiIsoApp")
```
> - #### [mpiBpred](https://github.com/Pandora-IsoMemo/drat/issues/6) 
```r
install.packages("mpiBpred")
```
> - #### [PlotR](https://github.com/Pandora-IsoMemo/drat/issues/7)
```r
install.packages("PlotR")
```
> - #### [BMSCApp](https://github.com/Pandora-IsoMemo/drat/issues/8)
>> #### DOWNLOAD BMSCapp INSTALLATION ON LOCAL MACHINE
- First download Docker (see instructions: https://docs.docker.com/desktop/windows/install/) and see video instructions (https://www.youtube.com/watch?v=_9AWYlt86B8)
- Next, open your windows CMD line and run these following commands:
  > - download and install BMSC app: `docker pull ghcr.io/pandora-isomemo/bmsc-app:main`
  > - start the app run: `docker run -p 3838:3838 ghcr.io/pandora-isomemo/bmsc-app:main`
  > - this outputs `Listening on http://0.0.0.0:3838`, then copy & paste the `http://0.0.0.0:3838` to your browser to access local version. 
  > - quit the app run: `docker run -p 3838:3838 --rm ghcr.io/pandora-isomemo/bmsc-app:main` or just close the browser window
> - #### [OsteoBioR](https://github.com/Pandora-IsoMemo/drat/issues/11)
```r
install.packages("OsteoBioR")
```
### Installing Data API
> - #### [MpiIsoData](https://github.com/Pandora-IsoMemo/drat/issues/12): Data for MPI Iso App
```r
install.packages("MpiIsoData")
```


### Instructions for Installing more than one package at once:
```r
# two or more packages at once
install.packages(c("BMSC", "IsoMemo"))
```

## Step 3: How to Start Web Application on your local machine
First pick a web application to start. After intalling all the relevant web apps from **STEP 2**, for example, we choose to initiate the **PlotR** application. Please locally run in your R console:
- `library(PlotR)` 
- `PlotR::startApplication()`
  
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
