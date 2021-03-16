# easysniproxy
## Description
Simple Sniproxy image to run this service in your own network. Traffic is accepted from everywhere.
All Requests on port 80 and 443 will be forwarded. Standard DNS server for this will be 9.9.9.9.
## Start this container with the standard configuration inside the Docker Image
```bash
docker run -d \
	--name sniproxy \
    -d -p 80:80 \
    -p 443:443 \
	--restart=unless-stopped \
	proggaras/easysniproxy
```
## Mount yout own configuration into the Docker container
```bash
docker run -d \
	--name sniproxy \
    -d -p 80:80 \
    -p 443:443 \
    -v $(pwd)/sniproxy.conf:/etc/sniproxy/sniproxy.conf \
	--restart=unless-stopped \
	proggaras/easysniproxy
```