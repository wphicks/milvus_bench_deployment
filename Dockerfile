FROM python:3.11
RUN mkdir -p /tmp/vector_db_bench/dataset
COPY VectorDBBench /VectorDBBench
COPY streamlit_config.toml /root/.streamlit/config.toml
WORKDIR /VectorDBBench
RUN pip install .
ENTRYPOINT ["init_bench"]
