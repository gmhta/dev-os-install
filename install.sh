sudo apt-get install -y gcc g++ libc-dev wget pkg-config less libfuse-dev fuse zip curl tup
sudo apt-get install git git-lfs
sudo apt-get install -y python3-doit python3-pip
sudo pip3 install pystache
sudo apt-get install -y software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo apt-get update
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo apt-get install meld tmux jq awscli htop postgresql-client

sudo apt-get install npm
sudo npm install --global yarn

curl -sSL https://get.haskellstack.org/ | sudo sh

curl -L https://golang.org/dl/go1.16.4.linux-amd64.tar.gz -o /tmp/go1.16.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/go1.16.4.linux-amd64.tar.gz
rm /tmp/go1.16.4.linux-amd64.tar.gz

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh


# installs as user
sudo usermod -aG docker $USER

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install v14.17.0

npm install -g @bazel/bazelisk

curl -s "https://get.sdkman.io" | bash
sdk install java 11.0.11.hs-adpt 

curl -fsSL https://deno.land/x/install/install.sh | sh
deno install --allow-read --allow-write --allow-run --unstable -f --name dnit https://deno.land/x/dnit@dnit-v1.12.3/main.ts

sudo apt-get install m4
sudo apt install libpam0g-dev
git clone https://github.com/google/fscrypt.git
make
sudo make install
sudo fscrypt setup
# nvme0n1p8 <---
sudo tune2fs -l /dev/nvme0n1p8 | grep 'Block size'
getconf PAGE_SIZE
# ^^^ ensure they are the same
#
sudo tune2fs -O encrypt /dev/nvme0n1p8
cd
mkdir secure
fscrypt encrypt secure
fscrypt unlock ~/secure/
fscrypt lock ~/secure/


curl https://download-cdn.jetbrains.com/toolbox/jetbrains-toolbox-1.20.8352.tar.gz -o /tmp/jetbrains-toolbox-1.20.8352.tar.gz
sudo tar -C /usr/local -xzf /tmp/jetbrains-toolbox-1.20.8352.tar.gz
sudo ln -s /usr/local/jetbrains-toolbox-1.20.8352/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox
rm /tmp/go1.16.4.linux-amd64.tar.gz

curl -L https://download.jetbrains.com/idea/ideaIC-2019.3.3.tar.gz -o /tmp/ideaIC-2019.3.3.tar.gz
sudo tar -C /usr/local -xzf /tmp/ideaIC-2019.3.3.tar.gz
sudo ln -s /usr/local/idea-IC-193.6494.35/bin/idea.sh /usr/local/bin/
# install bazel plugin from inside intellij

echo "fs.inotify.max_user_watches = 524288" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p --system
