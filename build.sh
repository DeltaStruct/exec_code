sudo apt install -y g++-12
pip3 install flask
pip3 install flask_cors
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -o "cloudflared.deb"
sudo apt install "./cloudflared.deb"
rm "cloudflared.deb"
git clone https://github.com/atcoder/ac-library.git
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:"pwd"/ac-library"
echo 'export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:"pwd"/ac-library"\n' >> ~/.bash_profile
echo 'export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:"pwd"/ac-library"\n' >> ~/.bashrc
