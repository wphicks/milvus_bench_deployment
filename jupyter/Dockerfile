FROM jupyter/minimal-notebook
RUN pip install pymilvus
COPY jupyter_server_config.py /home/jovyan/.jupyter/jupyter_server_config.py
COPY hello_milvus_gpu.ipynb /home/jovyan/hello_milvus_gpu.ipynb
