# PPTCR

## Introduction

PowerPoint Task Completion-Robustness (**PPTC-R**) is a benchmark that measures LLMs' robustness to the user instruction and Powerpoint software version. The benchmark focuses on two main aspects: robustness to user instructions and robustness to software version changes. It introduces adversarial user instructions that challenge LLMs at **Sentence, Semantic, and Language levels**. It also examines LLMs' adaptability to software version changes by manipulating the available APIs, including an **API update** and **API lack** setting.

We establish our code based on [PPTC](https://github.com/gydpku/PPTC). This repository contains data and code for PPTCR. To evaluate your LLM or LLM-based AI assistant system, you should follow the following instructions.

## Environemnt Setup

```
git clone https://github.com/ZekaiGalaxy/PPTCR; cd PPTCR
conda create -n pptcr python=3.10
conda activate pptcr
pip install -r requirements.txt
```

## LLM Setup

Please refer to the instructions in [PPTC](https://github.com/gydpku/PPTC) and setup the api for both close-sourced and open-sourced models.

## Data Preparation

We provide the raw file of sentence-level, semantic-level, language-level perturbation settings as well as api version perturbation. To generate the benchmark, please follow the following guide:

```
bash PPTCR_test_input/json_file.sh
python main.py --prepare --dataset [long/short] --[perturbation]
```
the perturbation settings include:
```
[--noisy]: semantic-level
[--robust --robust_num=[0/1/2/3]]: sentence-level
[--language]: language-level
[--api_lack]: api lack setting
[--api_update]: api update setting
```
For Language-level perturbation, please refer to `languages.txt` for detailed information.

## Benchmark Evaluation
```
python main.py --test --dataset [long/short] --[perturbation] --model=[your model]
python main.py --eval --dataset [long/short] --[perturbation] --model=[your model]
```
We provide code for 3 closed-source and 4 open-sourced models, as stated in our paper. You can also follow the instructions in [PPTC](https://github.com/gydpku/PPTC) to test your own model.

For the first line, model generates pred ppt file in `PPT_Pred_File`

For the second line, our PPTX Evaluation System gives accuracy score based on the `PPT_Pred_File`

## Results

The evaluation results are shown below, please refer to our paper for detailed information.

## Citation

If you use the benchmark in your publication, please cite it.

```
```


