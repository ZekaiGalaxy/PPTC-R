# PPTC-R

PPTCR Introduction

## Setup

```
git clone https://github.com/ZekaiGalaxy/PPTCR; cd PPTCR
conda create -n pptcr python=3.10
conda activate pptcr
pip install -r requirements.txt
```

## LLM Setup

Please refer to the instructions in [PPTC](https://github.com/gydpku/PPTC) and setup the api for both closed source and open source models.

## Data Preparation

We provide the raw file of sentence-level, semantic-level, language-level perturbation settings as well as api version perturbation. To generate the test dataset, please follow the following guide:

```
cd PPTCR_test_input
bash json_file.sh
cd ..
python main.py --prepare --dataset [long/short] --[perturbation settings]
```
the perturbation settings include:
```
--noisy: semantic-level
--robust --robust_num=[0/1/2/3]: sentence-level
--language=[Arabic/Bulgarian/Chinese/French/German/Greek/Hindi/
            Russian/Spanish/Swahili/Thai/Turkish/Urdu/Vietnamese]: language-level
--api_lack: api version
--api_update: api version
```
