# Usa la imagen Alpine de base
FROM alpine

# Instala OpenJDK 11, Git y Maven
RUN apk add --no-cache openjdk11 git maven

# Establece la variable de entorno JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk

# Establece la variable de entorno PATH para Java y Maven
ENV PATH $PATH:$JAVA_HOME/bin

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Descarga del repositorio
RUN git clone -b v4.2.0 --single-branch https://github.com/wso2/product-apim.git .

# Define un punto de montaje en el contenedor
#VOLUME /app/modules/p2-profile/product/target/wso2carbon-core-4.8.1/repository/conf

# Ejecución maven install
RUN mvn install -Dmaven.test.skip=true 

RUN unzip /app/modules/distribution/product/target/wso2am-4.2.0.zip

WORKDIR /app/wso2am-4.2.0/bin/

# EXPOSE de puertos
EXPOSE 9763 9443 9999 11111 8280 8243 5672 9711 9611 9099

# Inicializacion de contenedor
ENTRYPOINT ["./api-manager.sh"]
