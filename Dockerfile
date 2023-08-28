FROM python:3.11
RUN mkdir -p /tmp/vector_db_bench/dataset
COPY VectorDBBench /VectorDBBench
WORKDIR /VectorDBBench
RUN pip install .
ENTRYPOINT ["init_bench"]
