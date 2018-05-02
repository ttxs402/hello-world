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

匹配代码如下merge(x, y, by = c("k1","k2"))  #inner join
