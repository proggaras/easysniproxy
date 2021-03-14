# easysniproxy

Simple Sniproxy to run in you own network. Forwards all traffic on port 80 and 443. 

Easy way to start:
```bash
docker run -d \
	--name sniproxy \
    -d -p 80:80 \
    -p 443:443 \
	--restart=unless-stopped \
	proggaras/easysniproxy
```

If you have to adapt the config you can mount them by yourself into the container:
```bash
docker run -d \
	--name sniproxy \
    -d -p 80:80 \
    -p 443:443 \
    -v $(pwd)/sniproxy.conf:/etc/sniproxy/sniproxy.conf \
	--restart=unless-stopped \
	proggaras/easysniproxy
```