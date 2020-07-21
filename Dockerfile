FROM centos
RUN dnf install wget -y
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN dnf install java-11-openjdk.x86_64 jenkins -y
RUN dnf install -y openssh-server
RUN dnf install net-tools -y
RUN dnf install git -y
RUN dnf install httpd -y
RUN dnf install which -y
RUN dnf install python36 -y
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN mkdir .kube
COPY ca.crt /root/
COPY client.crt /root/
COPY client.key /root/
COPY config /root/.kube/
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "java -jar /usr/lib/jenkins/jenkins.war &" >> /root/.bashrc
RUN bash
