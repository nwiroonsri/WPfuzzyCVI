XB.IDX <- function(x, cmax, cmin = 2, method = "FCM",
                   fzm = 2, nstart = 20, iter = 100){
  # Defined vector
  xb = vector()
  # Start k loop
  for(k in cmin:cmax){
    if(method == "EM"){ # EM Algorithm
      EM.model <- Mclust(x,G=k,verbose = FALSE)
      assign("m",EM.model$z)
      assign("c",t(EM.model$parameters$mean))
    }else if(method == "FCM"){ # FCM Algorithm
      wd = Inf
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
    # defined variable for index
      d1= vector()
      d3 = vector()
      n = nrow(x)
      for (j in 1:k){
        center = matrix(c[j,],n,ncol(x),byrow = T) #NW
        d1[j] = (m[,j])^2%*%rowSums((x-center)^2)
      }
      s=1
      for(i in 1:(k-1)){
        for(j in (i+1):k){
          d3[s]=sum((c[i,]-c[j,])^2)
          s=s+1
        }
      }
      xb[k-cmin+1] = (sum(d1))/(n*min(d3))
  }
    XB.data = data.frame(cbind("c"=cmin:cmax,"XB"=xb))
  return(XB.data)
}
