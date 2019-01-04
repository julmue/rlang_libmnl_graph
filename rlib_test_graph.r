library(graph)
library(Rgraphviz)
library(purrr)
library(magrittr)

# create a random graph
set.seed(123)
g1 = randomEGraph(LETTERS[1:15], edges=100)

g1

# get the nodes
nodes(g1)

# get the degree
degree(g1)

# get the adjacent nodes of a node
adj(g1, "A")

# nodes that can be reached
acc(g1, "A")


# defining subgraphs
# * one can obtain subgraphs of a given graph by specifying the set of nodes that they are interested in
# * a subgraph is a copy of the relevant part of the original graph
# * a subgraph is the set of specified nodes plus any edges between them

sg1 = subGraph(c("A", "E", "F", "L"), g1)

sg1

# boundary
boundary(sg1, g1)

edges(g1)

# -----------------------------------------------------------------------------
# graphNEL
# * This is a class of graphs that are represented in terms of nodes and an edge list. 
# * This is a suitable representation for a graph with a large number of nodes and relatively few edges.

# Functions for graph creation
# * addNode
# * addEdge
# * removeNode
# * removeEdge
addNode <- function(object, node, ...) { graph::addNode(node, object, ...) }
addEdge <- function(graph, from, to, ...) { graph::addEdge(from, to, graph, ...) }

# create the empty graph
entities <- graphNEL(edgemode="directed")
entities %<>% 
  addNode("YI5") %>%
  addNode("XI5") %>%
  addNode("XBF") %>%
  addNode("XBL") %>%
  addNode("XIS") %>%
  addNode("XIF")

entities %<>% 
  addEdge(
  c("XI5", "XBF", "XBL", "XIS", "XIF"), "YI5")  


bw_satellites <-
  subGraph(
    c("XI5", "XBF", "XBL", "XIF", "XIS"),
    entities
  )


# plot with subgraphs
subGList <- vector(mode="list")
subGList[[1]] <- list(graph=bw_satellites) 


plot(entities, 
     subGList=subGList)

# layout methods supported by Rgraphviz
plot(flow, "dot")
plot(flow, "neato")
plot(flow, "twopi")

# unsupported?
plot(x, "circo")
plot(x, "fdp")

# edge names

edgeNames(entities)

# -----------------------------------------------------------------------------
# Attributes
# list: http://www.graphviz.org/pub/scm/graphviz2/doc/info/attrs.html

# global attributes


# -----------------------------------------------------------------------------
# Attributes
