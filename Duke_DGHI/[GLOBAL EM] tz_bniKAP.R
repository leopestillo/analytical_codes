######################################################################
#BASIC R STATISTICS TEMPLATE
######################################################################
#
#
#
#
#
######################################################################
#SETTING ENVIRONMENT
######################################################################
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
lapply(c("sem","ggplot2", "psych", "irr", "nortest", "moments",
	"GPArotation","nFactors","boot","psy", "car","vcd", "gridExtra",
	"mi","VIM","epicalc","gdata","sqldf","reshape2","mclust","foreign",
	"survival","memisc","lme4","lmerTest","dplyr","qgraph",
	"grid","lattice","latticeExtra","HH"),library, 
character.only=T)

######################################################################
#IMPORTING DATA
######################################################################
#LOADING DATA FROM A .CSV FILE
data<-read.csv("/Users/joaovissoci/OneDrive - Duke University/datasets/Global EM/Africa/BNI/Tz_bniKAP_data.csv",sep=",")
#information between " " are the path to the directory in your computer where the data is stored

######################################################################
#DATA MANAGEMENT
######################################################################
#Creating a data frame (group of variables)
#numeric<-with(data, data.frame(Peso,Altura,IMC,
#                          Idade))
#
##Change variables properties
##Change variable to factor
#data$Classificacao<-as.factor(data$Classificacao)
#
##Change variable to character
#data$Classificacao<-as.character(data$Classificacao)
#
##Change variable to numeric
#data$Classificacao<-as.numeric(data$Classificacao)
#
##Recoding variables
#data$Classificacao<-car::recode(data$Classificacao,"#1='baixo';2='medio';
#	3='alto'")

# data <- base::merge(data1,data2,by=c("nome"))


######################################################################
#BASIC DESCRIPTIVES and EXPLORATORY ANALYSIS
######################################################################
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

######################################################
#TABLE 1.
######################################################
# Gender
table<-with(data,table(female))
table
prop.table(table)
#table<-with(data_bea,table(hospitalization,risk_classification))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# Age
describe(data$age)
ad.test(data$age)
#hist(data$age)
#ci_func(data$age,.95)
# by(data$age,outcomes$rtc_involvement,describe)
# wilcox.test(data$age~outcomes$rtc_involvement)

# Occupation
table<-with(data,table(occupation))
table
prop.table(table)
#table<-with(data_bea,table(hospitalization,risk_classification))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# specialty
table<-with(data,table(specialty))
table
prop.table(table)
#table<-with(data_bea,table(hospitalization,risk_classification))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# location_grew_up
table<-with(data,table(location_grew_up))
table
prop.table(table)
#table<-with(data_bea,table(hospitalization,risk_classification))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# location_grew_up
table<-with(data,table(tanzanian))
table
prop.table(table)
#table<-with(data_bea,table(hospitalization,risk_classification))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# religious
table<-with(data,table(religious))
table
prop.table(table)
#table<-with(data_bea,table(hospitalization,risk_classification))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# religion
table<-with(data,table(religion))
table
prop.table(table)
#table<-with(data_bea,table(hospitalization,risk_classification))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# consume_alcohol
table<-with(data,table(consume_alcohol))
table
prop.table(table)
#table<-with(data_bea,table(hospitalization,risk_classification))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

# worked_casualty
table<-with(data,table(worked_casualty))
table
prop.table(table)
#table<-with(data_bea,table(hospitalization,risk_classification))
#table
#prop.table(table,2)
#chisq.test(table)
#fisher.test(table)
#assocstats(table) #vcd package

######################################################################
#Figure 1.
######################################################################

# A
likert_data1<-with(data,data.frame(
	discuss_risky_alc,
	discuss_counsel_pts,
	called_harmful_drinkers,
	not_my_role,
	talking_can_be_successful))

table(likert_data1$discuss_risky_alc)
table(likert_data1$discuss_counsel_pts)
table(likert_data1$called_harmful_drinkers)
table(likert_data1$not_my_role)
table(likert_data1$talking_can_be_successful)

likert1<-c(0,1,1,16,0)
likert2<-c(1,2,3,12,1)
likert3<-c(0,0,5,2,0)
likert4<-c(12,18,13,2,13)
likert5<-c(21,12,12,2,19)

