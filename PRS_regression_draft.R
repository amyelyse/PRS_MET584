library(tidyverse)
setwd("~/path/to/scores/")
PGS <- read_csv("PGS_S1.csv") %>% # Remember to change the name depending the subset (full/blood/brain) and which p-value threshold was used (S1 = < 0.05; S2 = < 1.00)
  as_tibble()
sum(is.na(PGS))
PGS <- na.omit(PGS)
summary(PGS)

## IMPORTANT THINGS TO CHANGE:
# write.table(O,file="profile_out_S1.csv",row.names=F,col.names=F,quote=F,append=T,sep=",") MUST correspond with what was read in for PGS
# This occurs both when the spreadsheet is CREATED and when the spreadsheet is EXPORTED
# If in doubt, CTRL+F "profile_out" and check whether everything matches
# Otherwise, you may overwrite files with the incorrect regression output 

######### FUNCTIONS NEEDED  ############
# Copy and paste these in
# proportion variability liability scale
h2l_R2 <- function(k, r2, p) {
  # k baseline disease risk
  # r2 from a linear regression model of genomic profile risk score
  # p proportion of sample that are cases
  # calculates proportion of variance explained on the liability scale
  x = qnorm(1-k)
  z = dnorm(x)
  i = z/k
  C = k*(1-k)*k*(1-k)/(z^2*p*(1-p))
  theta = i*((p-k)/(1-k))*(i*((p-k)/(1-k))-x)
  h2l_R2 = C*r2 / (1 + C*theta*r2)
} 


# se of the variance explained on the liability scale from the 
# variance explained on the linear scale (r2) and it se (se)
se_h2l_R2 <- function(k,r2,se, p) {
  # k baseline disease risk
  # r2 from a linear regression model attributable to genomic profile risk score
  # se 
  # p proportion of sample that are cases
  # SE on the liability (From a Taylor series expansion)
  # var(h2l_r2) = [d(h2l_r2)/d(R2v)]^2*var(R2v) with d being calculus differentiation
  x = qnorm(1-k)
  z = dnorm(x)
  i = z/k
  C = k*(1-k)*k*(1-k)/(z^2*p*(1-p))
  theta = i*((p-k)/(1-k))*(i*((p-k)/(1-k))-x)
  se_h2l_R2 = C*(1-r2*theta)*se
}
################################################
# Create vector listing the standardized polygenic profile scores
# This is searching for column names with the string "zSCORE" in it
# look at scores and you'll see a list of all the column names (should be 3 in this instance as we're only using one MAF and P-value threshold)
str(PGS)
scores <- grep("ZSCORE", colnames(PGS), value = TRUE)

# Create a list of column names, and write it out to a spreadsheet
O=data.frame("Subset","Sample N","Prop. cases","Nagelkerke's R2","R2 P-val","Pop. disease risk (K)","Liability R2","Liability SE","AUROC","decile","OR","CI_L","CI_U")
write.table(O,file="profile_out_S1.csv",row.names=F,col.names=F,quote=F,append=T,sep=",")


