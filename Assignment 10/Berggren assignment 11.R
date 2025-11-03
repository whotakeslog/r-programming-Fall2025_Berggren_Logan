tukey.outlier <- function(x) {
  if (!is.numeric(x)) stop("Input must be numeric.")
  
  qnt <- quantile(x, probs = c(0.25, 0.75), na.rm = TRUE)
  H <- 1.5 * IQR(x, na.rm = TRUE)

  (x < (qnt[1] - H)) | (x > (qnt[2] + H))
}

tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])}
  return(outlier.vec)
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
tukey_multiple(test_mat)

# Corrected inside the loop:
outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])

corrected_tukey <- function(x) {
  if(!is.numeric(x)) stop("Matrix must have numeric Values")
  outliers <- array(TRUE, dim = dim(x)) 
  for (j in seq_len(ncol(x))) {outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

corrected_tukey(test_mat)
