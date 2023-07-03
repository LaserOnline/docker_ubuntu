
$ForderShare = "share"
$ForderDisk = "disk"
$PathDir = "C:\Docker\Ubuntu\docker_ubuntu\"

$NameContainer = "ubuntu-dev-test"
$PathHost = "$PathDir$ForderShare"
$PathContainer = "/app/$ForderShare"
$volumeMapping = $PathHost + ":" + $PathContainer
$Username = ""


function CheckDir {

    if (-not (Test-Path $PathDir)) {
        $PathDir = (Get-Location).Path
    }

}

function DockerBuild {
    docker build -t $NameContainer .
}

function DockerRun {
    docker run --name $NameContainer -it -v $volumeMapping $NameContainer
}

function DockerInterActive {
    if ($Username -eq $null) {
        docker exec -it $NameContainer bash
    } else {
        docker exec -it -u $Username $NameContainer bash
    }
}

function DockerStart {

    $existingContainer = docker ps -a --filter "name=$NameContainer" --format "{{.Names}}"

    if ($existingContainer -contains $NameContainer) {
        docker start $NameContainer
        DockerInterActive
    } else {

        $diskFolderExists = Test-Path "$PathDir\$ForderDisk"
        $shareFolderExists = Test-Path "$PathDir\$ForderShare"

        if (-not $diskFolderExists) {
            New-Item -ItemType Directory -Path "$PathDir\$ForderDisk"
        }

        if (-not $shareFolderExists) {
            New-Item -ItemType Directory -Path "$PathDir\$ForderShare"
        }
        
        DockerBuild
        DockerRun
    }

}

CheckDir
DockerStart
