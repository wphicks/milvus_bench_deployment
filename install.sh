#!/bin/bash
pip install -r requirements.txt
ansible-playbook -i hosts.ini setup.yml
