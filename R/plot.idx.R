plot.idx <- function(idx.result){
  if(is.data.frame(idx.result)){
    par(mar = c(4, 4, 0.5, 0.5))
    par(mfrow=c(1,1))
    IDX.name = names(idx.result)[2]
    if(IDX.name == "WPC"){
      plot(data.frame(idx.result),ylab = IDX.name, xlab = "c",type='b')
    }
    # Plot the indexes that the largest value indicates a valid optimal partition.
    else if(sum(IDX.name == c("WP","WPCI1","WPCI2","PBM","KPBM","CCVP","CCVS")) == 1){
      plot(data.frame(idx.result),ylab = IDX.name, xlab = "c",type='b')
      points(data.frame(idx.result)[which.max(data.frame(idx.result)[,2]),1],max(data.frame(idx.result)[,2]),col='red',pch=20)
    }else { # Plot the indexes that the smallest value indicates a valid optimal partition.
      plot(data.frame(idx.result),ylab = IDX.name, xlab = "c",type='b')
      points(data.frame(idx.result)[which.min(data.frame(idx.result)[,2]),1],min(data.frame(idx.result)[,2]),col='red',pch=20)
    }
  }else{
    n.idx = length(idx.result)
    name.idx = names(idx.result)
    if(n.idx == 18){
      name.idx = name.idx[!name.idx %in% c('WPC', 'WPCI1', 'WPCI2')][1:8]
      n.idx = length(name.idx)
    }else{
      n.idx = min(8,n.idx)
      name.idx = name.idx[1:n.idx]
    }
    par(mar = c(4, 4, 0.5, 0.5))
    if(n.idx <= 3){
      par(mfrow=c(1,n.idx))
    }else {
      par(mfrow=c(2,ceiling(n.idx/2)))
    }
    for(np in 1:n.idx){
      IDX.name = name.idx[np] #name of index
      IDX = idx.result[[IDX.name]]
      if(IDX.name == "WPC"){
        plot(data.frame(IDX),ylab = IDX.name, xlab = "c",type='b')
      }
      # Plot the indexes that the largest value indicates a valid optimal partition.
      else if(sum(IDX.name == c("WP","WPCI1","WPCI2","PBM","KPBM","CCVP","CCVS")) == 1){
        plot(data.frame(IDX),ylab = IDX.name, xlab = "c",type='b')
        points(data.frame(IDX)[which.max(data.frame(IDX)[,2]),1],max(data.frame(IDX)[,2]),col='red',pch=20)
      }else { # Plot the indexes that the smallest value indicates a valid optimal partition.
        plot(data.frame(IDX),ylab = IDX.name, xlab = "c",type='b')
        points(data.frame(IDX)[which.min(data.frame(IDX)[,2]),1],min(data.frame(IDX)[,2]),col='red',pch=20)
      }
    }
  }
}

