# Setup local environment
```
export SCW_REGION=ams1
go get -u github.com/scaleway/scaleway-cli/cmd/scw
```

# Launch a builder instance
```
scw --region=$SCW_REGION login
scw --region=$SCW_REGION run --name="fedora27-builder" image-builder
```

# Setup remote environment
```
export SCW_REGION=ams1
export EDITOR=vim
ssh-keygen
```

# Get up-to-date tools
```
apt-get update
apt-get install golang
go version
export GOPATH=~/go
go get -u github.com/scaleway/scaleway-cli/cmd/scw
scw version # still the old version
cd ~/go/bin/
./scw version # the new version
export PATH=/root/go/bin:$PATH
scw version # the new version
scw --region=$SCW_REGION login
```

# Build the image (it may fail near a final step)
```
cd
git clone https://github.com/davepuchyr/image-fedora27.git
cd ~/image-fedora27/
./fedora27.sh # ERRO[0015] failed to wait for server 8052f315-5cc1-4619-93fe-d5b5e6126782: unexpected end of JSON input
```

# If the previous step failed then manually create the image from the volume that was created
Click the "Create image" button on the Images page of Scaleway's control panel.

# Launch a new instance with the new image
```
cd /etc/ssh && mv *key* /tmp && systemctl restart scw-generate-ssh-keys.service && systemctl daemon-reload && systemctl reload sshd.service # regenerate keys
dnf groupinstall "Fedora Server Edition"
reboot & exit # a manual hard reboot via Scaleway's control panel is necessary as of 2017.12.25
```

