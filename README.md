# Project 4: Causal Inference

### [Project Description](doc/project4_desc.md)

Term: Fall 2020

+ Team # 7 
+ Project title: Causal Inference Algorithms Evaluation 
+ Project Subtitle: Compare different Propensity Score Estimation Methods for Full Matching with propensity score distance measurement and Weighted Regression
+ Team members
	+ Yunuo Ma (Presenter)
	+ Mengyao He
	+ Xinyuan Peng
	+ Xiaoli Sun
	+ Ziyu Kong
+ Project summary: 

In this project, our group was assigned to use all 5 methods of propensity score estimations including Logistic Regression, L1 and L2 Penalized Logistic Regression, Regression Trees and Boosting Stumps with full matching using propensity score distance measurement, and Logistic Regression propensity score estimation with weighted regression. We are interested in the average effect of the treatment(ATE) in the whole population of two dataset: high dimensional data and low dimensional data in order to draw causal inference. Besides these paired combinations, we also used Synthetic Minority Over-sampling Technique (SMOTE) on low dimensional data to create synthetic samples and used these generated samples to estimate the propensity scores. From the ATE estimation result table, Logistic Regression with Full Matching using propensity score distance measurement performs the best on both datasets. Regression tree with Full Matching using propensity score distance measurement is not well performed on low dimensional data, while the estimated ATE is very close to true ATE value after oversampling by SMOTE. L1 penalized logistic regression has the shortest running time for propensity score estimation and weighted regression performs much better than Full Matching regarding ATE estimation running time. 
	
**Contribution statement**: All team members approve our work presented in this GitHub repository including this contributions statement. 
+ Yunuo Ma (Presenter): 
+ Mengyao He: 
+ Xinyuan Peng: Organized meetings and contributed to estimating Propensity scores by Logistic Regression and estimating ATE by Weighted Regression on lowDim, highDim and balanced lowDim data. Major contributor to the final report.
+ Xiaoli Sun: Contributed to estimating ATE by Weighted Regression, helped with creating PPT and editing speaker notes.
+ Ziyu Kong:


Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
