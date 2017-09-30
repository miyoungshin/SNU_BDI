rm(list = ls())
setwd('d:')
list.files()
system(command = "r --no-restore --no-save <test.r> test_out.txt",wait = FALSE)
# 백그라운드 실행

for (i in 1:8)
{
  system(command = paste0("r --no-restore --no-save --args ",
                          i, " <test.r> test_out_",
                          i, ".txt"), wait = FALSE)
}
options(echo=TRUE) 
args <- commandArgs(trailingOnly = TRUE)
print(args)
idx = as.integer(args[1])
rm(args)

a = 0
for (i in 1:30)
{
  Sys.sleep(1)
  a = a + 1
}
a = a*idx
print(idx)
save.image(paste0("test_",idx,".rdata"))


a = system("tasklist", intern = T)
head(a)


b <-gregexpr(" ", a[[3]])[[1]]

taskResult <- matrix("", length(a)-3, 5)  
nn <- c("image" ,"PID" , "session_name" ,"session_num" , "memory")
colnames(taskResult) <- nn
for(i in 4L:length(a))
{
  for (j in 1:5)
  {
    if (j == 1) tmp <- substring(a[[i]],1,b[1])
    if (j == 5) tmp <- substring(a[[i]],b[4]+1)
    if (j!=1 & j!=5) tmp <- substring(a[[i]],b[j-1]+1,b[j])
    taskResult[i-3,j] <- gsub("(^ +)|( +$)", "", tmp)
  }
}


taskRead <- function()
{
  a <- system("tasklist", intern = T)
  b <-gregexpr(" ", a[[3]])[[1]]
  taskResult <- matrix("", length(a)-3, 5)  
  nn <- c("image" ,"PID" , "session_name" ,"session_num" , "memory")
  colnames(taskResult) <- nn
  for(i in 4L:length(a))
  {
    for (j in 1:5)
    {
      if (j == 1) tmp <- substring(a[[i]],1,b[1])
      if (j == 5) tmp <- substring(a[[i]],b[4]+1)
      if (j!=1 & j!=5) tmp <- substring(a[[i]],b[j-1]+1,b[j])
      taskResult[i-3,j] <- gsub("(^ +)|( +$)", "", tmp)
    }
  }
  return(taskResult)
}

aa <- taskRead()
bb <- sum(aa == 'R.exe')

nMaxTask <-5
tr <- taskRead()
nCurrentTask  <- sum(tr[,1]=="R.exe")
nAvailableTask <- nMaxTask - nCurrentTask

if (bb < nMaxTask ) {
  
}