# Calculate the various parameters of the regression models and write the output to the spreadsheet for each score
for (i in (1:length(scores))){
  # create output files
  sink(paste0(scores[i],".txt"))
  
  data<-paste0(scores[i])
  
  # run logistic regression models which fit all significant ancestry components, with (PGS.full) and without (PGS.null) polygenic profile score
  runGLM<-paste0("PGS.full<-glm(SCZ~1+PC1+PC2+PC3+PC4+PC5+PC6+PC7+PC8+PC9+PC11+PC12+PC13+PC19+",scores[i],",family=binomial,data=PGS)")
  eval(parse(text=runGLM))
  
  runGLMnull<-paste0("PGS.null<-glm(SCZ~1+PC1+PC2+PC3+PC4+PC5+PC6+PC7+PC8+PC9+PC11+PC12+PC13+PC19,family=binomial,data=PGS)")
  eval(parse(text=runGLMnull))
  
  # print fixed effect formula from full model
  writeLines("\nFixed effect formula =")
  print(PGS.full$formula)
  
  # print whether full and null models converged (to check a large number of files, simply do: grep FALSE *.txt , in relevant directory)
  writeLines("\nFull model converged =")
  print(PGS.full$converged)
  
  writeLines("\nNull model converged =")
  print(PGS.null$converged)
  
  # view summary statistics for the full model
  writeLines("\nSummary of coefficients for fixed effects")
  print(summary(PGS.full)$coefficients)
  
  # Odds ratio for being a case compared to control in each decile of PGS 
  # make ntiles using cut command - compare top decile to bottom decile
  nt=10
  runNTIL<-paste0("PGS$ntil = cut(PGS$",scores[i],", breaks=c(quantile(PGS$",scores[i],", probs = seq(0, 1, by = 1/nt))), labels=1:nt, include.lowest=T)")
  eval(parse(text=runNTIL))
  
  tstd1 <- glm(SCZ ~ ntil, data = PGS, family = binomial(logit))
  
  ORD <- exp(tstd1$coefficients)
  ORDL <- exp(tstd1$coefficients-1.96*summary(tstd1)$coefficients[,2])
  ORDH <- exp(tstd1$coefficients+1.96*summary(tstd1)$coefficients[,2])
  
  writeLines("\n")
  print(paste0("OR (CI) = ", round(ORD[10], digits = 2)," (",round(ORDL[10], digits = 2),",",round(ORDH[10], digits = 2),")"))
  
  
  # Cox&Snell R2 
  # NOTE: To calculate pseudo R2 we need likelihood or logLikelihood of the model
  #	 	However, glm output give us -2*logLikelihood as the fit statistic
  #		We therefore need to recompute it, logLike() function does just that!
  
  N <-  length(PGS$SCZ)
  
  LL1 <-  logLik(PGS.null)
  LL2 <-  logLik(PGS.full)
  
  # NOTE: because we are using logLikelihoods we take exponent
  CSv2 <-  1-exp((2/N)*(LL1[1]-LL2[1]))
  
  writeLines("\n")
  print(paste0("Cox&Snell R2 (%) = ",round((CSv2*100), digits=2),"%"))
  
  # NOTE: Cox&Snell R2 can never reach 1 but it can do so if adjusted by its maximum possible value 
  
  # Nagelkerke's R2
  NK2 <- CSv2/(1-exp((2/N)*LL1[1])) # This shows Nagelkerke's R2 attributable to SCORE over PCS
  
  writeLines("\n")
  print(paste0("Nagelkerke's R2 (%) = ",round((NK2*100), digits=2),"%"))
  
  
  # pvalue
  # NOTE: null -2*logLikelihood is also reported in the alternative model
  devdiff <- PGS.null$deviance-PGS.full$deviance
  
  df <- PGS.null$df.residual-PGS.full$df.residual
  
  pval <- pchisq(devdiff,df,lower.tail=F)
  
  writeLines("\n")
  if (pval!=0) {
    print(paste0("P-value = ",pval)) 
  } else {
    print(paste0("P-value = <1.00E-300")) 
  }
  
  if (pval==0) {
    pval<-"<1.00E-300"
  }
  # linear model R2 
  std_y <- PGS$SCZ
  PGS$std_y <- (PGS$SCZ-mean(PGS$SCZ))/sd(PGS$SCZ)
  
  # run linear regression models which fit all significant ancestry components, with (PGS.full) and without (PGS.null) polygenic profile score
  
  runLM<-paste0("PGS.full.lm<-lm(SCZ~1+PC1+PC2+PC3+PC4+PC5+PC6+PC7+PC8+PC9+PC11+PC12+PC13+PC19+",scores[i],",data=PGS)")
  eval(parse(text=runLM))
  
  runLMnull<-paste0("PGS.null.lm<-lm(SCZ~1+PC1+PC2+PC3+PC4+PC5+PC6+PC7+PC8+PC9+PC11+PC12+PC13+PC19,data=PGS)")
  eval(parse(text=runLMnull))
  
  R2_2 <- 1-exp((2/N)*(logLik(PGS.null.lm)[1]-logLik(PGS.full.lm)[1]))
  
  
  # standard error of R2v
  # from Olkin and Finn (Psychological Bulletin, 1995, Vol. 118, No. 1, 155-164)
  np <- 1
  
  # vr is se^2 of R2v
  vr_2 <- 4/length(std_y)*R2_2*(1-R2_2)^2*(1-(2*np+3)/length(std_y))
  
  # calculate liability R2 (requires disease prevalence, k, and proportion of cases, p)
  # assign baseline disease risk (k) of 0.01
  k = 0.01
  K=k
  # assign proportion of cases (p) in sample
  
  p = sum(PGS$SCZ)/length(PGS$SCZ)
  P=p
  
  h2l_r2_2 <- h2l_R2(K,R2_2,P)
  
  # SE on the liability (From a Taylor series expansion)
  se_h2l_r2_2 <- se_h2l_R2(K,h2l_r2_2,vr_2^.5,P)
  
  writeLines("\n")
  print(paste0("Liability R2 (%) (SE) = ",round((h2l_r2_2*100),digits=2),"% (",round(se_h2l_r2_2,digits=3),")")) 
  
  
  
  # normal distribution parameters
  # T0 = threshold  
  T0 = qnorm(1-K)
  
  # z = height of normal distribution at threshold  
  z = dnorm(T0) 
  
  # i = mean phenotypic liability of cases
  i = z/K  
  
  # v = mean liability of controls							
  v = -i*K/(1-K)      
  
  #variance in cases and controls
  # variance in cases
  vcase_2=h2l_r2_2*(1-h2l_r2_2*i*(i-T0)) 
  
  # variance in controls
  vcont_2=h2l_r2_2*(1-h2l_r2_2*v*(v-T0))  
  
  # calculate AUC attributable to PGS
  auc_2=pnorm((i-v)*h2l_r2_2/(sqrt(vcase_2+vcont_2)))
  
  writeLines("\n")
  print(paste0("AUC attributable to PGS = ",round(auc_2,digits=2)))
  
  # write to spreadsheet
  O=data.frame(data,N,P,NK2,pval,K,h2l_r2_2,se_h2l_r2_2,auc_2,10,ORD[10],ORDL[10],ORDH[10])
  write.table(O,file="profile_out_S1.csv",row.names=F,col.names=F,quote=F,append=T,sep=",")
  
  ##Close output file
  sink()
}
