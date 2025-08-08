# Running Open-Source LLMs on TTU REPACSS Clusters using Ollama

A hands-on guide and accompanying scripts for running Ollama (local LLM inference) on REPACSS (H100) clusters. 

## Overview

This repository contains:

- **`ollama.sh`**: helper function to launch and manage the Ollama server.  
- **`test.py`**: example Python script to verify your Ollama server.
- **`tutorial.ipynb`**: example notebook that connects to your Ollama server.
- **`requirements.txt`**: libraries needed to run the full tutorial. 

Follow the steps below to get up and running.

## Prerequisites

- Access to TTU REPACSS HPC clusters 

## Installation
Clone this code repo:

```bash
cd </your/project/path>
git clone https://github.com/nsfcac/ollama_repacss.git
cd ollama_REPACSS
```

## Running the `tutorial.ipynb` notebook on REPACSS 


```bash

cd ollama_REPACSS
chmod +x setup_ollama.sh
./setup_ollama.sh
source ollama.sh
pip install -r requirements.txt
```
