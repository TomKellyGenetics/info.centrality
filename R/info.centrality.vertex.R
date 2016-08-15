# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

##' @name Information Centrality functions
##' @rdname info.centrality
##'
##' @title Functions of to compute the information centrality of a vertex (node) and network respectively. Includes a network efficiency measure to compute as a metrig for information centrality. Uses graphs functions as an egtension of \code{\link[igraph]{igraph}}.
##'
##' @param graph An \code{\link[igraph]{igraph}} object. May be directed or weighted as long as a shortest path can be computed.
##' @param verbose Logical. Whether computing information centrality of each node prints to monitor progress of a potentially long run-time. Defaults to FALSE.
##' @param net Numeric. Efficiency of the Network without an nodes removed. Defaults to computing for Graph given as input, can be given as a numeric if computed in advance to save run time.
#'  @keywords graph network igraph centrality
#'  @import igraph
NULL

##' @rdname info.centrality
##' @examples
##' g <- make_ring(10)
##' distances(g)
##' shortest_paths(g, 5)
##' network.efficiency(g)
##' g <- make_star(10)
##' network.efficiency(g)
##' @export
network.efficiency <- function(graph){
  if(is_igraph(graph)==F) warning("Please use a valid iGraph object")
  dd <- 1/shortest.paths(graph)
  diag(dd) <- NA
  efficiency <- mean(dd, na.rm=T)
  #denom <- nrow(dd)*(ncol(dd)-1)
  #sum(dd, na.rm=T)/denom
  return(efficiency)
}

##' @rdname info.centrality
##' @examples
##' g <- make_ring(10)
##' info.centrality.vertex(g)
##' g <- make_star(10)
##' info.centrality.vertex(g)
##' @export
info.centrality.vertex <- function(graph, net=NULL, verbose=F){
  if(is_igraph(graph)==F) warning("Please use a valid iGraph object")
  if(is.null(net)) net <- network.efficiency(graph)
  if(is.numeric(net)==F){
    warning("Please ensure net is a scalar numeric")
    net <- network.efficiency(graph)
  }
  count <- c()
  for(i in 1:length(V(graph))){
    count <- c(count, (net-network.efficiency(delete.vertices(graph, i)))/net)
    if(verbose){
      print(paste("node",i,"current\ info\ score", count[i], collapse="\t"))
    }
  }
  return(count)
}
##' @rdname info.centrality
##' @examples
##' g <- make_ring(10)
##' info.centrality.network(g)
##' g <- make_star(10)
##' info.centrality.network(g)
##' @export
info.centrality.network <- function(graph, net=network.efficiency(graph), verbose=F) sum(info.centrality.vertex(graph))
