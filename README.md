# SBOMScanner
#Author Jaya kumar

**Creating Volume:**
$ sudo docker volume create vol

**Running container with volume:** 
$docker run -it --name docvolcon2 -v "$(pwd)"/pencilblue:/sbomnodejs docker_web
or
 docker run --rm -it --name test4 -v "$(pwd)"/create-nodejs-project:/vol3 8a37256c9914 /bin/bash
 #vol3 is volume created and /create-nodejs-project is from github


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

**Command to upload BOM into dependency track:**

curl -v -H 'X-API-KEY: ON2YbnaXv3fR7o7krD1bdiUGiSl008H8' -H 'Content-Type: multipart/form-data' -F 'project=5435bad9-2b81-4270-b62a-1ad9d6039e84' -F 'bom=bom.xml' http://localhost:8080/api/v1/bom

**Command to upload BOM as base64 encoded data:**
curl -v -X "PUT" "http://localhost:8080/api/v1/bom" -H 'Content-Type: application/json' -H 'X-API-KEY: ON2YbnaXv3fR7o7krD1bdiUGiSl008H8' -d $'{"project": "758fe80a-ae76-451b-a298-ac2816b5c5f5", "scan": "$(cat bom.xml | base64 - )"}'

Command to execute BOM in python:
$docker run --rm -itd --name test5 -v "$(pwd)"/dvpwa:/vol4 e907273b5c40 /bin/bash
7d8c2b322f6b83489b43b20521ada52e86e4f6b9c18713cdee4103647bee1d73

$docker exec -it 

#You first need to build the binary locally.

#This can be achieved by running

#dotnet publish src/cyclonedx/cyclonedx.csproj -r linux-x64 --configuration Release --self-contained true /p:PublishSingleFile=true /p:IncludeNativeLibrariesInSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true --output bin/linux-x64

#or downloading the Linux x64 binary of the latest release and saving it to that path.
