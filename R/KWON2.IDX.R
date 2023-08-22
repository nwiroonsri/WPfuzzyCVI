KWON2.IDX <- function(x, cmax, cmin = 2, method = "FCM",
                      fzm = 2, nstart = 20, iter = 100){

  # Defined vector
  kwon2 = vector()
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
      d2 = rowSums((c-matrix(colMeans(x),k,ncol(x),byrow=T))^2)
      d3 = vector()
      d4 = vector()
      n = nrow(x)
      w1 = (n-k+1)/n
      w2 = (k/(k-1))^sqrt(2)
      w3 = (n*k)/(n-k+1)^2
      for (j in 1:k){
        center = matrix(c[j,],n,ncol(x),byrow = T)
        d4[j] = ((m[,j])^(2^sqrt(fzm/2))%*%rowSums((x-center)^2))
      }

      s=1
      for(i in 1:(k-1)){
        for(j in (i+1):k){
          d3[s]=sum((c[i,]-c[j,])^2)
          s=s+1
        }
      }
      kwon2[k-cmin+1] = w1*((w2*sum(d4)) + (sum(d2)/max(d2)) + w3 ) / (min(d3) + 1/k + 1/(k^fzm - 1))
    }
  KWON2.data = data.frame(cbind("c"=cmin:cmax,"KWON2"=kwon2))
  return(KWON2.data)
}
