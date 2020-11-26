library(readr)
library(survival)
library(optmatch)
library(MatchIt)
library(glmnet)
library(ATE)
library(tidyverse)
library(dplyr)

lowDim <- read_csv("Downloads/project4/lowDim_dataset.csv")
glm_low <- glm(A~.-Y, family=binomial, data=lowDim)
summary(glm_low)
glm_low.probs <- predict(glm_low,type = "response")
match_full_low<-matchit(A~.-Y,data=lowDim,method="full",
                        distance = glm_low.probs)
data.fullMatching <- match.data(match_full_low)
data.fullMatching$Y <- lowDim$Y
#full_summary = summary(match_full_low)
#sum_all = full_summary$sum.all
#mean(sum_all[-1,1]-sum_all[-1,2])
View(data.fullMatching)
a = data.fullMatching %>% group_by(subclass,A) %>% summarise(mean_y = mean(Y))
group_ate = a %>% group_by(subclass) %>% summarise(treat_eff = mean_y[A == 1] - mean_y[A == 0])
group_n = data.fullMatching %>% group_by(subclass) %>% count()
sum(group_ate$treat_eff*group_n$n/nrow(lowDim))

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
full_matching_ate(lowDim,glm_low.probs)

#------------------------------------------------------------------
highDim <- read_csv("Downloads/project4/highDim_dataset.csv")
highDim_selected <- subset(highDim,select = -Y)
glm_high <- glm(A~., family=binomial, data=highDim_selected)
summary(glm_high)
glm_high.probs <- predict(glm_high,type = "response")

full_matching_ate(highDim,glm_high.probs)



