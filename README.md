##Install

To get the iGraph package from CRAN:

```R
install.packages("igraph")
```

To get the extensions from github:

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/info.centrality")
```

##Usage

```R
#Compute efficiency of the network
network.efficiency(graph)

#Compute vertex information centrality for each vertex in the network
info.centrality.vertex(graph)

#Compute network information centrality
info.centrality.network(graph)
```
