KPBM.IDX <- function(x, cmax, cmin = 2, method = "FCM",
                     fzm = 2, nstart = 20, iter = 100){
  # Defined vector
  kpbm = vector()
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
    # Defined variables
      d3 = vector()
      d8 = vector()
      d9 = vector()
      n = nrow(x)
      for (j in 1:k){
        center = matrix(c[j,],n,ncol(x),byrow = T)
        d8[j] = (m[,j])%*%sqrt(rowSums((x-center)^2))
      }

      s=1
      for(i in 1:(k-1)){
        for(j in (i+1):k){
          d3[s]=sum((c[i,]-c[j,])^2)
          d9[s]= sqrt(d3[s]) #NW
          s=s+1
        }
      }
      kpbm[k-cmin+1] = ((1/k)*(max(d9)/sum(d8)))^2
  }
  KPBM.data = data.frame(cbind("c"=cmin:cmax,"KPBM"=kpbm))
  return(KPBM.data)
}
