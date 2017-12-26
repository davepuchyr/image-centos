# Launch a builder instance

```
scw --region=ams1 login
scw --region=ams1 run --name="fedora27-builder" image-builder
```

# Get up-to-date tools
```
apt-get install golang
go version
export GOPATH=~/go
go get -u github.com/scaleway/scaleway-cli/cmd/scw
scw version # still the old version
cd ~/go/bin/
./scw version # the new version
export PATH=/root/go/bin:$PATH
scw version # the new versino
scw --region=ams1 login
```

# Build the image
```
git clone https://github.com/davepuchyr/image-fedora27.git
cd ~/image-fedora27/
./fedora27.sh 
```

