
require("shiny")
require("d3Network")
# set Working DIR
setwd("C:/Data/work/project/Off-label_Drug");
print(getwd())
source ("01_ReadOffLabel.R")
print('this is done')
# Read Offlabel Data
offLabel<- readOffLabelData(HIGHPRECISIONSUBSET=TRUE)
filterOffLabel <- offLabel 
#print(summary(offLabel))
#
drugNames <- sort(as.vector(unique(offLabel$DRUG_DESC)))
#print(length(drugNames))



# Define Shiny Server
shinyServer(function(input,output) {
  # Make Drug List by input arguments
#   if (input$DrugUse == 2) { # Any
#       filterOffLabel <- subset(offLabel,(MENTIONEDBYRESOURCES >= input$MentionByResources
#                                        & ! is.na(INDICATION_DESCRIPTION))
#       )
#   } else {
#     filterOffLabel <- subset(offLabel,(MENTIONEDBYRESOURCES >= input$MentionByResources
#                                        & POSSIBLE_LABEL_USE == input$DrugUse 
#                                        & ! is.na(INDICATION_DESCRIPTION))
#     )
#   }

  #drugNames <- sort(as.vector(unique(subset(filterOffLabel$DRUG_DESC))))
                      
  # Selected Drug name 
  output$drugNameSelect <- renderUI({
      selectizeInput("drugName","Select Drug:",choices=drugNames,options=list(maxOptions = 4000))
  })
  
  # Table 
  output$selectedTable <- renderDataTable(
    subset(filterOffLabel,(DRUG_DESC==input$drugName ),
           select=c("RXCUI_IN","DRUG_DESC","ICD9","INDICATION_DESCRIPTION"))
  )
  
  # Network ouput 
  output$networkPlot <- renderPrint({
    selOffLabel <- subset(filterOffLabel,(DRUG_DESC==input$drugName & ! is.na(INDICATION_DESCRIPTION)) )

    count <- nrow(selOffLabel)
    #print(selOffLabel)
    Target <- rep(0,count)  #drug
    Source <- c(1:count)      #disease
    Value  <- selOffLabel$MENTIONEDBYRESOURCES
    Link  <- data.frame(Source,Target,Value)
    name   <- c(paste("Drug:",input$drugName),selOffLabel$INDICATION_DESCRIPTION)
    #print(name)
    group  <- c(0,selOffLabel$MENTIONEDBYRESOURCES)
    ID    <- 1:length(name)
    Node   <- data.frame(ID,name,group)
    d3ForceNetwork(Nodes = Node, 
                    Links = Link,  
                    Source = "Source", Target = "Target",                     
                    Value = "Value", NodeID = "name", 
                    Group = "group",width = 600, height = 500,
                    opacity = 0.9, zoom = TRUE,
                    linkWidth = "function(d) { return (d.value*2); }",
                    parentElement = '#networkPlot')
 })
  
})