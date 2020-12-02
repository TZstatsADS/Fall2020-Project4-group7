library(survival)
library(optmatch)
library(MatchIt)
library(glmnet)
library(ATE)
library(tidyverse)
library(dplyr)

full_matching_ate <- function(dat,propensity_score){
  match_full_low<-matchit(A~.-Y,data=dat,method="full",
                          distance = propensity_score)
  data.fullMatching <- match.data(match_full_low)
  data.fullMatching$Y <- dat$Y
  a = data.fullMatching %>% group_by(subclass,A) %>% summarise(mean_y = mean(Y))
  group_ate = a %>% group_by(subclass) %>% summarise(treat_eff = mean_y[A == 1] - mean_y[A == 0])
  group_n = data.fullMatching %>% group_by(subclass) %>% count()
  ate = sum(group_ate$treat_eff*group_n$n/nrow(dat))
  return(ate)
}
