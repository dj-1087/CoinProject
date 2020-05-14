owa.df <- read.csv("./분산분석/분산분석/일원배치 분산 분석/일원분산분석.csv", header = T, na.strings = "."); str(owa.df)
library(psych) 
describeBy(owa.df$점수, owa.df$대학, mat=T)
library(ggplot2) 
ggplot(owa.df, aes(x = 대학, y = 점수)) + 
  geom_boxplot(outlier.colour="red") + 
  ggtitle("대학별 점수") + 
  theme_classic() + 
  theme(title = element_text(color="darkblue", size=20))
ggplot(owa.df, aes(x=점수)) + 
  geom_histogram(binwidth=10) + 
  facet_grid(. ~ 대학) +
  ggtitle("대학별 점수") + 
  theme_classic()
bartlett.test(점수 ~ 대학, data=owa.df)
#install.packages("car")
library(car) 
leveneTest(점수 ~ 대학, data=owa.df)
owa.result<-aov(점수 ~ 대학, data=owa.df); owa.result 
summary(owa.result)
pairwise.t.test(owa.df$점수, owa.df$대학, data=owa.df, p.adj="bonf")
tukeyPlot<-TukeyHSD(owa.result) 
plot(tukeyPlot)
# install.packages("agricolae") 
library(agricolae)
LSD.test(owa.result, "owa.df$대학", console = TRUE, p.adj="bonf")
duncan.test(owa.result, "owa.df$대학", group=TRUE, console = TRUE) 
scheffe.test(owa.result, "owa.df$대학", group=FALSE, console = TRUE)
