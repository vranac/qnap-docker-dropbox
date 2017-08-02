QNAP Docker Dropbox
===================

As QNAP released QTS 4.x with Cloud Drive Sync, the dropbox experience on QNAP was poor.
The problems range from speed of the application to the dates on files not being recreated.

So I wanted to play with docker a bit, and I needed a dropbox client, so here we are.

How to use this?
================

First execute the following command to build the image

```
docker build -t vranac/qnap-docker-dropbox .
```
Go grab a coffee/tea, the image will be built in the meantime.

Or pull the image from docker hub by running

```
docker pull vranac/qnap-docker-dropbox
```

Once you have the image, you can run it. Execute the following command

```
docker run -i -t -v /path/you/want/mounted:/root/Dropbox --name=dropbox-vranac vranac/qnap-docker-dropbox 
```

So lets break this down, you are running the container in the interactive mode,
running in a pseudo terminal, mounting the path "/path/you/want/mounted" to
be available in container at "/root/Dropbox", and you gave the container the name
dropbox-vranac (change to what works for you).

The output of the first run would be something like

```
This computer isn't linked to any Dropbox account...
Please visit https://www.dropbox.com/cli_link_nonce?nonce=xxxxyyyzzzzz to link this device.
```

Once you visit that link, the dropbox will be connected to your dropbox account and the magic can begin.

The container station in qnap will now pick it up, and you will be able to control it from there.
I suggest you go to the settings for the container and enable auto start.

If you need to get the status of the dropbox daemon, you can execute the following command

```
docker exec -it dropbox-vranac /root/dropbox.py status
```

Replace dropbox-vranac with your container name
