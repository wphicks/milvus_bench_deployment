# Milvus Benchmark Deployment
This repo contains my personal tools for building and benchmarking development
versions of Milvus. It is not an official version of anything. It can be used
to build and deploy Milvus and VectorDBBench. The VectorDBBench web GUI will be
exposed on port 8502.

## Prereqs
- Ansible

To install:
```
pip install -r requirements.txt
```

## Deploy pre-built containers
If you have access to the corresponding container registry, you can simply
deploy containers that I have previously built and pushed. To do so, run
```
ansible-playbook -i hosts.ini --tags deploy setup.yaml
```

Note that the first time this is run, you will be prompted to provide a
username and password. These credentials will be used to limit access to the
web GUI, but they provide only the most rudimentary access control. DO NOT
DEPLOY ON THE OPEN INTERNET.

## Build Milvus and VectorDBBench
In setup.yaml, there are tasks to clone specific commits of Milvus and
VectorDBBench. If 
