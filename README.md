# Redhat UBI8 Minimal with Zulu OpenJDK 11 and Tomcat Native

Base on Redhat UBI8 minimal image `registry.access.redhat.com/ubi8/ubi-minimal`, this image adds:

- Zulu OpenJDK 11 Community (Headless)
- OpenSSL
- Apache APR (Apache Portable Runtime)
- Tomcat Native

This image is suitable for Spring Boot with embedded Tomcat. Tomcat Native is pre-built into this image, application may turn on APR for better performance, and better integration with native server technologies.
