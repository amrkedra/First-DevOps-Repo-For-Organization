FROM python:3.9.19-slim-bullseye
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python3", "app.py" ]


