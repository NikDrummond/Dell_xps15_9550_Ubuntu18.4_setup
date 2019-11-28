# Git, Python, Jupyter, and Pymaid

# install pip (Python package manager)
sudo apt update
sudo apt install python3-pip

# install git and git kraken, a linux version of git desktop
sudo apt install git
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb

# install R
sudo apt upgrade
sudo apt dist-upgrade
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
sudo apt insatll r-base
sudo apt install r-base-dev
sudo add-apt-repository ppa:marutter/c2d4u3.5
sudo apt install r-cran-rgl
sudo apt install xorg libx11-dev libcgal-dev libglu1-mesa-dev libfreetype6-dev

## If you want to check openssl version (1.1.1 is latest as of 06/08/2019):
openssl version
## libssl-dev and libcurl4-openssl-dev should already be installed, if not, or to check:
sudo apt install libssl-dev libcurl4-openssl-dev

# get cmtk
sudo apt-get install cmtk

## Create .Renvron file, for CATMAID access
gedit .Renviron
# This will open a new window, in which you should add this code (changing the relevant information):

catmaid_server="https://mycatmaidserver.org/catmaidroot"
catmaid_token="9944b09199c62bcf9418ad846dd0e4bbdfc6ee4b"
catmaid_authname="Calvin"
catmaid_authpassword="hobbes"

## It is also a good idea to set up Git access for R as well. Follow these instructions for a unique access token for Git: 

# https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line 

# Then once you have your token add this line to the open Renviron file:

GITHUB_PAT = “your token here”

# Hit save and close the window. If you need to find the file again you can use $ gedit .Renviron to open it, or find it in the file navigator. To see hidden files (those with a . infront within the GUI, use ctrl + h.

# install RStudio

cd ~/Download
wget https://download1.rstudio.org/rstudio-xenial-1.1.447-amd64.deb
sudo gdebi rstudio-xenial-1.1.447-amd64.deb
cd

# Get needed R packages - you may need to sudo this, as well...

R 
install.packages(c("tidyverse","data.table","dtplyr","devtools","roxygen2","bit64","readr","rgl"), repos = "https://cran.rstudio.com/")
install.packages("git2r",type='source')
if(!requireNamespace('remotes')) install.packages('remotes')
remotes::install_github("natverse/natverse")
library(natverse)
download_jefferislab_registrations()
natverse_update(source = 'GITHUB')
natverse_update(source = 'CRAN')
q()

# install pymaid - you may need to sudo all of these
sudo apt-get install -y python-testresources
python3 -m pip install git+git://github.com/schlegelp/pymaid@master
python3 -m pip install pyoctree
python3 -m pip install rpy2
python3 -m pip install shapely
python3 -m pip install ujson

# install jupyter
sudo python3 -m pip install jupyter
sudo python3 -m pip install jupyterlab




# If you also want to insatll the R JUpyter kernel, so you can use R in jupyer:
R 
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec()
q()




