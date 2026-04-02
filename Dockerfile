FROM eclipse-temurin:21-jre AS base

ARG PAPER_VERSION=1.21.4
ARG PAPER_BUILD=411
ARG MC_RAM=2G

ENV MC_RAM=${MC_RAM}
ENV EULA=true

WORKDIR /server

# Download Paper
ADD https://api.papermc.io/v2/projects/paper/versions/${PAPER_VERSION}/builds/${PAPER_BUILD}/downloads/paper-${PAPER_VERSION}-${PAPER_BUILD}.jar paper.jar

COPY server.properties server.properties
COPY start.sh start.sh
RUN chmod +x start.sh

# Accept EULA
RUN echo "eula=true" > eula.txt

# Game port + RCON
EXPOSE 25565/tcp
EXPOSE 25575/tcp

# Persistent data
VOLUME ["/server/world", "/server/plugins", "/server/logs"]

ENTRYPOINT ["./start.sh"]
