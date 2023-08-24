# WPfuzzyCVI


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


