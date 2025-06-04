# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3-slim

RUN apt update -y \
    && apt install -y unzip curl

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Encoding
ENV PYTHONIOENCODING=utf-8

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt 

WORKDIR /app
COPY . /app
ENV PYTHONPATH="/app/src:$PYTHONPATH"
ENV PATH="$HOME/.local/bin:$PATH"

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "/app/app/myapp.py"]
