FROM python:3.8-slim

WORKDIR /app

ENV PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1

COPY DFBugMonitor/requirements.txt .

RUN pip install -r requirements.txt

COPY template.conf dfbugbot.conf
COPY DFBugMonitor /app/plugins/DFBugMonitor

ENTRYPOINT ["supybot", "--allow-root", "bot.conf"]
