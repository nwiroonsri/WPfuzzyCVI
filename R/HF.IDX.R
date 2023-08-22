HF.IDX <- function(x, cmax, cmin = 2, method = "FCM",
                   fzm = 2, nstart = 20, iter = 100){
  # Defined vector
  hf = vector()
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
    # Defined variable
      d3 = vector()
      d5 = vector()
      n = nrow(x)

      for (j in 1:k){
        center = matrix(c[j,],n,ncol(x),byrow = T)
        d5[j] = (m[,j])^fzm%*%rowSums((x-center)^2)
      }
      s=1
      for(i in 1:(k-1)){
        for(j in (i+1):k){
          d3[s]=sum((c[i,]-c[j,])^2)
          s=s+1
        }
      }
      adp = (1/(k*(k-1)))*sum(d3)
      hf[k-cmin+1] =  (sum(d5) + 2*adp)/ ((n/2*k)* (min(d3) + median(d3)))
  }
  HF.data = data.frame(cbind("c"=cmin:cmax,"HF"=hf))
  return(HF.data)
}
