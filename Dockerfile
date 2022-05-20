FROM python:3.9.10-slim-bullseye

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY main.py .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0"]
