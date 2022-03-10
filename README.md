# SBOMScanner
#Author Jaya kumar

**Creating Volume:**
$ sudo docker volume create vol
vol

**Inspecting Volume to know container path:**
sudo docker volume inspect vol
[
    {
        "CreatedAt": "2022-03-10T13:28:35Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": **"/var/lib/docker/volumes/vol/_data",**
        "Name": "vol",
        "Options": {},
        "Scope": "local"
    }
]

Create Dockerfile to clone sample code 
