#####################################################################################
#BASIC R STATISTICS TEMPLATE
#####################################################################################
#
#
#
#
#
#############################################################################
#SETTING ENVIRONMENT
#############################################################################
#PASCKAGES INSTALLATION CODES
#install.packages("Hmisc")
#install.packages("car")
#install.packages("psych")
#install.packages("nortest")
#install.packages("ggplot2")
#install.packages("pastecs")
#install.packages("repmis")
#install.packages("mvnormtest")
#install.packages("polycor")

#PACKAGES LOADING CODE
#Load packages neededz for the analysis
#library(Hmisc)

#All packages must be installes with install.packages() function
lapply(c("Hmisc","car","psych","nortest","ggplot2","pastecs","repmis",
	"mvnormtest","polycor","nortest"), 
library, character.only=T)
#############################################################################
#IMPORTING DATA
#############################################################################
#LOADING DATA FROM A .CSV FILE
#data<-read.csv("/Users/rpietro/Desktop/MDD_BIPD_Baseline.csv",sep=",")
#information between " " are the path to the directory in your computer where the data is stored

#Import data from Dropbox, in .csv format
#Instructions here http://goo.gl/Ofa7gQ
#data1 <- repmis::source_DropboxData("pem_parasito.csv",
#                                  "tkxmkg9pybmtsgh",
#                                  sep = ",",
#                                  header = TRUE)

data <- read.csv("/home/joao/Dropbox/datasets/DGHI/Africa_DGHI/Tz/tz_baseline_mental_health.csv", header = TRUE)


#############################################################################
#DATA MANAGEMENT
#############################################################################

data$married<-car::recode(data$married,"0=1;1=1;4=1;2=0;3=0;5=0")
data$occupation<-car::recode(data$occupation,"89='Other'")
data$education<-car::recode(data$education,"1:7='Primary';8:13='Form';14:16='University';")

sf8<-with(data,data.frame(sf8_b1,sf8_b2,sf8_b3,sf8_b4,sf8_b5,sf8_b6,sf8_b7,sf8_b8))
phq9<-with(data,data.frame(phq9_b11,phq9_b12,phq9_b13,phq9_b14,phq9_b15,phq9_b16,phq9_b17,phq9_b17,phq9_b18,phq9_b19))
phq9score<-rowSums(phq9)
audit<-with(data,data.frame(h1,h2,h3,h4,h5,h6,h7,h8,h9,h10))
auditscore<-rowSums(audit)

phq9_cat<-car::recode(phq9score,"0:4.9='no';5:19='yes'")
ces_score_cat<-car::recode(data$ces_score,"6:15.9='no';16:26='yes'")
kes_score_cat<-car::recode(data$kes_score,"0:19.9='no';20:28='yes'")
auditscore_cat<-car::recode(auditscore,"0:7.9='no';8:26='yes'")
#############################################################################
#BASIC DESCRIPTIVES and EXPLORATORY ANALYSIS
#############################################################################
###Section wih several exploratory data analysis functions
#Exploratory Data Anlysis
#dim(data)
#str (data)
#head(data)
#names(data)
#summary(data)#This comand will provide a whole set of descriptive #results for each variables
describe(data)
with(data,by(data,outcome,describe))
with(data,by(data,outcome,summary))
#stat.desc(data)
with(data,by(data,outcome,ad.test)) # Anderson-Darling test for normality
#skewness(data$Idade) #Will provide skweness analysis
#kurtosis(data$Idade) - 3 #Will provide kurtosis analysis
#qplot(data$Idade) # histogram plot
#boxplot(data$Idade~data$Classificacao) #will provide a boxplot for the #variables to analysis potential outliers
## Bartlett Test of Homogeneity of Variances
#bartlett.test(data$Idade~data$Classificacao, data=data)
## Figner-Killeen Test of Homogeneity of Variances
#fligner.test(data$Idade~data$Classificacao, data=data)
#leveneTest(data$Idade~data$Classificacao, data=data)
#############################################################################
#DESCRIPTIVES
#############################################################################
# Gender 0=male 1=female
table<-with(data,table(female))
table
prop.table(table)
#table<-with(data,table(female,))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# Marital 0=not_married 1=married
table<-with(data,table(married))
table
prop.table(table)
#table<-with(data,table(female,))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# Ocupation
table<-with(data,table(occupation))
table
prop.table(table)
#table<-with(data,table(female,))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# Education
table<-with(data,table(education))
table
prop.table(table)
#table<-with(data,table(female,))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# Home people residing in the house
summary(data$age)
ad.test(data$age)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,summary)
#wilcox.test(data$home_people~data$risk_classification)

