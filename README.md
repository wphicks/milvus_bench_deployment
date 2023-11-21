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

## Usage
### TL;DR
```
git clone git@github.com:wphicks/milvus_bench_deployment.git
cd milvus_bench_deployment
ansible-playbook -i hosts.ini setup.yml
```

- Open http://localhost:8502 from a browser for benchmarking.

- Open http://localhost:8888 from a browser for Jupyter with access to Milvus
server.
- Run `./show_jupyter_token` to get login token

### Details
The setup.yml playbook will try to pull prebuilt containers if it can and then
build Milvus and VectorDBBench if it cannot. Containers are tagged by the
commit sha of _this_ repo. If the repo state is not clean or a tag
corresponding to the current commit sha cannot be pulled from the registry, the
containers will be built.

On first run, you will be prompted to provide a username and password. This
provides only the most rudimentary of access control to the Web GUI. DO NOT
DEPLOY ON THE INTERNET OR AN UNTRUSTED NETWORK.

