sudo apt install -y g++-12
g++-12 --version
wget https://github.com/gcc-mirror/gcc/archive/refs/tags/releases/gcc-15.2.0.tar.gz > /dev/null
tar xvf gcc-15.2.0.tar.gz > /dev/null
cd gcc-releases-gcc-15.2.0
./contrib/download_prerequisites
./configure --enable-languages=c,c++ --prefix=/usr/local/gcc-15.2.0 --disable-bootstrap --disable-multilib
make > /dev/null
sudo make install > /dev/null
sudo ln -fs /usr/local/gcc-15.2.0/bin/g++ /usr/bin/g++-15.2.0
sudo ln -fs /usr/local/gcc-15.2.0/bin/gcc /usr/bin/gcc-15.2.0
cd ..
rm -r gcc-releases-gcc-15.2.0 > /dev/null
rm gcc-15.2.0.tar.gz > /dev/null
g++ --version
g++-15.2.0 --version
pip3 install flask
pip3 install flask_cors
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -o "cloudflared.deb"
sudo apt install "./cloudflared.deb"
rm "cloudflared.deb"
git clone https://github.com/atcoder/ac-library.git
sudo mv ac-library/atcoder /usr/local/include
rm -r ac-library
chmod +x gch_command.sh
./gch_command.sh