# Home people residing in the house
summary(data$home_people)
ad.test(data$home_people)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,describe)
#wilcox.test(data$home_people~data$risk_classification)

# Minors residing in the house
summary(data$minors_home)
ad.test(data$minors_home)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,describe)
#wilcox.test(data$home_people~data$risk_classification)

# Minors supporting financially in the house
summary(data$minors_finan)
ad.test(data$minors_finan)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,describe)
#wilcox.test(data$home_people~data$risk_classification)

# Adult supporting financially
summary(data$adult_finan)
ad.test(data$adult_finan)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,describe)
#wilcox.test(data$home_people~data$risk_classification)

# Personal income
summary(data$personal_income)
ad.test(data$personal_income)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,describe)
#wilcox.test(data$home_people~data$risk_classification)

# Family income
summary(data$fam_income)
ad.test(data$fam_income)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,describe)
#wilcox.test(data$home_people~data$risk_classification)

######## MENTAL HEALTH SCALES

#SF8

# PHQ9
summary(phq9score)
ad.test(phq9score)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,describe)
#wilcox.test(data$home_people~data$risk_classification)
table<-with(data,table(phq9_cat))
table
prop.table(table)

# KESSLER
summary(data$kes_score)
ad.test(data$kes_score)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,describe)
#wilcox.test(data$home_people~data$risk_classification)
table<-with(data,table(kes_score_cat))
table
prop.table(table)

# CES
summary(data$ces_score)
ad.test(data$ces_score)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,describe)
#wilcox.test(data$home_people~data$risk_classification)
table<-with(data,table(ces_score_cat))
table
prop.table(table)

# AUDIT
summary(auditscore)
ad.test(auditscore)
#hist(data$home_people)
#ci_func(data$home_people,.95)
#by(data$home_people,data$risk_classification,describe)
#wilcox.test(data$home_people~data$risk_classification)
table<-with(data,table(auditscore_cat))
table
prop.table(table)

#############################################################################
#ANALYSIS OF VARIANCE
#############################################################################
# One Way Anova (Completely Randomized Design)
fit <- aov(Idade ~ Classificacao, data=data)
summary(fit)

# Randomized Block Design (B is the blocking factor) 
fit <- aov(Idade ~ Classificacao+Sexo, data=data)
summary(fit)

# Two Way Factorial Design 
fit <- aov(Idade ~ Classificacao*Sexo, data=data)
summary(fit)

# Tukey Honestly Significant Differences
TukeyHSD(fit) # where fit comes from aov()

# Analysis of Covariance 
fit <- aov(Idade ~ Classificacao + IMC, data=data)
summary(fit)

# Kruskal Wallis Test One Way Anova by Ranks 
kruskal.test(Idade ~ Classificacao, data=data) # where y1 is numeric and A is a factor

#####################################################################################
#CORRELATIONS
#####################################################################################
#Pearson
cor(numeric, use="complete.obs", method="pearson") 
#Spearman
cor(numeric, use="complete.obs", method="spearman") 
#Kendall
cor(numeric, use="complete.obs", method="kendall")

#Significance testing
rcorr(as.matrix(numeric), type="pearson") # type can be pearson or spearman

cor.test(numeric$Peso,numeric$Altura) #Used for a single test of significance

# heterogeneous correlations in one matrix 
# pearson (numeric-numeric), 
# polyserial (numeric-ordinal), 
# and polychoric (ordinal-ordinal)
# x is a data frame with ordered factors 
# and numeric variables
hetcor(data) 

# polychoric correlation
# x is a contingency table of counts
polychor(data) 

#####################################################################################
#LOGISTIC REGRESSION
#####################################################################################
baselineXFUP3<-glm(ATTEMPT_P ~ Anxiety_presence + AGE + SEX + MARSTAT +
                            ATTEMPT_baseline + Diagnostic
                            ,family=binomial, data=FUP3)
summary(baselineXFUP3)
#anova(reglogGEU)
#exp(coef(model1_death)) # exponentiated coefficients
#exp(confint(model1_death)) # 95% CI for exponentiated coefficients
#predict(model1_death, type="response") # predicted values
#residuals(model1_death, type="deviance") # residuals
#logistic.display(baselineXFUP3)