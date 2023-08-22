\name{HF.IDX}
\alias{HF.IDX}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
HF index
}
\description{
Computes the HF (F. Haouas et al., 2017) index for a result of either FCM or EM clustering from user specified \code{cmin} to \code{cmax}.
}
\usage{
HF.IDX(x, cmax, cmin = 2, method = "FCM", fzm = 2, nstart = 20, iter = 100)
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
    The HF index is defined as \cr
   \tab \eqn{HF(c) = \dfrac{\sum_{j=1}^c \sum_{i=1}^n\mu_{ij}^m\| {x}_i-{v}_j\|^2 + \frac{1}{c(c-1)}\sum_{j\neq k}\| {v}_j-{v}_k\|^2}{\frac{n}{2c}\left(\min_{j \neq k}\{\| {v}_j-{v}_k\|^2\} +\text{median}_{j \neq k }\{\| {v}_j-{v}_k\|^2\}\right)}.} \cr\cr
}
The smallest value of \eqn{HF(c)} indicates a valid optimal partition.\cr
}
\value{
  \item{HF}{the HF index for \code{c} from \code{cmin} to \code{cmax} shown in a data frame where the first and the second columns are \code{c} and the HF index, respectively.}
}
\references{
F. Haouas, Z. Ben Dhiaf, A. Hammouda and B. Solaiman, "A new efficient fuzzy cluster validity index: Application to images clustering," 2017 IEEE International Conference on Fuzzy Systems (FUZZ-IEEE), Naples, Italy, 2017, pp. 1-6.  \url{https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8015651&isnumber=8015374}
}
\author{
Nathakhun Wiroonsri and Onthada Preedasawakul
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\link{R1_data}, \link{WL.IDX}, \link{FzzyCVIs}, \link{TANG.IDX}}
\examples{
# ---- FCM algorithm ----
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Compute HF index
FCM.HF = HF.IDX(scale(x), cmax = 15, cmin = 2, method = "FCM",
  fzm = 2, nstart = 20, iter = 100)
print(FCM.HF)
# The optimal number of cluster
FCM.HF[which.min(FCM.HF$HF),]

# ---- EM algorithm ----
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Compute HF index
EM.HF = HF.IDX(scale(x), cmax = 15, cmin = 2, method = "EM",
  nstart = 20, iter = 100)
print(EM.HF)
# The optimal number of cluster
EM.HF[which.min(EM.HF$HF),]
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
