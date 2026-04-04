FROM eclipse-temurin:21-jre AS base

ARG MC_RAM=2G

ENV MC_RAM=${MC_RAM}
ENV RCON_PASSWORD=changeme
ENV EULA=true
ENV BUILD_DATE=2026-04-05T02

WORKDIR /mc

COPY paper.jar paper.jar
COPY server.properties server.properties
COPY spigot.yml spigot.yml
COPY start.sh start.sh
COPY plugins/ plugins/
RUN chmod +x start.sh

# Accept EULA
RUN echo "eula=true" > eula.txt

# Game port + RCON
EXPOSE 25565/tcp
EXPOSE 25575/tcp


ENTRYPOINT ["./start.sh"]
