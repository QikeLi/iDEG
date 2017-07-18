context("Messages")

test_that("Correct error messages is returned when the class of either input transcriptome is not a vector", {
    set.seed(1)
    exp_mean1 <- rexp(20000, 1/500) + 1
    exp_mean2 <- exp_mean1
    exp_mean2[1:100] <- exp_mean2[1:100] * 10
    transcriptome1 <- rnbinom(n = length(exp_mean1), size = 60, mu = exp_mean1)
    transcriptome2 <- as.data.frame(rnbinom(n = length(exp_mean2), size = 60, mu = exp_mean2))
    expect_error(iDEG(transcriptome1,transcriptome2),
                 'The two provied transcriptomes need to be numerical vectors, and the name of each element in the vectors should be the gene name corresponding to that numercial value')
    transcriptome1 <- as.data.frame(rnbinom(n = length(exp_mean1), size = 60, mu = exp_mean1))
    transcriptome2 <- rnbinom(n = length(exp_mean2), size = 60, mu = exp_mean2)
    expect_error(iDEG(transcriptome1,transcriptome2),
                 'The two provied transcriptomes need to be numerical vectors, and the name of each element in the vectors should be the gene name corresponding to that numercial value')
})



test_that("Correct error message is returned when the order of genes of two input transcriptomes differ", {
    set.seed(1)
    exp_mean1 <- rexp(20000, 1/500) + 1
    exp_mean2 <- exp_mean1
    exp_mean2[1:100] <- exp_mean2[1:100] * 10
    transcriptome1 <- rnbinom(n = length(exp_mean1), size = 60, mu = exp_mean1)
    transcriptome2 <- rnbinom(n = length(exp_mean2), size = 60, mu = exp_mean2)
    gene_names <-
        apply(combn(letters, m = 5),2,
              function(x) paste(x, collapse = ''))[1:length(transcriptome1)]
    names(transcriptome1) <-  gene_names
    names(transcriptome2) <-  sample(gene_names, size = length(gene_names))    
    expect_error(iDEG(transcriptome1,transcriptome2),
                 'The genes of the two provided transcriptomes are not in the same order. Please check the gene names.')
})


test_that("Correct error message is returned when the length two input transcriptomes differ", {
    set.seed(1)
    exp_mean1 <- rexp(20000, 1/500) + 1
    exp_mean2 <- exp_mean1
    exp_mean2[1:100] <- exp_mean2[1:100] * 10
    transcriptome1 <- rnbinom(n = length(exp_mean1) -1, size = 60, mu = exp_mean1)
    transcriptome2 <- rnbinom(n = length(exp_mean2), size = 60, mu = exp_mean2)
    gene_names <-
        apply(combn(letters, m = 5),2,
              function(x) paste(x, collapse = ''))[1:length(transcriptome1)]
    names(transcriptome1) <-  gene_names
    names(transcriptome2) <-  sample(gene_names, size = length(gene_names))    
    expect_error(iDEG(transcriptome1,transcriptome2),
                 'The two provided transcriptomes contain different numbers of genes.')
})
