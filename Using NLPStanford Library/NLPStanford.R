library(readr, "C:/Users/thanhdc/Documents/R/R-3.3.1/library/readr")
library(rJava, "C:/Users/thanhdc/Documents/R/R-3.3.1/library/rJava")
library(coreNLP, "C:/Users/thanhdc/Documents/R/R-3.3.1/library/coreNLP")

#Get data from file
outputNLP <- function(pathFile ) {
  mystring <- read_file(pathFile)
  return (c(mystring))
}
usingNLP <- function(stringTemp) { 
  #Init Stanford Lib
  initCoreNLP("D:/Soft/stanford-corenlp-full-2015-04-20")  
  output = annotateString(stringTemp)
  return (getToken(output)) #Data frame
}

NLP_Data_Frame <- usingNLP (outputNLP("D:/hehe.txt"))

getFrequence <- function (dataFrame, type) {
  vector = c()
  
  lengthArr <- nrow(dataFrame)
  
  for (index in 1:lengthArr){
    if (grepl(type, dataFrame[index, 7] )) {
      vector <- c(vector, dataFrame[index, 3])
    }
  }
  
  result <- sort(table(vector),decreasing=T)
  return(result)
}

View(getFrequence(NLP_Data_Frame, "JJ"))

