# SBOMScanner
#Author Jaya kumar

**Creating Volume:**
$ sudo docker volume create vol

**Running container with volume:** 
$docker run -it --name docvolcon2 -v "$(pwd)"/pencilblue:/sbomnodejs docker_web



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
**
Command to run dependency track:**

docker run -d -m 8192m -p 8080:8080 --name dependency-track -v dependency-track:/data dependencytrack/bundled
