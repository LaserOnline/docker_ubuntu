$NameContainer = "ubuntu-dev-test"
# $name = Read-Host "Name Container "
# $version = Read-Host "Version "

    # if ([string]::IsNullOrEmpty($version)) {
    #     docker build -t $name .
    #     docker run -it $name
    # } else {
    #     $name_tag = $name + ":" + $version
    #     docker build -t $name_tag .
    #     docker run -it $name_tag
    # }

    docker build -t $NameContainer .

    docker run --name $NameContainer -it -v C:\Docker\Ubuntu\volumes:/app/install $NameContainer

