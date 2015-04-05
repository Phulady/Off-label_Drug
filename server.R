
require("shiny")
# set Working DIR
setwd("C:/Data/work/project/Off-label_Drug");
print(getwd())
source ("01_ReadOffLabel.R")
print('this is done')
# Read Offlabel Data
offLabel<- readOffLabelData()

#
drugNames <- sort(as.vector(unique(offLabel$DRUG_DESC)))
print(length(drugNames))

# Define Shiny Server
shinyServer(function(input,output) {
  output$chromSelect <- renderUI({
    selectInput( "chrom", "Chromosome", choices = c("I","II","III","IV","V","VI","VII","VIII","IX","X","XI","XII","XIII","XIV","XV","XVI", "Mito"))
  })
  output$drugNameSelect <- renderUI({
      selectizeInput("drugName","Select Drug:",choices=drugNames,options=list(maxOptions = 4000))
  })
  
})