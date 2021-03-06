\name{plot.gtsvm}
\alias{plot.gtsvm}
\title{Scatter plot for classification models}
\description{
  A scatter figure is generated for the classification model trained by the \code{\link{svm}}. 
  The figure only shows two feature columns within training data. 
  Optionally, a filled contour is predicted and added to the class regions.
  }
\usage{
\method{plot}{gtsvm}(x, data, formula, 
      fill = TRUE, grid = 50, slice = list(),
      symbolPalette = palette(), 
      svSymbol = "x", dataSymbol = "o", ...)
}
\arguments{
  \item{x}{an object of class \code{gtsvm} generated by \code{\link{svm}}.}
  \item{data}{data frame with the training data.}
  \item{formula}{formula object indicating two feature columns used as the X axis and Y axis if more than two feature columns in the training data.}
  \item{fill}{logical value indicating whether a contour plot for the class regions is added.}
  \item{grid}{integer value indicating the grid number to generating the the contour if \code{fill = TRUE}.}
  \item{slice}{a list of feature columns that are constant during the predicting for the grid contour if training data has more than two feature columns. 
all feature columns but two feature columns used in the X axis and Y axis must be held constant to generate a grid contour prediction..
In order to generate a contour, except two feature columns of X axis and Y axis, other feature columns hold constant values for predicting.
Default unspecified feature columns use 0 for numeric variables and the first level for factors.}
  \item{symbolPalette}{Color palette indicating the color of the class data points and support vectors belong to.}
  \item{svSymbol}{character or integer code indicating plot character or symbol for support vectors, check the available values in \code{pch} in \code{\link{points}} function.}
  \item{dataSymbol}{character or integer code indicating plot character or symbol for non-support vectors, check the available values in \code{pch} in \code{\link{points}} function.}
  \item{\dots}{additional graphics parameters passed to \code{filled.contour} or \code{plot}.}
}

\author{David Meyer\cr
  \email{David.Meyer@R-project.org}}
\seealso{\code{\link{svm}}}

\examples{
## a simple example
library(MASS);
data(cats, package = "MASS")
m <- svm(Sex~., data = cats)
plot(m, cats)

## more than two variables: fix 2 dimensions
data(iris)
m2 <- svm(Species~., data = iris)
plot(m2, iris, Petal.Width ~ Petal.Length,
     slice = list(Sepal.Width = 3, Sepal.Length = 4))

## plot with custom symbols and colors
plot(m, cats, svSymbol = 1, dataSymbol = 2, symbolPalette = rainbow(4),
color.palette = terrain.colors)


}
\keyword{svm}
\keyword{plot}
