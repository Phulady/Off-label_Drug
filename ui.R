require("shiny")

shinyUI(pageWithSidebar(
    headerPanel("Off-label Uses of Drugs"),
    sidebarPanel(
      sliderInput("windowsize", 
                  "Windowsize:", 
                  min = 10,
                  max = 200,
                  value = 50,
                  step = 5),
      uiOutput ("drugNameSelect"),
      uiOutput("chromSelect")
    ),
    mainPanel(
      print("Test")
      #uiOutput ("drugNameSelect")
    )
  )
)