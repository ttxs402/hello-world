#20180518    
authors <- data.frame(
  surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  deceased = c("yes", rep("no", 4)))
books <- data.frame(
  name = I(c("Tukey", "Venables", "Tierney",
             "Ripley", "Ripley", "McNeil", "R Core")),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis",
            "An Introduction to R"),
  other.author = c(NA, "Ripley", NA, NA, NA, NA,
                   "Venables & Smith"))

#如果要实现类似sql里面的inner join 功能，则用代码
m1 <- merge(authors, books, by.x = "surname", by.y = "name")
#如果要实现left join功能则用代码
m1 <- merge(authors, books, by.x = "surname", by.y = "name",all.x=TRUE)
#right join功能代码
m1 <- merge(authors, books, by.x = "surname", by.y = "name",all.y=TRUE)
#all join功能代码
m1 <- merge(authors, books, by.x = "surname", by.y = "name",all=TRUE)
#关于单变量匹配的总结就是这些，但对于多变量匹配呢，例如下面两个表，需要对k1,k2两个变量都相等的情况下匹配
x <- data.frame(k1 = c(NA,NA,3,4,5), k2 = c(1,NA,NA,4,5), data = 1:5)
y <- data.frame(k1 = c(NA,2,NA,4,5), k2 = c(NA,NA,3,4,5), data = 1:5)

匹配代码如:merge(x, y, by = c("k1","k2"))  #inner join


#write.xlsx
#将数据写进EXCEL的不同sheet页
library(xlsx)
library(openxlsx)
Sys.setenv("R_ZIPCMD" = "/usr/bin/zip")

file_old <- paste0('5501_JB_modelscore_',Sys.Date()-2,'.xlsx')
file.remove(file_old)
filename <- paste0('5501_JB_basicdata_',Sys.Date()-1,'.xlsx')
openxlsx::write.xlsx(l,file = filename,asTable = TRUE,
                     halign = 'center',valign = 'center',tabColour = '#1A33CC',
                     firstRow = TRUE,firstCol=TRUE)
blz_5501_basic_0416<-blz_5501_basic[2,]
blz_5501_blank_0416<-blz_5501_blank[2,]
l=list(blz_5501_basic_0416,blz_5501_blank_0416)
names(l)<-c('basic','blank')

#####write.xlsx
names(l)=c(Sys.Date()-1,Sys.Date()-2,Sys.Date()-3,Sys.Date()-4,Sys.Date()-5)
#将各个数据框整合到一个list里面，以方便一次性写出多个sheet页
ll<-list(blz_5505_basic,blz_5505_blank)
#给每一个sheet页命名,也可以直接在上面的list里面直接命名  list("A"=blz_5505_basic,"B"<-blz_5505_blank)
names(ll)<-c('blz_5505_basic','blz_5505_blank')

library(xlsx)
library(openxlsx)
Sys.setenv("R_ZIPCMD"="/usr/bin/zip")
workSpace<-getwd()
filename <- paste0('bank_trig_reject_report_',Sys.Date()-2,'.xlsx')
file <- list.files(workSpace,pattern = filename)
file.remove (file)
filename <- paste0('bank_trig_reject_report_',Sys.Date()-1,'.xlsx')
#asTable=T表示使用writeDataTable函数来写入数据，该函数里面有很多参数是默认的，即很多参数是缺省值，直接等于TRUE则方便快捷使用
openxlsx::write.xlsx(ll,file=filename
                     ,asTable=TRUE,halign='center',valign='center'
                     ,tabColour ='#1A33CC'
                     ,firstRow = TRUE
                     ,firstCol = TRUE)
#若为单个数据框，可直接用入参sheetName来命名sheet页
openxlsx::write.xlsx(dataframe,file=filename
                     ,sheetName="sheetname"
                     ,asTable=TRUE
                     ,halign='center'
                     ,valign='center'
                     ,tabColour ='#1A33CC'
                     ,firstRow = TRUE
                     ,firstCol = TRUE
                     ,colWidths = 'auto')
