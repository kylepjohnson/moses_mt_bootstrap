#!/bin/bash
######################
# UPDATE AND UPGRADE #
######################
# if argument does not exist (as for user build), update aptitude; else do not
if [ -z "$1" ]
then
  echo "update apt-get"
  sudo apt-get update
  sudo apt-get -y upgrade
else
  echo "do not update apt-get"
fi


sudo apt-get -y install build-essential git libboost-all-dev g++ git subversion automake libtool zlib1g-dev libboost-all-dev libbz2-dev liblzma-dev python-dev libgoogle-perftools-dev

cd
git clone https://github.com/moses-smt/mosesdecoder.git
cd mosesdecoder/
sudo ./bjam -j8


cd
svn checkout http://giza-pp.googlecode.com/svn/trunk/ giza-pp
cd giza-pp
make

# built ginza files need to be moved for moses to find it
cd ~/mosesdecoder
mkdir tools
cp ~/giza-pp/GIZA++-v2/GIZA++ tools
cp ~/giza-pp/GIZA++-v2/snt2cooc.out tools
cp ~/giza-pp/mkcls-v2/mkcls tools


# IRSTLM is a language modelling toolkit from FBK
cd
curl -LO http://sourceforge.net/projects/irstlm/files/latest/download?source=files
tar zxvf irstlm*
cd irstlm*
#./regenerate-makefiles.sh
#./configure --prefix=$HOME/irstlm
#make install


# corpus prep
#cd
#mkdir corpus
#cd corpus 
#wget http://www.statmt.org/wmt13/training-parallel-nc-v8.tgz
#tar zxvf training-parallel-nc-v8.tgz
