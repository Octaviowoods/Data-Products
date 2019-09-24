library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    
    # Application title
    titlePanel("Creating clusters"),
    
    sidebarLayout(
      sidebarPanel(
        "Next Input means, how many points you want to create for the grafic and cluster metodology",
        numericInput("Numeric","How many points (Integer)",value=1000,min=1,max=10000,step=1),
        "How many clusters do you want to use?",    
        numericInput("k","Number of clusters (Integer)",value=2,min=0,max=10,step=1),
        "Do you want to consider de aise X?" ,
        checkboxInput("considerx","Consider X in the cluster",value = TRUE)
      )
      ,
      mainPanel(
        h3("Graphic"),
        "It was created some data in order to use cluster metodology and be able to alocate data in diferents groups",
        plotOutput("plot1")
      )
    )
  )
)




