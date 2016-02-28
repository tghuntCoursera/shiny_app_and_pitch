library(shiny)
library(data.table)
library(ggplot2)

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

shinyServer(function(input, output, session) {

  # Combine the selected variables into a new data frame
  # Calculate the add.to variable.
  selectedData <- reactive({
    dt <- data.frame(
        names = c(input$name1,input$name2,input$name3,input$name4),
        curr.bal = c(input$ch1.curr,input$ch2.curr,input$ch3.curr,input$ch4.curr),
        lunch.cost = c(input$ch1.cost,input$ch2.cost,input$ch3.cost,input$ch4.cost),
        target.lunches = c(input$ch1.lunches,input$ch2.lunches,input$ch3.lunches,input$ch4.lunches),
        add.to <- c(0,0,0,0)
    )
    
    for(i in 1:4) {
      dt[i,"add.to"] = (dt[i,"target.lunches"] * dt[i,"lunch.cost"]) - dt[i,"curr.bal"]
    };
    dt
  })
  
  output$plot1 <- renderPlot({
    dt <- selectedData()
    p <- ggplot(data=dt, aes(x=names, y=add.to, fill=names)) + geom_bar(stat = "identity", position=position_dodge()) +
          geom_text(aes(y=add.to, ymax=add.to, label=round(add.to,2)), position= position_dodge(width=0.9), vjust=-.5, color="black") +
          ylab("Amount to add") + xlab("Child")
    p
  })
  
})