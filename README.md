---
title: Wanderlust
emoji: 🚀
colorFrom: red
colorTo: pink
sdk: docker
pinned: false
license: mit
app_port: 7860
---

OpenAI Wanderlust application with [Solara](https://solara.dev) 
 * [Solara GitHub](https://github.com/widgetti/solara/).
 * [Deployed app](https://huggingface.co/spaces/solara-dev/wanderlust)


https://github.com/widgetti/wanderlust/assets/1765949/fe3db611-4f46-4ca3-b4c2-ace6d2b1493b

17/01/2024

*** updated branch with poetry support.
*** deleted pip support.
*** modified Dockerfile

How to run locally:

    docker build -t wanderlust .

    docker run -it --publish 7860:7860 wanderlust
    Solara server is starting at http://0.0.0.0:7860

Attention!
You will have to set up your OPENAI_API_KEY in the container profile.
Create a .env file with something like:

    OPENAI_API_KEY=YOUR_VALID_API_KEY

then there are two ways:

1)   log in into your container and export your OPENAI_API_KEY

    ┌<▪> ~/g/wanderlust
    └➤
    docker container ls
    CONTAINER ID   IMAGE                                  COMMAND                  CREATED         STATUS             PORTS                    NAMES
    861a5c251335   wanderlust                             "poetry run solara r…"   8 minutes ago   Up 8 minutes       0.0.0.0:7860->7860/tcp   sleepy_mclean
    b8715388db06   aquasec/trivy-docker-extension:0.4.7   "/bin/sh -c /creds-s…"   7 days ago      Up About an hour                            aquasec_trivy-docker-extension-desktop-extension-service
    ┌<▸> ~/g/wanderlust
    └➤
    docker exec -it 861 /bin/bash
    user@861a5c251335:/$ export OPENAI_API_KEY=YOUR_API_KEY
    
go to http://0.0.0.0:7860 

If API_KEY is correct, you will see the interface. This method is ephemeral, if the container is drop, you will have to recreate
the process.

2) Create a .env file with a content like this in the host machine:

    OPENAI_API_KEY=YOUR_VALID_API_KEY

and then run the next command in the host machine:

    ┌<▸> ~/g/wanderlust
    └➤
    docker run --env-file .env --publish 7860:7860 wanderlust
    Solara server is starting at http://0.0.0.0:7860
    ...
