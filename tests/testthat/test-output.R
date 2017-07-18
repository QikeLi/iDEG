context("Output")

test_that("Testing output", {
    set.seed(1)
    exp_mean1 <- rexp(20000, 1/500) + 1
    exp_mean2 <- exp_mean1
    exp_mean2[1:100] <- exp_mean2[1:100] * 10
    transcriptome1 <- rnbinom(n = length(exp_mean1), size = 60, mu = exp_mean1)
    transcriptome2 <- rnbinom(n = length(exp_mean2), size = 60, mu = exp_mean2)
    res <- iDEG(transcriptome1,transcriptome2)
    expect_is(res$result, 'data.frame')
})


test_that("Testing the number dispersion estiamtes",{
    set.seed(1)
    exp_mean1 <- rexp(20000, 1/500) + 1
    exp_mean2 <- exp_mean1
    exp_mean2[1:100] <- exp_mean2[1:100] * 10
    transcriptome1 <- rnbinom(n = length(exp_mean1), size = 60, mu = exp_mean1)
    transcriptome2 <- rnbinom(n = length(exp_mean2), size = 60, mu = exp_mean2)
    res1 <- iDEG(transcriptome1,transcriptome2)
    expect_true(length(res1$sizeHat) == 1)
    res2 <- iDEG(transcriptome1,transcriptome2, constDisp = F)
    expect_true(length(res2$sizeHat) > 1)    
})


test_that("Testing the class of the estimated function",{
    set.seed(1)
    exp_mean1 <- rexp(20000, 1/500) + 1
    exp_mean2 <- exp_mean1
    exp_mean2[1:100] <- exp_mean2[1:100] * 10
    transcriptome1 <- rnbinom(n = length(exp_mean1), size = 60, mu = exp_mean1)
    transcriptome2 <- rnbinom(n = length(exp_mean2), size = 60, mu = exp_mean2)
    res2 <- iDEG(transcriptome1,transcriptome2, constDisp = F)
    expect_is(res2$alphaFuntion, 'smooth.spline')
})


