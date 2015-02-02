set.seed(32297)
d <- data.frame(x=runif(100),y=runif(100))
clus <- kmeans(d,centers=5)
d$cluster <- clus$cluster
library('ggplot2'); library('grDevices')
h <- do.call(rbind, lapply(unique(clus$cluster), function(c) { f <- subset(d,cluster==c); f[chull(f),]}))
ggplot() +
  geom_text(data=d,aes(label=cluster,x=x,y=y,
                       color=cluster),size=3) + 
  geom_polygon(data=h,aes(x=x,y=y,group=cluster,
                          fill=as.factor(cluster)),
                            alpha=0.4,linetype=0) +
  theme(legend.position = "none")