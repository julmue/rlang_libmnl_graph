library(purrr)
library(magrittr)
library(graph)
library(Rgraphviz)

set.seed(123)
g <- randomEGraph(LETTERS[1:15], edges=100)

g <- graphNEL(
  c("A","B","C","D"),
  edgemode = "directed"
)

g <- addEdge("A", "B", g)
g <- addEdge("B", "A", g)
g <- addEdge("A", "C", g)
g <- addEdge("A", "D", g)
g <- addEdge("B", "C", g)
g <- addEdge("D", "C", g)


l1 <- g %>% listEdges 

length(l1)
# > 5 Pairing of all nodes independent of direction (A:B, A:C, A:D, ...)
# list for all nodes
length(l1[[1]]) # A:B
# > 2

# now list of all edges (contains all edges)
l2 <- flatten(l)

l4 <- l1 %>% unlist
