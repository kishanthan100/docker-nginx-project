FROM python

WORKDIR /app

# Install uv
RUN pip install uv

COPY main.py .
COPY templates ./templates
COPY pyproject.toml uv.lock ./

# Install dependencies using uv
RUN uv pip install --system .

EXPOSE 5000

CMD ["python", "main.py"]
