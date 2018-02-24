[![Travis-CI Build Status](https://travis-ci.org/TomKellyGenetics/info.centrality.svg?branch=master)](https://travis-ci.org/TomKellyGenetics/info.centrality)
 
## Install

>>>>>>> c3dfb6f20a186980a2f1c8de32b7ea5777818dd2
To get the iGraph package from CRAN:

```R
install.packages("igraph")
```

To get the extensions from github:

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/info.centrality")
```

## Usage

```R
#Compute efficiency of the network
network.efficiency(graph)

#Compute vertex information centrality for each vertex in the network
info.centrality.vertex(graph)

#Compute network information centrality
info.centrality.network(graph)
```
