## Basic usage

1. Install docker through [this link](https://docs.docker.com/engine/installation/)
2. In your docker-enabled terminal, run `docker run -t -i --rm -p 5901:5901 kwong999999/data-science-env` to start a VM running the OS image, note that `--rm` means the instance is removed after you terminate this command, your changes to filesystem in the environment is not persisted
3. Use any vnc client (eg. Mac's Finder, [VNC Viewer](https://www.realvnc.com/download/viewer/), ...) to connect to `192.168.99.100:5901`, and you're ready for action

## Troubleshooting

### When running docker command, if you get error message `Cannot connect to the Docker daemon. Is the docker daemon running on this host?`

Apart from the case when docker daemon is not running, it's also possible that you don't have the correct environment variables set in your current shell (eg.in mac,  you start your own shell instead of using `Docker Quickstart Terminal`), try running ``eval `docker-machine env default` `` to set up the environment variables

### Can't connect VNC in step 3

You can check the ip of the docker instance with `docker-machine ip default`
