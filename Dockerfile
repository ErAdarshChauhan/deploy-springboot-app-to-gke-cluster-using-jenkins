FROM dockerhub.artifactory.davita.com/base/openjdk:11.0.12-slim-cwow as build
WORKDIR /workspace/app
ADD ./build/libs/demo-0.0.1-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
ENV SPRING_PROFILES_ACTIVE=""
EXPOSE 8080
#ENTRYPOINT ["sh","-c","exec java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -cp app:app/lib/* $(cat start-class.txt)"]
ENTRYPOINT ["sh","-c","java ${JAVA_OPTS} -cp app:app/lib/* $(cat start-class.txt)"]