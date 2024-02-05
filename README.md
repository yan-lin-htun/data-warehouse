# Running Terraform with GitLab CI/CD Pipeline


## (1) Install Docker on your machine.

```
$ curl -fsSL get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh
```

## (2) Install gitlab-runner on your machine.


```
$ sudo curl -L --output /usr/local/bin/gitlab-runner "https://s3.dualstack.us-east-1.amazonaws.com/gitlab-runner-downloads/latest/binaries/gitlab-runner-linux-amd64"

$ sudo chmod +x /usr/local/bin/gitlab-runner

$ sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

$ sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner

$ sudo gitlab-runner start
```

## (3) Register gitlab-runner with specific GitLab Project.

```
$ sudo gitlab-runner register
```

## (4) Create variables for AWS_ACCESS_KEY and AWS_SECRET_KEY in GitLab.

