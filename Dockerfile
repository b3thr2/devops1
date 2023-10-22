# Use the official WildFly image as the base image
FROM jboss/wildfly:latest

# Define environment variables (if needed)
# ENV VARIABLE_NAME=variable_value

# Copy your EcommerceApp.war to the deployments folder in WildFly
COPY EcommerceApp.war /opt/jboss/wildfly/standalone/deployments/

# Expose the ports for WildFly (HTTP and management)
EXPOSE 8080

# Start WildFly in standalone mode
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
