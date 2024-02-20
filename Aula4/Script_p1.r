
library(ggplot2)
var1=2:4
var2=4:6
df2=data.frame(var1,var2)

ggplot(df2,aes(x=var1, y=var2)) + geom_line()