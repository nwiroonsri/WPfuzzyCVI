\name{plot.idx}
\alias{plot.idx}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot the indices in the same package
}
\description{
Plot and compare upto 8 indices computed from the algorithms in the same package.
}
\usage{
plot.idx(idx.result)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{idx.result}{A result from one of the algorithms \code{FzzyCVIs, WP.IDX, GC.IDX, CCV.IDX, XB.IDX, WL.IDX, TANG.IDX, PBM.IDX, KWON.IDX, KWON2.IDX, KPBM.IDX or HF.IDX}.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
generate plots of upto 8 cluster validity indices computed from \code{FzzyCVIs, WP.IDX, GC.IDX, CCV.IDX, XB.IDX, WL.IDX, TANG.IDX, PBM.IDX, KWON.IDX, KWON2.IDX, KPBM.IDX or HF.IDX}. When using the isolated index algorithm, all the plots computed by that algorithm will be shown. When using \code{FzzyCVIs} with more than 8 selected indices, the first 8 indices will be plotted.
}
\references{
N. Wiroonsri, O. Preedasawakul, A correlation-based fuzzy cluster validity index with secondary options detector, arXiv:2308.14785, 2023
}
\author{
Nathakhun Wiroonsri and Onthada Preedasawakul
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\link{FzzyCVIs}, \link{WP.IDX}, \link{XB.IDX}
}
\examples{

# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Use GC.IDX function
FCVIs = FzzyCVIs(scale(x), cmax = 15, cmin = 2, indexlist = 'all', corr = 'pearson',
                 method = 'FCM', fzm = 2, iter = 100, nstart = 20, NCstart = TRUE)
plot.idx(idx.result = FCVIs)

# Use WP.IDX function
FCM.WP = WP.IDX(scale(x), cmax = 15, cmin = 2, corr = 'pearson', method = 'FCM', fzm = 2, iter = 100, nstart = 20, NCstart = TRUE)
plot.idx(idx.result = FCM.WP)

# Use XB.IDX function
FCM.XB = XB.IDX(scale(x), cmax = 15, cmin = 2, method = "FCM",
  fzm = 2, nstart = 20, iter = 100)
plot.idx(idx.result = FCM.XB)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
