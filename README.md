# WPfuzzyCVI
A correlation-based fuzzy cluster validity index with secondary options detector

## Description

WPfuzzyCVI is a package used for analyzing soft clustering results such as Fuzzy c-means and EM algorithm. 
It contains a main function [WP.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/WP.IDX.R) that computes WP correlation (WPC), WP, WPCI1 and WPCI2 indexes for a result of either FCM or EM clustering from user specified cmin to cmax.

### The package includes the following functions.
1. [FzzyCVIs](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/FzzyCVIS.R): Fuzzy cluster validity indexes used in Wiroonsri and Preedasawakul (2023).
2. [WP.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/WP.IDX.R): Wiroonsri and Preedasawakul (WP) index.
3. [XB.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/KWON.IDX.R): Xie and Beni (XB) index.
4. [KWON.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/KWON.IDX.R): KWON index
5. [KWON2.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/KWON2.IDX.R): KWON2 index
6. [TANG.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/TANG.IDX.R): Tang index.
7. [HF.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/HF.IDX.R): HF index.
8. [WL.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/WL.IDX.R): Wu and Li (WL) index.
9. [PBM.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/PBM.IDX.R): Pakhira-Bandyopadhyay-Maulik (PBM) index.
10. [KPBM.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/KPBM.IDX.R): Modified Kernel form of Pakhira-Bandyopadhyay-Maulik (KPBM) index.
11. [CCV.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/CCV.IDX.R): Correlation Cluster Validity (CCV) index.
12. [GC.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/GC.IDX.R): The generalized C index.
13. [AccClust](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/AccClust.R): Accuracy detection for a clustering result with known classes.
14. [plot.idx](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/plot.idx.R): xxxx

### The package also includes 17 artificial datasets detail in [FuzzyDatasets](https://github.com/O-PREEDASAWAKUL/FuzzyDatasets.git)


## Installation

```bash
install.packages("devtools")
devtools::install_github("nwiroonsri/WPfuzzyCVIs")
```




## Simple Example in Artificial data sets
### Using FzzyCVIs computes all index in function
```r
library(FuzzyDatasets)
library(WPfuzzyCVI)
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). 
x = R1_data[,1:2]

# Computes all indexes of a FCM clustering result for c from 2 to 15
FCVIs.all = FzzyCVIs(scale(x), cmax = 15, cmin = 2, indexlist = 'all', corr = 'pearson',
         method = 'FCM', fzm = 2, iter = 100, nstart = 20, NCstart = TRUE)
#---Plot and compare the indexes---
plot.idx(idx.result=FCVIs.all)
```
### Plot
![](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/Example/FzzyCVIs%20all.jpeg)


### Using FzzyCVIs computes specific indexes in function
```r
# Computes all indexes of a FCM clustering result for c from 2 to 15
IDX.list = c("WP", "PBM", "TANG", "XB", "GC2", "KWON2")
FCVIs = FzzyCVIs(scale(x), cmax = 15, cmin = 2, indexlist = "all", corr = 'pearson',
                 method = 'FCM', fzm = 2, iter = 100, nstart = 20, NCstart = TRUE)
#---Plot and compare the indexes---
plot.idx(idx.result=FCVIs)
```
### Plot
![](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/Example/FzzyCVIs.jpeg)


## Simple Example in realworld iris
### Using WP.IDX function computes WP index
```r
library(WPfuzzyCVI)

x = iris[,1:4]

# Computes all indexes of a FCM clustering result for c from 2 to 15
FCM.WP = WP.IDX(scale(x), cmax = 10, cmin = 2, corr = 'pearson', method = 'FCM', fzm = 2,
                iter = 100, nstart = 20, NCstart = TRUE)
#---Plot and compare the indexes---
plot.idx(idx.result=FCM.WP )
```
### Plot
![](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/Example/iris.wp.fcm.jpeg)


