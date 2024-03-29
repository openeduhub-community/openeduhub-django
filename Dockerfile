# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.9

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

ENV DJANGO_SETTINGS_MODULE="openeduhub.settings.development"


RUN apt-get update
# install psycopg2 dependencies
RUN apt-get install -y apt-utils python3-psycopg2 python3-dev libpq-dev

# install dependencies
RUN pip install --upgrade pip

# Install pip requirements
COPY requirements/base.txt ./requirements/base.txt
COPY requirements/local.txt ./requirements/local.txt
RUN python -m pip install -r requirements/local.txt

WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "openeduhub-django.wsgi"]
