scw --region=ams1 login
scw --region=ams1 run --name="fedora27-builder" image-builder

- after the server starts

git clone https://github.com/davepuchyr/image-fedora27.git
cd image-fedora27/
./fedora27.sh 

