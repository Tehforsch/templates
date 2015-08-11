#!/bin/zsh
# Needs output folder as argument
if [[ $# -ne 2 ]]; then
    echo "Need output folder and template type as input argument."
    exit 1
fi
outputFolder=$1
templateName=$2
echo $outputFolder
# Folder already exists?
if [[ -d $outputFolder ]]; then
    echo "The target folder already exists. Aborting."
    exit 2
fi
# Template type doesn't exist?
if ! [[ -d $templateName ]]; then
    echo "The given template type does not exist. Aborting"
    exit 3
fi
# Remove trailing slash if there is one.
outputFolder=$(echo $outputFolder | sed "s/\/$//")
# Project name is the name of the last folder from the path
projectName=${outputFolder##*/}

echo "Project name: $projectName"
# Create the target directory
echo "Creating folder."
mkdir $outputFolder

echo "Copying files."
cp -Lrv $templateName/* $outputFolder

cd $outputFolder
if [[ -a $outputFolder/init.sh ]]; then
    echo "Executing initialization script."
    zsh init.sh $projectName
    rm init.sh
fi
