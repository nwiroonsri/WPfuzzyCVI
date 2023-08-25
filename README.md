# WPfuzzyCVIs
Algorithms for computing cluster validity indices including the WP index and plots for comparing and visualizing them.

## Description

WPfuzzyCVIs is a package used for analyzing soft or probabilistic clustering results including fuzzy c-means (FCM) and EM algorithm. 
It contains the main algorithm  [FzzyCVIs](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/FzzyCVIS.R) that computes all the indices listed below from the user specified cmin to cmax. It also includes [WP.IDX](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/WP.IDX.R) that computes WP correlation (WPC), WP, WPCI1 and WPCI2 from the recent work (Wiroonsri and Preedasawakul, 2023). The version compatible with hard clustering results including Kmeans and hierachical clustering can be found in https://github.com/nwiroonsri/NCvalid.

### The package includes the following algorithms.
1. [FzzyCVIs](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/FzzyCVIS.R): for computing all or part of the indices below.
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
13. [AccClust](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/AccClust.R): for computing an accuracy for a clustering result with known classes.
14. [plot.idx](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/R/plot.idx.R): for ploting and comparing upto 8 indices computed from the algorithms 1 to 12.

### The package also includes 17 simulated datasets from [FuzzyDatasets](https://github.com/O-PREEDASAWAKUL/FuzzyDatasets.git)


## Installation

```bash
install.packages("devtools")
devtools::install_github("nwiroonsri/WPfuzzyCVIs")
```


## Example 
### Using WP.IDX to compute the WP index for a clustering result from 2 to 10
```r
library(WPfuzzyCVI)

x = iris[,1:4]

# Computes all indexes of a FCM clustering result for c from 2 to 10
FCM.WP = WP.IDX(scale(x), cmax = 10, cmin = 2, corr = 'pearson', method = 'FCM', fzm = 2,
                iter = 100, nstart = 20, NCstart = TRUE)
#---Plot and compare the indexes---
plot.idx(idx.result=FCM.WP )
```
### Plot
![](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/Example/iris.wp.fcm.jpeg)


## Example
### Using FzzyCVIs to compute all the indices in the package for a clustering result from 2 to 15
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


### Using FzzyCVIs to compute 6 selected indices for a clustering result from 2 to 15 with the fuzziness parameter gamma = 7
```r
# Computes 6 indices for a FCM clustering result for c from 2 to 15
IDX.list = c("WP", "PBM", "TANG", "XB", "GC2", "KWON2")
FCVIs = FzzyCVIs(scale(x), cmax = 15, cmin = 2, indexlist = "all", corr = 'pearson',
                 method = 'FCM', fzm = 2, gamma = 7, iter = 100, nstart = 20, NCstart = TRUE)
#---Plot and compare the indexes---
plot.idx(idx.result=FCVIs)
```
### Plot
![](https://github.com/nwiroonsri/WPfuzzyCVIs/blob/main/Example/FzzyCVIs.jpeg)

## References

N" Wiroonsri and O. Preedasawakul, “A correlation-based fuzzy cluster validity index with secondary options detector”, arXiv, 2023. 

X. Xie and G. Beni, “A validity measure for fuzzy clustering,” IEEE Transactions on Pattern Analysis and Machine Intelligence, vol. 13, no. 8, pp. 841–847, 1991.

S. H. Kwon, “Cluster validity index for fuzzy clustering,” Electronics letters, vol. 34, no. 22, pp. 2176–2177, 1998. \cr\cr

M. K. Pakhira, S. Bandyopadhyay, and U. Maulik, “Validity index for crisp and fuzzy clusters,” Pattern recognition, vol. 37, no. 3, pp. 487–501, 2004.

Y. Tang, F. Sun, and Z. Sun, “Improved validation index for fuzzy clustering,” in Proceedings of the 2005, American Control Conference, 2005., pp. 1120–1125 vol. 2, 2005.

C. Alok. (2010). An investigation of clustering algorithms and soft computing approaches for pattern recognition, Department of Computer Science, Assam University.

M. Popescu, J. C. Bezdek, T. C. Havens and J. M. Keller, "A Cluster Validity Framework Based on Induced Partition Dissimilarity," in IEEE Transactions on Cybernetics, vol. 43, no. 1, pp. 308-320, Feb. 2013.

C. H. Wu, C. S. Ouyang, L. W. Chen, and L. W. Lu, “A new fuzzy clustering validity index with a median factor for centroid-based clustering,” IEEE Transactions on Fuzzy Systems, vol. 23, no. 3, pp. 701–718, 2015.

J. C. Bezdek, M. Moshtaghi, T. Runkler, and C. Leckie, “The generalized c index for internal fuzzy cluster validity,” IEEE Transactions on Fuzzy Systems, vol. 24, no. 6, pp. 1500–1512, 2016. 

F. Haouas, Z. Ben Dhiaf, A. Hammouda and B. Solaiman, "A new efficient fuzzy cluster validity index: Application to images clustering," 2017 IEEE International Conference on Fuzzy Systems (FUZZ-IEEE), Naples, Italy, 2017, pp. 1-6.

S. H. Kwon, J. Kim, and S. H. Son, “Improved cluster validity index for fuzzy clustering,” Electronics Letters, vol. 57, no. 21, pp. 792–794, 2021.

## License

The NCvalid package as a whole is distributed under [GPL(>=3)](https://www.gnu.org/licenses/gpl-3.0.en.html).

