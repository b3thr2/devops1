# Use the official WildFly image as the base image
FROM jboss/wildfly:latest

COPY /target/*.war /opt/jboss/wildfly/standalone/deployments/
EXPOSE 8080

# Start WildFly in standalone mode
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
