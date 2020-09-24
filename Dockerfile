FROM openjdk:13-jdk-buster as builder

WORKDIR /build
RUN apt-get update -y && apt-get install -y git maven
RUN git clone https://github.com/sourcegraph/lsif-java.git . && \
    git checkout 2de844423a3d94075b845b9d18b30b883b8b967c && \
    ./gradlew installDist

FROM openjdk:13-jdk-buster

RUN apt-get update -y && apt-get install -y maven

LABEL version="0.1.0"
LABEL repository="http://github.com/sourcegraph/lsif-java-action"
LABEL homepage="http://github.com/sourcegraph/lsif-java-action"
LABEL maintainer="Sourcegraph Support <support@sourcegraph.com>"

LABEL "com.github.actions.name"="Sourcegraph Java LSIF Indexer"
LABEL "com.github.actions.description"="Generate LSIF data from Java source code"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="purple"

COPY --from=builder /build/build/ /build/build/
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
