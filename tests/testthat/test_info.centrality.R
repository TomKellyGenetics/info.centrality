library("info.centrality")
context("information centrality")

test_that("network efficiency", {
  library("igraph")
  g.1 <- graph( c(1,3,2,3,3,4,4,5) )
  ne1 <- network.efficiency(g.1)
  expect_that(ne1, equals(2/3))

  g.2 <- graph( c(2,1,3,1,4,1,5,1) )
  ne2 <- network.efficiency(g.2)
  expect_that(ne2, equals(7/10))

  g.3 <- graph( c(1,2,2,3,3,4,4,1,5,1) )
  ne3 <- network.efficiency(g.3)
  expect_that(ne3, equals(11/15))
})

test_that("vertex centrality", {
  g.1 <- graph( c(1,3,2,3,3,4,4,5) )
  vc1 <- info.centrality.vertex(g.1)
  expect_that(vc1,  equals(c(-2, -2, 18, 9, -3)/24))

  g.2 <- graph( c(2,1,3,1,4,1,5,1) )
  vc2 <- info.centrality.vertex(g.2)
  expect_that(vc2, equals(c(14, -1, -1, -1, -1)/14))

  g.3 <- graph( c(1,2,2,3,3,4,4,1,5,1) )
  vc3 <- info.centrality.vertex(g.3)
  expect_that(vc3, equals(c(57, 2, -3, 2, -18)/132))
})

test_that("vertex centrality with precomputed efficiency", {
  g.1 <- graph( c(1,3,2,3,3,4,4,5) )
  ne1 <- network.efficiency(g.1)
  vc1 <- info.centrality.vertex(g.1, net = ne1)
  expect_that(vc1,  equals(c(-2, -2, 18, 9, -3)/24))

  g.2 <- graph( c(2,1,3,1,4,1,5,1) )
  ne2 <- network.efficiency(g.2)
  vc2 <- info.centrality.vertex(g.2, net = ne2)
  expect_that(vc2, equals(c(14, -1, -1, -1, -1)/14))

  g.3 <- graph( c(1,2,2,3,3,4,4,1,5,1) )
  ne3 <- network.efficiency(g.3)
  vc3 <- info.centrality.vertex(g.3, net = ne3)
  expect_that(vc3, equals(c(57, 2, -3, 2, -18)/132))
})

test_that("network centrality", {
  g.1 <- graph( c(1,3,2,3,3,4,4,5) )
  nc1 <- info.centrality.network(g.1)
  expect_that(nc1,  equals(5/6))

  g.2 <- graph( c(2,1,3,1,4,1,5,1) )
  nc2 <- info.centrality.network(g.2)
  expect_that(nc2, equals(5/7))

  g.3 <- graph( c(1,2,2,3,3,4,4,1,5,1) )
  nc3 <- info.centrality.network(g.3)
  expect_that(nc3, equals(10/33))
})
