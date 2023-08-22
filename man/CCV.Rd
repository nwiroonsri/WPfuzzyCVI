\name{CCV.IDX}
\alias{CCV.IDX}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Correlation Cluster Validity (CCV) index
}
\description{
Computes the CCVP and CCVS (M. Popescu et al., 2013) indexes for a result of either FCM or EM clustering from user specified \code{cmin} to \code{cmax}.
}
\usage{
CCV.IDX(x, cmax, cmin = 2, indexlist = "all", method = 'FCM', fzm = 2,
  iter = 100, nstart = 20)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a numeric data frame or matrix where each column is a variable to be used for cluster analysis and each row is a data point.
}
  \item{cmax}{a maximum number of clusters to be considered.
}
  \item{cmin}{a minimum number of clusters to be considered. The default is \code{2}.
}
  \item{indexlist}{a character string indicating which The generalized C index be computed ("\code{all}","\code{CCVP}","\code{CCVS}"). More than one indexes can be selected.
}
  \item{method}{a character string indicating which clustering method to be used ("\code{FCM}" or "\code{EM}")
}
  \item{fzm}{a number greater than 1 giving the degree of fuzzification for \code{method = "FCM"}. The default is \code{2}.
}
  \item{iter}{a maximum number of iterations for \code{method = "FCM"}. The default is \code{100}.
}
  \item{nstart}{a maximum number of initial random sets for FCM for \code{method = "FCM"}. The default is \code{20}.
}
}
\details{
A new cluster validity framework that compares the structure in the data to the structure of dissimilarity matrices induced by a matrix transformation of the partition being tested.  The largest value of \eqn{CCV(c)} indicates a valid optimal partition.
}
\value{
  Each of the followings show the value of each index for \code{c} from \code{cmin} to \code{cmax} in a data frame.
  \item{CCVP}{the Pearson Correlation Cluster Validity index.}
  \item{CCVS}{the Spearman’s (rho) Correlation Cluster Validity index.}
}
\references{
M. Popescu, J. C. Bezdek, T. C. Havens and J. M. Keller (2013). A Cluster Validity Framework Based on Induced Partition Dissimilarity. \url{https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6246717&isnumber=6340245}
}
\author{
Nathakhun Wiroonsri and Onthada Preedasawakul
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{FzzyCVIs}, \link{GC.IDX}, \link{KWON.IDX},  \link{R1_data}}
}
\examples{
# ---- FCM algorithm ----
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.

x = R1_data[,1:2]


# Compute all the indexes
FCM.ALL.CCV = CCV.IDX(scale(x), cmax = 15, cmin = 2, indexlist = "all",
  method =  'FCM', fzm = 2, iter = 100, nstart = 20)
print(FCM.ALL.CCV)

# Compute only CCVP
FCM.CCVP = CCV.IDX(scale(x), cmax = 15, cmin = 2, indexlist = "CCVP",
  method =  'FCM', fzm = 2, iter = 100, nstart = 20)
print(FCM.CCVP)


# ---- EM algorithm ----

x = R1_data[,1:2]


# Compute all the indexes
EM.ALL.CCV = CCV.IDX(scale(x), cmax = 15, cmin = 2, indexlist = "all",
  method =  'EM', iter = 100, nstart = 20)
print(EM.ALL.CCV)

# Compute only CCVP
EM.CCVP = CCV.IDX(scale(x), cmax = 15, cmin = 2, indexlist = "CCVP",
  method =  'EM', iter = 100, nstart = 20)
print(EM.CCVP)
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
