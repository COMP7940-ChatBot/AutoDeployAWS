#FROM ubuntu
#ENV DEBIAN_FRONTEND=noninteractive
#RUN apt-get update
#RUN apt-get install apache2 -y
#RUN apt-get install apache2-utils -y
#RUN apt-get clean
#EXPOSE 80
#RUN echo "Hello From Server" > /var/www/html/index.html
#CMD ["apache2ctl","-D","FOREGROUND"]

FROM python:3-alpine3.11
WORKDIR /app
COPY . /app
COPY chatbot_lab4.py .
COPY requirements.txt .
ENV ACCESS_TOKEN="5864267617:AAGLbgGXl9Dj32aZELBgCoLvB52O69XaLqU"
ENV HOST="redis-15681.c114.us-east-1-4.ec2.cloud.redislabs.com"
ENV PASSWORD="Kh01FOjYRhgN1HR5E0q6mbQ2Dg4NO0T6"
ENV REDISPORT="15681"
RUN pip install --user pip update --user
RUN apk add -u gcc musl-dev
RUN python -m pip install --user --upgrade pip
RUN python -m pip install --user --upgrade setuptools
RUN pip install --user -r requirements.txt
CMD python chatbot_lab4.py
