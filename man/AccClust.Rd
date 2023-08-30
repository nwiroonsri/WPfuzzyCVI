\name{AccClust}
\alias{AccClust}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Accuracy detection for a clustering result with known classes
}
\description{
Computes the accuracy of a clustering result of a dataset with known classes from the k-means, fuzzy c-means, or EM algorithm.
}
\usage{
AccClust(x, label.names = "label", algorithm = "FCM", fzm = 2,
  scale = TRUE, nstart = 20, iter = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a numeric data frame or matrix where each column is a variable to be used for cluster analysis and each row is a data point.
}
  \item{label.names}{a character string indicating the true label column name.
}
  \item{algorithm}{a character string indicating which clustering methods to be used ("\code{FCM}", "\code{EM}", "\code{Kmeans}"). More than one methods may be selected.
}
  \item{fzm}{a number greater than 1 giving the degree of fuzzification for \code{method = "FCM"}. The default is \code{2}.
}
  \item{scale}{logical, if \code{TRUE} (default), the dataset is normalized before clustering.
}
  \item{nstart}{a maximum number of initial random sets for FCM for \code{method = "FCM" or "Kmeans" or c("Kmeans","FCM")}. The default is \code{20}.
}
  \item{iter}{a maximum number of iterations for \code{method = "FCM"}. The default is \code{100}.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  \item{kmeans}{Accuracy score from \code{0} to \code{1} of the k-means result}
  \item{FCM}{Accuracy score from \code{0} to \code{1} of the FCM result}
  \item{EM}{Accuracy score from \code{0} to \code{1} of the EM result}
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

\seealso{\link{R1_data}, \link{D1_data}, \link{FzzyCVIs}, \link{WP.IDX}, \link{XB.IDX}}
\examples{
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.

x = R1_data

AccClust(x, label.names = "label",algorithm = c("FCM","EM","Kmeans"), fzm = 2,
  scale = TRUE, nstart = 20,iter = 100)


AccClust(x, label.names = "label",algorithm = "FCM", fzm = 2,
  scale = TRUE, nstart = 20,iter = 100)
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
