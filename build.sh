sudo apt install -y g++-12
g++-12 --version
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
