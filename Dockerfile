FROM openjdk:11

EXPOSE 8080

COPY build/libs/service.jar /project/

HEALTHCHECK --interval=1m --timeout=3s \
  CMD curl -f http://localhost:8080/actuator/health || exit 1

CMD java -Xms512m -Xmx3072m -jar /project/service.jar
