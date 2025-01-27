#!/bin/bash
set -o errexit -o nounset
addToDrat(){
  echo "Cleaning up"
  rm -f *.tar.gz
  rm -fr drat
  echo "Building docker image"
  docker build -t tmp-$CUR_PROJ-$TMP_SUFFIX .
  echo "Compiling R package"
  docker run --rm --network host -v $PWD:/app/host --user `id -u`:`id -g` tmp-$CUR_PROJ-$TMP_SUFFIX bash -c "R CMD build --no-build-vignettes $CUR_PKG_FOLDER && cp *.tar.gz host"
  echo "Deploy to drat"
  git clone https://$GH_TOKEN_PSW@github.com/Pandora-IsoMemo/drat.git
  docker run --rm -v $PWD:/app --user `id -u`:`id -g` tmp-$CUR_PROJ-$TMP_SUFFIX R -e "drat::insertPackage(dir(pattern='.tar.gz'), 'drat/docs'); drat::archivePackages(repopath = 'drat/docs')"
  cd drat
  git config user.name "jenkins-pandora-isomemo"
  git config user.email "jenkins-mpi@inwt-statistics.de"
  git add --all
  git commit -m "Build from Jenkins"
  git push
  cd ..
  echo "Cleaning up"
  rm -vf *.tar.gz
  rm -fr drat
  docker rmi tmp-$CUR_PROJ-$TMP_SUFFIX
}
addToDrat
