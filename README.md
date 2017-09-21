# ELKB: Elasticsearch + Logstash + Kibana + Beats stack

## What is this repo for?
1. A demonstration of how to setup ELK(B) stack via Docker and Docker compose.
2. Sharing my failure of attempting to use a custom Filebeat module.
3. A demonstration of how to process modified nginx log and publish it to Elasticsearch

## How these all work together
> checkout [./docker-compose.yml](./docker-compose.yml)

- An http echo server running as a container behind the nginx container
- Nginx logs to 3 files normal access.log and errors.log and custom requestbody.log which contains request body when the request's method is POST
- A Filebeat container shares `/var/log/nginx` from the nginx container and shipping it to logstash
- logstash process `requestbody.log` via grok filter and deliver it to the Elasticsearch  server on a container.
- A Kibana let you see the data from the Elasticsearch server

## How to run
> You need to have Docker and docker-compose installed on your machine to do this.

```shell
$ git clone git@github.com:ryuheechul/elkb.git # if you haven't cloned it yet
$ cd elkb
$ make run # to run everything

# open another terminal
$ make request # to send a request to nginx

# open your browser and open `localhost:8080` to access Kibana's UI
# login as elastic/changeme to use Kibana to see the data stored in Elasticsearch
```

## Trouble shooting
- Elasticsearch container exit after a few 10 seconds
  > You probably need to increase the limit of your docker memory limit. I change it from 2GB to 4GB and it worked after changing. (Tested using Docker CE for Mac 17.06.2)
