# docker-hugo
hugo as docker container

### Default Values
| Parameter        | Default Value                                       | Description
| -----------------|-----------------------------------------------------|------------------
| HUGO_VERSION     | 0.69.2                                              | hugo version (see https://github.com/gohugoio/hugo/releases)|
| HUGO_PACKAGE     | hugo_${HUGO_VERSION}_linux-64bit.tar.gz             | just the internal name for the tar.gz package |
| HUGO_DIR         | /usr/hugo                                           | directory, where the hugo site is stored |
| HUGO_URL         | example.de                                          | url for the hugo site |
| HUGO_PORT        | 1313                                                | port of the hugo server |
| HUGO_APPEND_PORT | false                                               | |
| HUGO_BIND        | 0.0.0.0                                             | bind hugo server to everything |
| HUGO_OPTIONS     | --navigateToChanged --templateMetrics --buildDrafts | some options, see hugo docu for more informations |

### docker run command
use the following command to run it as dockerservice:

    docker

### docker-compose
edit the .env.sample fiel and start the service with

    docker-compose up -d
