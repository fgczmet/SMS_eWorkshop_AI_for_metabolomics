plotbga <- function (x, axis1 = 1, axis2 = 2, arraycol = NULL, genecol = "gray25", 
    nlab = 10, genelabels = NULL, ...) 
{
    dudi.bga <- x
    if (!inherits(dudi.bga, "bga")) 
        stop("Object of class bga expected")
    if (is.null(arraycol)) 
        arraycol = getcol(1:length(levels(dudi.bga$fac)))
    if (is.null(genelabels)) 
        genelabels = rownames(dudi.bga$bet$co)
    if (dudi.bga$bet$nf == 1) {
        par(mfrow = c(1, 3))
        between.graph(dudi.bga, ax = 1, hor = FALSE, ...)
        title("biplot of samples and metabolites")
        graph1D(dudi.bga$bet$ls, ax = 1, classvec = dudi.bga$fac, 
            col = arraycol, ...)
        title("samples")
        graph1D(dudi.bga$bet$co, ax = 1, s.nam = genelabels, 
            n = nlab, ...)
        title("metabolites")
    }
    if (dudi.bga$bet$nf > 1) {
        par(mfrow = c(2, 2))
        s.var(dudi.bga$bet$ls, xax = axis1, yax = axis2, col = as.vector(factor(dudi.bga$fac, 
            labels = arraycol)), ...)
        plotarrays(dudi.bga, axis1, axis2, arraycol = arraycol, 
            ...)
        plotgenes(dudi.bga$bet$co, nlab = nlab, axis1 = axis1, 
            axis2 = axis2, genelabels = genelabels, colpoints = genecol, 
            ...)
        s.groups(dudi.bga$bet$ls, dudi.bga$fac, cellipse = 0, 
            col = arraycol, add.plot = TRUE, xax = axis1, yax = axis2, 
            ...)
        scatterutil.eigen(dudi.bga$bet$eig)
    }
}
