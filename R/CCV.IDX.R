CCV.IDX <- function(x, cmax, cmin = 2, indexlist = "all", method = 'FCM', fzm = 2,
                    iter = 100, nstart = 20){

  # Defined vector
  ccvp = vector()
  ccvs = vector()
  distance =dist(x,diag = TRUE,upper= TRUE)
  # FOR CCVP CCVS
  distc = as.vector(as.matrix(distance))
  # start k loop
  for(k in cmin:cmax){
    if(method == "EM"){ # EM Algorithm
      EM.model <- Mclust(x,G=k,verbose=FALSE)
      assign("m",EM.model$z)
      assign("c",t(EM.model$parameters$mean))
    }else if(method == "FCM"){ # FCM Algorithm
      wd = Inf
      # cm.out = list()
      for (nr in 1:nstart){
        FCM.model = cmeans(x,k,iter,verbose=FALSE,method="cmeans",m=fzm)
        if (FCM.model$withinerror < wd){
          wd = FCM.model$withinerror
          FCM.model2 =FCM.model
        }
      }
      assign("m",FCM.model2$membership)
      assign("c",FCM.model2$centers)
    }
      uut = m%*%t(m)
      vnew = as.vector(1-(uut/max(uut)))

      if(sum(indexlist %in% c("all","CCVP"))>=1){
        ccvp[k-cmin+1] = cor(distc-mean(distc),vnew-mean(vnew),method = "pearson") #NW
      }
      if(sum(indexlist %in% c("all","CCVS"))>=1){
        ccvs[k-cmin+1] = cor(distc,vnew,method = "spearman") #NW
      }
    } # END CCVP CCVS index
  CCVP = data.frame(cbind("c"=cmin:cmax,"CCVP"=ccvp))
  CCVS = data.frame(cbind("c"=cmin:cmax,"CCVS"=ccvs))
  CCV.list = list("CCVP"= CCVP, "CCVS" = CCVS)
  if (sum(indexlist %in% "all")>=1){
    return(CCV.list)
  } else {
    return(CCV.list[indexlist])
  }
}
