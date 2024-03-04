<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    
    <groupId>koddas.web.war</groupId>
    <artifactId>wwp</artifactId>
    <version>1.0.0</version>
    <packaging>war</packaging>
    
    <name>WAR Web Project</name>
    <description>A very simple Maven-enabled WAR web project</description>
    
    <dependencies>
        <dependency>
            <groupId>com.google.code.gson</groupId>
            <artifactId>gson</artifactId>
            <version>2.8.8</version> <!-- Updated version to latest -->
        </dependency>
        <dependency>
            <groupId>javax.ws.rs</groupId>
            <artifactId>javax.ws.rs-api</artifactId>
            <version>2.1</version> <!-- Updated version to latest -->
            <scope>provided</scope>
        </dependency>
    </dependencies>
    
    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version> <!-- Updated version to latest -->
                <configuration>
                    <source>1.8</source> <!-- Changed to Java 8 -->
                    <target>1.8</target> <!-- Changed to Java 8 -->
                </configuration>
            </plugin>
            <!-- Exclude XStream dependency from Maven War plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <version>3.3.1</version> <!-- Updated version to latest -->
                <configuration>
                    <failOnMissingWebXml>false</failOnMissingWebXml>
                    <packagingExcludes>WEB-INF/lib/xstream-*.jar</packagingExcludes>
                </configuration>
            </plugin>
            <!-- Add other necessary plugins here -->
        </plugins>
    </build>
</project>
