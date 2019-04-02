FROM centos
MAINTAINER VMR
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel
RUN mkdir /root/docker
EXPOSE 8080
WORKDIR /root/docker
COPY ./target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar /root/docker
CMD ["java","-jar","/root/docker/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar"]
