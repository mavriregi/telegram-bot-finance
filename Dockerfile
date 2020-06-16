FROM python:3.8

WORKDIR /home

ENV TELEGRAM_API_TOKEN="1214772386:AAF6ne7HVk8ZSuviMed53Bq9RxcNEZdcMlo"
#ENV TELEGRAM_API_TOKEN="1197978512:AAH_UaC63r3jxd9fkDAXcLGAq5H8tUF_Ugk"
ENV TELEGRAM_ACCESS_ID="337632046"
ENV TELEGRAM_PROXY_URL = "https://telegg.ru/orig/bot"
#ENV TELEGRAM_PROXY_URL="http://37.221.66.102:24531"
#ENV TELEGRAM_PROXY_URL = "185.104.184.105:443"
#ENV TELEGRAM_PROXY_LOGIN="xghhku"
#ENV TELEGRAM_PROXY_PASSWORD="YL06R7L1vf"
ENV TELEGRAM_PROXY_LOGIN=""
ENV TELEGRAM_PROXY_PASSWORD=""



ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN pip install -U pip aiogram pytz && apt-get update && apt-get install sqlite3
COPY *.py ./
COPY createdb.sql ./

ENTRYPOINT ["python", "server.py"]

