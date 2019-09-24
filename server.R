
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$plot1<-renderPlot({
    number<-input$Numeric
    dataX<-1:number
    dataY<-1/(1+exp(-dataX+number/2))++rnorm(number,0,.05)
    datay2<-(-dataY)+max(dataY)
    dataX<-c(dataX,dataX)
    dataY3<-c(dataY,datay2)
    #pnorm(dataX,mean=mean(dataX),sd=sd(dataX))+rnorm(number,0,.05)#+rexp(number,1)
    plot(dataX,dataY3,type = "p",pch=19)
    
    if(input$considerx==1){
      asig<-kmeans(cbind(dataX,dataY3),input$k)$cluster+1
      points(dataX,dataY3,col=asig,pch=19)}else{
        asig<-kmeans(dataY3,input$k)$cluster+1
        points(dataX,dataY3,col=asig,pch=19)
      }
    
  })
})
