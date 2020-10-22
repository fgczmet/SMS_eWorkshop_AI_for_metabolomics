#Trellis plots for compound time series visulisation

#Virtual time series for time points t and compounds c1, c2 and c3

t<-c(1,1,1,6,6,6,24,24,24)

> t
[1]  1  1  1  6  6  6 24 24 24

c1<-c(0.8,1,1.2,4.8,5,5.2,23,24,25)

> c1
[1]  0.8  1.0  1.2  4.8  5.0  5.2 23.0 24.0 25.0

 
plot(t,c1)

c2<-c(4.8,5,5.2,4.8,5,5.2,4.8,5,5.2)

> c2
[1] 4.8 5.0 5.2 4.8 5.0 5.2 4.8 5.0 5.2

plot(t,c2)

c3<-c(24,26,27,6.2,6,5.5,2.1,1.9,1.1)

> c3
[1] 24.0 26.0 27.0  6.2  6.0  5.5  2.1  1.9  1.1

plot(t,c3)

#Creating an appropriate data frame
#compound intensities or concentrations
c<-c(c1,c2,c3)

> c
 [1]  0.8  1.0  1.2  4.8  5.0  5.2 23.0 24.0 25.0  4.8  5.0  5.2  4.8  5.0  5.2  4.8  5.0  5.2 24.0 26.0 27.0  6.2
[23]  6.0  5.5  2.1  1.9  1.1

#time points
t<-rep(t,3)

> t
 [1]  1  1  1  6  6  6 24 24 24  1  1  1  6  6  6 24 24 24  1  1  1  6  6  6 24 24 24
 
#compound identifiers
cmp<-c(rep("c1",9),rep("c2",9),rep("c3",9))

> cmp
 [1] "c1" "c1" "c1" "c1" "c1" "c1" "c1" "c1" "c1" "c2" "c2" "c2" "c2" "c2" "c2" "c2" "c2" "c2" "c3" "c3" "c3" "c3"
[23] "c3" "c3" "c3" "c3" "c3"

#data frame long format
df<-as.data.frame(cbind(cmp,t,c))

> df
   cmp  t   c
1   c1  1 0.8
2   c1  1   1
3   c1  1 1.2
4   c1  6 4.8
5   c1  6   5
6   c1  6 5.2
7   c1 24  23
8   c1 24  24
9   c1 24  25
10  c2  1 4.8
11  c2  1   5
12  c2  1 5.2
13  c2  6 4.8
14  c2  6   5
15  c2  6 5.2
16  c2 24 4.8
17  c2 24   5
18  c2 24 5.2
19  c3  1  24
20  c3  1  26
21  c3  1  27
22  c3  6 6.2
23  c3  6   6
24  c3  6 5.5
25  c3 24 2.1
26  c3 24 1.9
27  c3 24 1.1

#correction of data types

df$t<-as.numeric(as.character(df$t))
df$c<-as.numeric(as.character(df$c))

> df
   cmp  t    c
1   c1  1  0.8
2   c1  1  1.0
3   c1  1  1.2
4   c1  6  4.8
5   c1  6  5.0
6   c1  6  5.2
7   c1 24 23.0
8   c1 24 24.0
9   c1 24 25.0
10  c2  1  4.8
11  c2  1  5.0
12  c2  1  5.2
13  c2  6  4.8
14  c2  6  5.0
15  c2  6  5.2
16  c2 24  4.8
17  c2 24  5.0
18  c2 24  5.2
19  c3  1 24.0
20  c3  1 26.0
21  c3  1 27.0
22  c3  6  6.2
23  c3  6  6.0
24  c3  6  5.5
25  c3 24  2.1
26  c3 24  1.9
27  c3 24  1.1

#Trellis plots
library(lattice)
trellis.device(width=8,height=4)
xyplot(c~t|cmp,data=df)
# do not use xyplot(c~t|cmp,data=df,type = "b")
xyplot(c~t|cmp,data=df,pch=c(1,2,3))
xyplot(c~t|cmp,data=df,pch=c(1,2,3),col=c(1,2,3))
