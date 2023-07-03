
$container = "ubuntu-dev-test"

function DockerStop {
    docker stop $container
}

function DockerRemoveContainer {
    docker rm --force $container
    docker rmi --force $container
}


function DockerBuilderPrune {
    docker builder prune --force
}


function DockerRemove {
    $submit = Read-Host "Use Docker Prune Send = y "

    if ($submit -eq "y") {
        DockerRemoveContainer
        DockerBuilderPrune
    } elseif ($submit -ne "y" -or $submit -eq $submit) {
        DockerRemoveContainer
    }
    
}

DockerRemove