likert<-data.frame(likert1,likert2,likert3,likert4,likert5)
likert$var<-c("q1","q2","q3","q4","q5")
rownames(likert)<-c("In my schooling, we discussed at­risk\n alcohol behavior and alcohol abuse.",
					"In my schooling, we discussed counseling\n patients with at­risk drinking behaviors.",
					"Once patients suffer an injury from\n drinking they are called 'harmful drinkers",
					"It is not my role to ask\n about alcohol use",
					"Talking to patients about decreasing\n their alcohol ingestion can be successful.")

colnames(likert)<-c("Strongly Disagree",
					"Disagree",
					"I don't know",
					"Agree",
					"Strongly Agree")

likert(likert,
auto.key=list(between=1, between.columns=2),
xlab="Percentage",
# main="Knowledge about alcohol use in ED patients",
BrewerPaletteName="Blues")
# sub="Likert Scale")

#B

data$risky_drinks_sitting_men_NEW<-car::recode(
	data$risky_drinks_sitting_men,"
	0:3='Wrong';4='Right';5='Wrong'")
data$risky_drinks_sitting_women_NEW<-car::recode(
	data$risky_drinks_sitting_women,"
	0:2='Wrong';3='Right';4:5='Wrong'")
data$risky_drinks_week_men_NEW<-car::recode(
	data$risky_drinks_week_men,"
	1='Wrong';2='Right';3:5='Wrong'")
data$risky_drinks_week_women_NEW<-car::recode(
	data$risky_drinks_week_women,"
	1='Right';2:5='Wrong'")

table(data$risky_drinks_sitting_men_NEW)
table(data$risky_drinks_sitting_women_NEW)
table(data$risky_drinks_week_men_NEW)
table(data$risky_drinks_week_women_NEW)

likert1<-c(8,18,5,9)
likert2<-c(26,16,29,24)

likert<-data.frame(likert1,likert2)
rownames(likert)<-c("How many drinks per sitting is\n at­risk drinking for men?",
					"How many drinks per sitting is\n at­risk drinking for women?",
					"How many drinks per week is\n at­risk drinking for men?",
					"How many drinks per week is\n at­risk drinking for women?")

colnames(likert)<-c("Right","Wrong")

# likert(likert,
# auto.key=list(between=1, between.columns=2),
# xlab="Percentage",
# # main="Knowledge about alcohol use in ED patients",
# BrewerPaletteName="Blues")
# # sub="Likert Scale")

HH::likert(likert, main="",
			as.percent=TRUE, rightAxisLabels=NULL, 
			# ylab.right="Perceptions",
            positive.order=TRUE)

######################################################################
#Figure 2.
######################################################################

figure2_data<-with(data,data.frame(
						 pts_drink,
						 alcohol_not_problem_kcmc,
						 likely_drunk_while_injured,
						 intox_pts_frustrating,
						 few_alc_related_injuries,
						 knowledge_not_improve_care,
						 comfortable_asking_alcohol,
						 comfortable_counseling,
						 motivated_alc_screening,
						 learn_reducing_alc,
						 willing_alc_screening))

x2<-na.omit(melt(figure2_data))

count_data<-count(x2, c("variable", "value"))

write.csv(count_data,"/Users/joaovissoci/blah.csv")

dat<-read.csv("/Users/joaovissoci/blah.csv")
colnames(dat)<-c("var","likert","value")
dat2<-cast(dat,var~likert)
colnames(dat2)<-c("var","likert1","likert2","likert3",
	"likert4","likert5")
# dat3<-rbind(dat2,likert)
# rownames(dat3)<-dat3$var
# dat3$gr<-as.factor(c(rep("test1",11),rep("test2",5)))
rownames(dat2)<-c("A large number of patients drink alcohol.",
				"Alcohol use and abuse is not a problem \n amongs our patient population at KCMC.",
				"Injury pateints at KCMC were likely drinking\n when they were injured.",
			  	"Caring for patients who are intoxicated is\n frustrating as they caused themselves\n to be ill/injured.",
			  	"Few injury patients at KCMC suffer from\n alcohol related injuries.",
			  	"Knowing if patients have atrisk drinking\n does NOT improve care I can provide.",
			  	"I feel comfortable asking patients about\n their alcohol use behavior.",
			  	"I feel comfortable counseling patients about\n their atrisk drinking.",
			  	"How motivated are you and your colleagues at\n implementing alcohol screening\n and testing?",
			  	"How willing are you and your colleagues to\n learn about reducing harmful alcohol\n use among injury patients?",
			  	"How willing are you and your colleagues to\n implement alcohol screening among\n injury patients?")

colnames(dat2)<-c("var","Strongly Disagree",
					"Disagree",
					"I don't know",
					"Agree",
					"Strongly Agree")

HH::likert(dat2, main="",
			as.percent=TRUE, rightAxisLabels=NULL, 
			# ylab.right="Perceptions",
            positive.order=TRUE)


# likert(dat2,
# auto.key=list(between=1, between.columns=2),
# xlab="Percentage",
# # main="Knowledge about alcohol use in ED patients",
# BrewerPaletteName="Blues")
# # sub="Likert Scale")

# # if(!require(devtools)) install.packages("devtools")
# # devtools::install_github('jbryer/likert')

# # # additional requirements
# # library(ggplot2)
# # library(reshape2)
# # library(RColorBrewer)
# library(likert)

# # create summary table
# table_summary = likert::likert(na.omit(figure2_data))

# # reshape results
# results = melt(table_summary$results, id.vars='Item')

# # reorder results
# # results$Item = factor(results$Item, levels=c("LT", "ST", "SemTag", "SemTagContext"))

# # some defaults
# ymin = 0
# text.size = 3

# ggplot(dat, aes(y=value, x=var, group=likert)) + 
#   geom_bar(stat='identity', aes(fill=var)) + 
#   ylim(c(-5,105)) + 
#   coord_flip() +
#   scale_fill_manual('Response', values=brewer.pal(11, "RdYlGn"), 
#               breaks=levels(dat$var), 
#               labels=levels(dat$var)) +
#   geom_text(data=table_summary$summary, y=ymin, aes(x=Item, 
#               label=paste(round(low), '%', sep='')), 
#               size=text.size, hjust=1) +
#   geom_text(data=table_summary$summary, y=100, aes(x=Item,
#               label=paste(round(high), '%', sep='')), 
#               size=text.size, hjust=-.2) +
#   ylab('Percentage') + xlab('')

######################################################################
#Figure 3.
######################################################################

data$alc_treatment_failure<-car::recode(data$alc_treatment_failure,
	"1=5;2=4;3=3;4=2;5=1")
data$non_alcoholic_hired<-car::recode(data$non_alcoholic_hired,
	"1=5;2=4;3=3;4=2;5=1")
data$think_less_treated_person<-car::recode(data$think_less_treated_person,
	"1=5;2=4;3=3;4=2;5=1")
data$not_date_hospital_for_alc<-car::recode(data$not_date_hospital_for_alc,
	"1=5;2=4;3=3;4=2;5=1")
data$less_opinion_trtd_person<-car::recode(data$less_opinion_trtd_person,
	"1=5;2=4;3=3;4=2;5=1")

figure3_data_PDis<-with(data,data.frame(alcoholic_close_friend,
							recovered_alcoholic_teacher,
							recover_alcoholic_chldrn,
							recover_alcoholic_hired,
							non_alcoholic_hired,
							recovered_alc_treat_same,
							not_date_hospital_for_alc))

discrimination<-rowSums(figure3_data_PDis)

figure3_data_PDev<-with(data,data.frame(alc_treatment_intelligent,
							alcoholic_trustworthy,
							alc_treatment_failure,
							think_less_treated_person,
							less_opinion_trtd_person))

devaluation<-rowSums(figure3_data_PDev,figure3_data_PDev)

figure3_data<-data.frame(figure3_data_PDis,figure3_data_PDev)

graph<-melt(figure3_data)
count_data_fig3<-plyr::count(graph, c("variable", "value"))
count_data_fig3<-na.omit(count_data_fig3)
count_data_fig3$value<-car::recode(count_data_fig3$value,"
	1='Strongly disagree';
	2='Disagree';
	3='Somewhat disagree';
	4='Somewhat disagree';
	5='Agree';
	6='Strongly Agree'")

ggplot(count_data_fig3, aes(value,variable)) +
	geom_point(size=count_data_fig3$freq,
		fill=count_data_fig3$freq) + 
	# scale_colour_gradient(low = "blue") +
  # facet_grid(set~ . ~ class, scales="free_x", space="free") + 
xlab("") + ylab ("Questions") + theme_bw() + 
theme(
axis.text.x  = element_text(angle=45, hjust=1)) #legend.position = "none",

######################################################################
#Figure 4.
######################################################################

figure4_data<-with(data,data.frame(
						 common_ask_pts_drink,
						 common_test_pts_alc,
						 common_ask_pts_tobacco,
						 resources_refer_pts,
						 ask_pts_alc,
						 test_alc_breath_or_serum
						 ))

x2<-na.omit(melt(figure4_data))

count_data<-plyr::count(x2, c("variable", "value"))

write.csv(count_data,"/Users/joaovissoci/blah2.csv")

dat<-read.csv("/Users/joaovissoci/blah2.csv")
colnames(dat)<-c("var","likert","value")
dat2<-cast(dat,var~likert)
colnames(dat2)<-c("var","likert1","likert2","likert3",
	"likert4","likert5")
# dat3<-rbind(dat2,likert)
# rownames(dat3)<-dat3$var
# dat3$gr<-as.factor(c(rep("test1",11),rep("test2",5)))
rownames(dat2)<-c(
"It is common to ask patients about their\n drinking behavior.",
"It is common to test patients for alcohol.",
"It is comon to ask patients about their\n tobacco use behavior.",
"There are resources to refer patients to\n when I determine they have high risk drinking.",
"I ask my patients about their alcohol use",
"I counsel patients to reduce their drinking\n if I think they have harmful drinking behavior.")




colnames(dat2)<-c("var","Strongly Disagree",
					"Disagree",
					"I don't know",
					"Agree",
					"Strongly Agree")

HH::likert(dat2, main="",
			as.percent=TRUE, rightAxisLabels=NULL, 
			# ylab.right="Perceptions",
            positive.order=TRUE)

######################################################################
#Figure 5.
######################################################################
network_data<-data.frame(likert_data1,
	figure2_data,figure4_data,discrimination,devaluation)

cor<-cor(na.omit(network_data),method="spearman")
# cor<-cor_auto(na.omit(network_data))

#listing grouping variables in the network resulting from the 
#community analysis
node_groups<-list(knowledge=c(1:5),
	perception=c(6:16),practice=c(17:22),stigma=c(23:24))

# creating vectors for labels
node_labels<-c(
"In my schooling, we discussed at­-risk alcohol\n behavior and alcohol abuse.",
"In my schooling, we discussed counseling\n patients with a-t­risk drinking behaviors.",
"Once patients suffer an injury from\n drinking they are called 'harmful drinkers",
"It is not my role to ask\n about alcohol use.",
"Talking to patients about decreasing\n their alcohol ingestion can be successful.",
"A large number of patients drink alcohol.",
"Alcohol use and abuse is not a problem \n amongs our patient population at KCMC.",
"Injury pateints at KCMC were likely drinking\n when they were injured.",
"Caring for patients who are intoxicated is\n frustrating as they caused themselves\n to be ill/injured.",
"Few injury patients at KCMC suffer from\n alcohol related injuries.",
"Knowing if patients have atrisk drinking\n does NOT improve care I can provide.",
"I feel comfortable asking patients about\n their alcohol use behavior.",
"I feel comfortable counseling patients about\n their atrisk drinking.",
"How motivated are you and your colleagues at\n implementing alcohol screening\n and testing?",
"How willing are you and your colleagues to\n learn about reducing harmful alcohol\n use among injury patients?",
"How willing are you and your colleagues to\n implement alcohol screening among\n injury patients?",
"It is common to ask patients about their drinking behavior.",
"It is common to test patients for alcohol.",
"It is comon to ask patients about their\n tobacco use behavior.",
"There are resources to refer patients\n to when I determine they have high risk drinking.",
"I ask my patients about their alcohol use",
"I counsel patients to reduce their drinking\n if I think they have harmful drinking behavior.",
"Personal Discrimination",
"Personal Devaluation")

# creating nodes labels vector
node_names<-c("Know1","Know2","Know3","Know4","Know5",
	"Percept1","Percept2","Percept3","Percept4","Percept5",
	"Percept6","Percept7","Percept8","Percept9","Percept10",
	"Percept11","Pract1","Pract2","Pract3","Pract4","Pract5",
	"Pract6","PDisc","PDeval")

# findGraph(cor, 34, type = "cor")

network<-qgraph(cor,
	layout="spring",
	# vsize=importance_vSize*3,
	esize=20,
	# graph="pcor",
	sampleSize=nrow(network_data),
	cut = 0.6,
	maximum = 1, 
	minimum = 0.3,
	repulsion = 0.8,
	groups=node_groups,
	nodeNames=node_labels,
	color=c("gold","steelblue","red","grey80",layoutScale=c(2,2)),
	borders = FALSE,
	labels=node_names,
	legend.cex=0.35,
	legend.mode="names")#,gray=T,)#,nodeNames=nomesqsg

#Identify SPLs within the graph and extract direct paths to WP
predictors<-centrality(network)$ShortestPaths[,23]
predictors

predictors<-centrality(network)$ShortestPaths[,24]
predictors


######################################################################
#END
######################################################################