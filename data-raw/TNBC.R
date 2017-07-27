library(TCGA2STAT)

dat_brca <- getTCGA(disease = "BRCA",
                          data.type = "RNASeq2",
                          type = 'count')

dat_tnbc_A2C9 <- dat_brca$dat[,grep('TCGA-GI-A2C9',colnames(dat_brca$dat))]
tumor <- dat_tnbc_A2C9[,grep('01A', colnames(dat_tnbc_A2C9))]
healthy <- dat_tnbc_A2C9[,grep('11A', colnames(dat_tnbc_A2C9))]

exp_tnbc_A2C9 <- data.frame('Tumor_Sample' = tumor, 'Healthy_Sample' = healthy)

write.csv(exp_tnbc_A2C9,'data-raw/exp_tnbc_A2C9.csv')
devtools::use_data(exp_tnbc_A2C9, overwrite = TRUE)
