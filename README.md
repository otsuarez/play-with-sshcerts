# Introduction

Playground for testing ssh certificates.

Using `docker-compose` two "servers" will be created to test ssh connectivity.

The goal is to setup both: server and client certificate to be used for ssh connection.

Why server certificates?

Because we want to make sure we're exposing our keys only to trusted servers.

Why client certificates?

Unlike ssh keys wich are inmutable across their lifespan, ssh certificates can be created with an expiration date, or restriction on which server they can be used. Provide control in ways not possible with traditional means.


# Usage

Open two terminals on this same directory. 

First terminal:
```
docker-compose up -d
docker-compose exec server1 bash
```
Then inside `server1` execute the following command:
```
/root/shared/server1.sh
```

On the second terminal:
```
docker-compose exec server1 bash
```
Once on the `server2` shell, execute the following commands:
```
/root/shared/server2.sh
rm -f /root/.ssh/id_rsa.pub
ssh server1
```

et voila!



