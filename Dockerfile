FROM rounds/10m-python
MAINTAINER David Bolshoy ROUNDS <david@rounds.com>

VOLUME ["/var/log"]

# add our files
COPY elastalert /opt/elastalert/elastalert
COPY requirements.txt /opt/elastalert/

WORKDIR /opt/elastalert

# install requirements
RUN \
  apt-get update && \
  apt-get install -y python-dev && \
  pip install -r requirements.txt && \
  rm -rf /var/lib/apt/lists/*

# Define default command.
CMD python -m elastalert.elastalert --verbose &> /var/log/elastalert/elastalert-stdout.log