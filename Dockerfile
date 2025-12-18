FROM eclipse-temurin:24-jdk

ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

RUN apt-get update && apt-get install -y curl \
 && curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.113/bin/apache-tomcat-9.0.113.tar.gz \
 && tar xzf apache-tomcat-9.0.113.tar.gz \
 && mv apache-tomcat-9.0.113 $CATALINA_HOME \
 && rm apache-tomcat-9.0.113.tar.gz \
 && rm -rf $CATALINA_HOME/webapps/*

# 👇 AB TOMCAT KHALI HAI
COPY last2.war $CATALINA_HOME/webapps/ROOT.war

EXPOSE 8080

CMD ["sh", "-c", "$CATALINA_HOME/bin/catalina.sh run"]
