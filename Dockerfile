FROM eclipse-temurin:21-jre AS base

ARG MC_RAM=2G

ENV MC_RAM=${MC_RAM}
ENV RCON_PASSWORD=changeme
ENV EULA=true

WORKDIR /server

ARG CACHEBUST=1
COPY paper.jar paper.jar
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
