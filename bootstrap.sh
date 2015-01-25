sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential git libboost-all-dev g++ git subversion automake libtool zlib1g-dev libboost-all-dev libbz2-dev liblzma-dev python-dev libgoogle-perftools-dev

cd
git clone https://github.com/moses-smt/mosesdecoder.git
cd mosesdecoder/
./bjam -j8
