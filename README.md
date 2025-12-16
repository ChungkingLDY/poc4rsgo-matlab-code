# Probability of Improvement Criterion Revisited: Applications to Generalized Ranking and Selection

This repository contains experimental MATLAB code and datasets for the working paper: "Probability of Improvement Criterion Revisited: Applications to Generalized Ranking and Selection". The codes were written and run in MATLAB R2023a, on Windows 10.

## Run the experiments

To run the experiments in Section 5, go to the scripts folder and choose the respective objective settings. Open the main.m to configure the case number (casenum=1), sampling policy (policy='EA'), and number of macro replications (e.g., R=1e4), and then run. 

Parallel computing via High-performance computing (HPC) is suggested as the large number of iterations and macro replications.

To implement the sampling policy "Oracle", users need to install and configure the 	[cvx](https://cvxr.com/cvx/doc/index.html) and [mosek](https://www.mosek.com/).

## Plot the figures

All the generated experimental datasets are provided in the data folder. Go to the respective objective setting folders, run the plot_spider.m and plot_line.m to reproduce the figures in Section 5 and Appendix A.2.

To run plot_spider.m, users need to download and configure the [spider_plot](https://www.mathworks.com/matlabcentral/fileexchange/59561-spider_plot) package.

