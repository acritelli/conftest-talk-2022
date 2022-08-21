# Uncomment line 2 and comment out line 3 to trigger a policy violation
# FROM ubuntu:12.04
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
