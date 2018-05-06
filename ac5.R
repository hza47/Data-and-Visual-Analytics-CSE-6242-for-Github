# Activity: Time Series Analysis

#install.packages('igraph')
setwd("C:/Users/vchugh/Documents/Academics/Georgia Tech/Spring 2018/CS 6242 Data and Visual Analytics/Activity 5/")
library(igraph)
library(ggplot2)

#Read Edge list in a table
fb_edges  <- read.table("facebook/3980.edges")

#Read Feature list in a table
fb_features  <- read.table("facebook/3980.feat")

#Read Feature names in the list
fb_featurenames  <- read.table("facebook/3980.featnames")

#Create a etwork using graph_from_data_frame
net <- graph_from_data_frame(d=fb_edges, vertices=fb_features, directed=F) 

# Pick the attribute in V22 to colour the nodes for which this attribute is relevant.
V(net)$V22=as.character(fb_features$V22[match(V(net)$name,fb_features$V1)])

#Colour the nodes based on an attribute. In this case we pick attribute in V22 in the Feature list
V(net)$color=V(net)$V22

#if the attribute value for the node is 0, it is coloured red.
V(net)$color=gsub("0","red",V(net)$color)

#if the attribute value for the node is 1, it is coloured blue
V(net)$color=gsub("1","blue",V(net)$color)

#Define the size of the nodes for better visuals.
V(net)$size=4

#Plot the Graph
plot.igraph(net,vertex.label=NA,layout=layout.fruchterman.reingold)
