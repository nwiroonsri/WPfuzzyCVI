\name{XB.IDX}
\alias{XB.IDX}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Xie and Beni (XB) index
}
\description{
Computes the XB (X. L. Xie and G. Beni, 1991) index for a result of either FCM or EM clustering from user specified \code{cmin} to \code{cmax}.
}
\usage{
XB.IDX(x, cmax, cmin = 2, method = "FCM", fzm = 2, nstart = 20, iter = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a numeric data frame or matrix where each column is a variable to be used for cluster analysis and each row is a data point.
}
  \item{cmax}{a maximum number of clusters to be considered.
}
  \item{cmin}{a minimum number of clusters to be considered. The default is \code{2}.
}
  \item{method}{a character string indicating which clustering method to be used ("\code{FCM}" or "\code{EM}")
}
  \item{fzm}{a number greater than 1 giving the degree of fuzzification for \code{method = "FCM"}. The default is \code{2}.
}
  \item{nstart}{a maximum number of initial random sets for FCM for \code{method = "FCM"}. The default is \code{20}.
}
  \item{iter}{a maximum number of iterations for \code{method = "FCM"}. The default is \code{100}.
}
}
\details{
  \tabular{lc}{
    The XB index is defined as \cr
   \tab \eqn{ XB(c) = \dfrac{\sum_{j=1}^c\sum_{i=1}^n\mu_{ij}^2\| {x}_i-{v}_j\|^2}
             {n \cdot \min_{j\neq k} \{ \| {v}_j-{v}_k\|^2 \}}} \cr\cr
}
The lowest value of XB(c) indicates a valid optimal partition.\cr
}
\value{
  \item{XB}{the XB index for \code{c} from \code{cmin} to \code{cmax} shown in a data frame where the first and the second columns are \code{c} and the XB index, respectively.
}
}
\references{
X. Xie and G. Beni, “A validity measure for fuzzy clustering,” IEEE
Transactions on Pattern Analysis and Machine Intelligence, vol. 13, no. 8,
pp. 841–847, 1991.
}
\author{
Nathakhun Wiroonsri and Onthada Preedasawakul
}
\note{
xxx
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\link{R1_data}, \link{TANG.IDX}, \link{FzzyCVIs}, \link{WP.IDX}}

\examples{
# ---- FCM algorithm ----
The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Compute XB index
FCM.XB = XB.IDX(scale(x), cmax = 15, cmin = 2, method = "FCM",
  fzm = 2, nstart = 20, iter = 100)
print(FCM.XB)
# The optimal number of cluster
FCM.XB[which.min(FCM.XB$XB),]

# ---- EM algorithm ----
The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Compute XB index
EM.XB = XB.IDX(scale(x), cmax = 15, cmin = 2, method = "EM",
  nstart = 20, iter = 100)
print(EM.XB)
# The optimal number of cluster
EM.XB[which.min(EM.XB$XB),]
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
