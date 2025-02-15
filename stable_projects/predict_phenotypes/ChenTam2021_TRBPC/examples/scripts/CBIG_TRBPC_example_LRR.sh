#!/bin/bash
# this function runs all the example linear ridge regression
#
# Written by Jianzhong Chen and CBIG under MIT license: https://github.com/ThomasYeoLab/CBIG/blob/master/LICENSE.md

# set cluster; change it to cluster="none" if you don't have a cluster
cluster=CBIG_cluster

# set other input variables
outdir=$1/LRR
mkdir -p $outdir
LF=$outdir/LRR.log

scripts_dir=${CBIG_CODE_DIR}/stable_projects/predict_phenotypes/ChenTam2021_TRBPC
input_dir=${CBIG_CODE_DIR}/stable_projects/predict_phenotypes/ChenTam2021_TRBPC/examples/input
subject_list=${input_dir}/subject_list.txt
y_list=${input_dir}/y_list.txt
FD_file=none
DVARS_file=none
outstem=all_score
csv_file=${input_dir}/behav_covariates.csv
feature_file=${input_dir}/FC_rs.mat
covariate_list=${input_dir}/covariates.txt
domain=${input_dir}/domain.mat

# run LRR
${scripts_dir}/LRR_LpOCV/CBIG_TRBPC_LRR_LpOCV_workflow.sh -subject_list ${subject_list} -feature_file ${feature_file} \
-outstem ${outstem} -y_list ${y_list} -covariate_list ${covariate_list} -FD_file ${FD_file} -DVARS_file ${DVARS_file} \
-outdir ${outdir} -csv_file ${csv_file} -domain ${domain} -cluster "${cluster}"
