import time

from fastapi import FastAPI

app: FastAPI = FastAPI()


@app.get("/version")
def get_version() -> str:
    time.sleep(5)
    return "v0.2"
