\name{TANG.IDX}
\alias{TANG.IDX}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Tang index
}
\description{
Computes the TANG (Y. Tang et al., 2005) index for a result of either FCM or EM clustering from user specified \code{cmin} to \code{cmax}.
}
\usage{
TANG.IDX(x, cmax, cmin = 2, method = "FCM", fzm = 2, nstart = 20, iter = 100)
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
    The Tang index  is defined as \cr
   \tab \eqn{TANG(c) = \dfrac{\sum_{j=1}^c \sum_{i=1}^n\mu_{ij}^2\| {x}_i-{v}_j\|^2 + \frac{1}{c(c-1)}\sum_{j\neq k}\| {v}_j-{v}_k\|^2}{\min_{j\neq k} \{ \| {v}_j-{v}_k\|^2 \}+\frac{1}{c}}} \cr\cr
}
The smallest value of \eqn{TANG(c)} indicates a valid optimal partition.\cr
}
\value{
  \item{TANG}{the TANG index for \code{c} from \code{cmin} to \code{cmax} shown in a data frame where the first and the second columns are \code{c} and the TANG index, respectively.}
}
\references{
Y. Tang, F. Sun, and Z. Sun, “Improved validation index for fuzzy clustering,” in Proceedings of the 2005, American Control Conference, 2005., pp. 1120–1125 vol. 2, 2005. \url{https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=1470111&isnumber=31519}
}
\author{
Nathakhun Wiroonsri and Onthada Preedasawakul
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\link{R1_data}, \link{XB.IDX}, \link{FzzyCVIs}, \link{WP.IDX}}
\examples{
# ---- FCM algorithm ----
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Compute TANG index
FCM.TANG = TANG.IDX(scale(x), cmax = 15, cmin = 2, method = "FCM",
  fzm = 2, nstart = 20, iter = 100)
print(FCM.TANG)
# The optimal number of cluster
FCM.TANG[which.min(FCM.TANG$TANG),]

# ---- EM algorithm ----
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Compute TANG index
EM.TANG = TANG.IDX(scale(x), cmax = 15, cmin = 2, method = "EM",
  nstart = 20, iter = 100)
print(EM.TANG)
# The optimal number of cluster
EM.TANG[which.min(EM.TANG$TANG),]
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
