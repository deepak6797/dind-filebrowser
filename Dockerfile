FROM ubuntu:latest

ENV PRIVILEGED_MODE=true
#ensure that the build process can proceed without requiring user input.
ENV DEBIAN_FRONTEND=noninteractive 

COPY ./run.sh /
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common fuse-overlayfs openssh-client python3 && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    usermod -aG docker root && \
    chmod +x /run.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 8080 8081
ENTRYPOINT [ "/run.sh" ]