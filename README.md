[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/info.centrality)](https://cran.r-project.org/package=info.centrality)
[![Travis-CI Build Status](https://travis-ci.org/TomKellyGenetics/info.centrality.svg?branch=master)](https://travis-ci.org/TomKellyGenetics/info.centrality)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/TomKellyGenetics/info.centrality?branch=master&svg=true)](https://ci.appveyor.com/project/TomKellyGenetics/info.centrality)
 
## Install

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
