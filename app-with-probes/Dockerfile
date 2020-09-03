FROM python:3.6-slim-buster
WORKDIR app/
COPY requirements.txt ./
RUN pip install -r requirements.txt \
    && mkdir templates
COPY templates/ templates/
COPY *.py *.sh ./
RUN chmod +x *.sh
CMD ["python", "main.py"]
