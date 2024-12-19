sudo apt install -y g++-12
pip3 install flask
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -o "~/cloudflared.deb"
sudo apt install "~/cloudflared.deb"
rm "~/cloudflared.deb"
