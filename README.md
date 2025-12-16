# Probability of Improvement Criterion Revisited: Applications to Generalized Ranking and Selection

This repository contains MATLAB code and datasets used in the numerical experiments for the working paper:

**“Probability of Improvement Criterion Revisited: Applications to Generalized Ranking and Selection.”**

All code was developed and tested using **MATLAB R2023a** on **Windows 10**.

---

## Running the Experiments

To reproduce the experiments reported in Section 5 of the paper, navigate to the `scripts` directory and select the folder corresponding to the desired objective setting.

Open `main.m` and configure the following parameters:
- `casenum`: problem case index (e.g., `casenum = 1`)
- `policy`: sampling policy (e.g., `policy = 'EA'`)
- `R`: number of macro replications (e.g., `R = 1e4`)

After setting these parameters, run `main.m`.

Due to the large number of iterations and macro replications, **parallel computing on a high-performance computing (HPC) platform is strongly recommended**.

### Oracle Policy Requirements

To use the **Oracle** sampling policy, users must install and configure the following optimization packages:
- [CVX](https://cvxr.com/cvx/doc/index.html)
- [MOSEK](https://www.mosek.com/)

---

## Plotting the Figures

All generated experimental datasets are provided in the `data` directory. To reproduce the figures in Section 5 and Appendix A.2 of the paper, navigate to the folder corresponding to the desired objective setting and run:
- `plot_spider.m`
- `plot_line.m`

### Additional Dependencies

To run `plot_spider.m`, users must install the following MATLAB package:
- [spider_plot](https://www.mathworks.com/matlabcentral/fileexchange/59561-spider_plot)

---

## References

The benchmark algorithms implemented and evaluated in the experiments are primarily drawn from the following works:

1. Chen, C. H., Lin, J., Yücesan, E., & Chick, S. E. (2000). Simulation budget allocation for further enhancing the efficiency of ordinal optimization. Discrete Event Dynamic Systems, 10(3), 251-270.

2. Chen, Y., & Ryzhov, I. O. (2023). Balancing optimal large deviations in sequential selection. Management Science, 69(6), 3457-3473.

3. Chick, S. E., Branke, J., & Schmidt, C. (2010). Sequential sampling to myopically maximize the expected value of information. INFORMS Journal on Computing, 22(1), 71-80.

4. Frazier, P. I., Powell, W. B., & Dayanik, S. (2008). A knowledge-gradient policy for sequential information collection. SIAM Journal on Control and Optimization, 47(5), 2410–2439.

5. Gao, S., & Chen, W. (2016). A new budget allocation framework for selecting top simulated designs. IIE transactions, 48(9), 855-863.

6. Li, D., Chew, E. P., Li, H., Yücesan, E., & Chen, C. H. (2025). Knowledge Gradient Procedure to Select the Best System Under Pairwise Comparisons. Naval Research Logistics, 72(8), 1078-1096.

7. Peng, Y., Chong, E. K., Chen, C. H., & Fu, M. C. (2018). Ranking and selection as stochastic control. IEEE Transactions on Automatic Control, 63(8), 2359-2373.

8. Xiao, H., Gao, S., & Lee, L. H. (2017). Simulation budget allocation for simultaneously selecting the best and worst subsets. Automatica, 84, 117-127.

9. Xiao, H., Lee, L. H., & Ng, K. M. (2013). Optimal computing budget allocation for complete ranking. IEEE Transactions on Automation Science and Engineering, 11(2), 516-524.

10. Zhang, G., Peng, Y., Zhang, J., & Zhou, E. (2023). Asymptotically optimal sampling policy for selecting top-m alternatives. INFORMS Journal on Computing, 35(6), 1261-1285.

11. Zhang, J., Li, Z., Wang, C., Zang, D., & Zhou, M. (2016). Approximate simulation budget allocation for subset ranking. IEEE Transactions on Control Systems Technology, 25(1), 358-365.

12. Zhang, S., Lee, L. H., Chew, E. P., Xu, J., & Chen, C. H. (2015). A simulation budget allocation procedure for enhancing the efficiency of optimal subset selection. IEEE Transactions on Automatic Control, 61(1), 62-75.

---
