QNAP Docker Dropbox
===================

As QNAP released QTS 4.x with Cloud Drive Sync, the dropbox experience on QNAP was poor.
The problems range from speed of the application to the dates on files not being recreated.

So I wanted to play with docker a bit, and I needed a dropbox client, so here we are.

How to use this?
================

First execute the following command to build the image

```
docker build -t dropbox .
```

Go grab a coffee/tea, the image will be built in the meantime.

Once you have the image, you can run it. Execute the following command

```
docker run -i -t -v /path/you/want/mounted:/Dropbox dropbox
```

So lets break this down, you are running the container in the interactive mode,
running in a pseudo terminal, mounting the path "/path/you/want/mounted" to
be available in container at "/Dropbox".

The output of the first run would be something like

```
This computer isn't linked to any Dropbox account...
Please visit https://www.dropbox.com/cli_link_nonce?nonce=xxxxyyyzzzzz to link this device.
```

Once you visit that link, the dropbox will be connected to your dropbox account and the magic can begin.

First thing to do, is to comming the latest changes to the image, so it is available on demand with
all the changes connecting to your account has created

```
docker commit `docker ps -l -q` dropbox-vranac
```

With this command you have created a commit/snapshot that you can reference from now on (this allows you to create multiple dropbox account sync on your NAS) by name, in my case it is dropbox-vranac

Now that you have a snapshot, you can stop/kill the container by executing

```
docker kill `docker ps -l -q`
```

And finally you can the following to start the container daemonized

```
docker run -d -v /path/you/want/mounted:/Dropbox dropbox-vranac
```