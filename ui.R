require("shiny")



shinyUI(fluidPage(
  # Load d3.js
  tags$head(
    tags$script(src = 'http://d3js.org/d3.v3.min.js')
  ),
  titlePanel("Off-label Uses of Drugs"),
  sidebarLayout(
    sidebarPanel(
       uiOutput ("drugNameSelect"),
       sliderInput("MentionByResources", 
                   "Mentioned By Resources (atleast):", 
                   min = 1,
                   max = 4,
                   value = 1,
                   step = 1),
       radioButtons("DrugUse", label = h3("Possible Drug Use:"),
                    choices = list("Any" = 2, "On Label" = 1,
                                   "Off Label" = 0),selected = 2)
#      uiOutput("chromSelect")
    ),
    mainPanel(
       htmlOutput("networkPlot"),
       dataTableOutput('selectedTable')
       #verbatimTextOutput("networkPlot")
       
     # uiOutput ("drugNameSelect")
    )
  )
))