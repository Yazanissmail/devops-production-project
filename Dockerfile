FROM python:3.12-slim
WORKDIR /app
RUN pip install flask
COPY app.py .
RUN useradd --create-home appuser
USER appuser
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
CMD python -c "import urllib.requset; urillib.request.urlopen('http://127.0.0.1:5000/health')" || exit 1
CMD ["python","app.py"]

