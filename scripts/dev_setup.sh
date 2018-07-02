#!/usr/bin/env bash
bold=$(tput bold)
normal=$(tput sgr0)

base_dir=$(cd $(dirname "${BASH_SOURCE[0]}")/../ && pwd)

cd $base_dir

mkdir packages
cd packages

function clone_latest {
#  git clone --branch=master https://github.com/$1/$2.git

#  If you can use ssh access to the git repository, you can do this instead:
  git clone --branch=master git@github.com:$1/$2.git

  cd $2

  latesttag=$(git describe --tags)
  echo checking out ${latesttag}
  git checkout ${latesttag}

  cd ..
}

## os2display bundles.

mkdir os2display
cd os2display

BUNDLES="core-bundle
media-bundle
admin-bundle
default-template-bundle"

for BUNDLE in $BUNDLES
do
(
    clone_latest "itk-os2display" $BUNDLE
)
done

cd ..

## aakb bundles.

mkdir aakb
cd aakb

BUNDLES="os2display-aarhus-templates"

for BUNDLE in $BUNDLES
do
(
    clone_latest "aakb" $BUNDLE
)
done

cd ..

## itk-os2display bundles.

mkdir itk-os2display
cd itk-os2display

BUNDLES="os2display-koba-integration
lokalcenter-template-bundle
template-extension-bundle
aarhus-second-template-bundle
aarhus-data-bundle
vimeo-bundle
campaign-bundle"

for BUNDLE in $BUNDLES
do
(
    clone_latest "itk-os2display" $BUNDLE
)
done

cd ..

cd ..
