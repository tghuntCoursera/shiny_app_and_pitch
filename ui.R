library(shiny)
library(ggplot2)

shinyUI(
  fluidPage(
    headerPanel('MySchoolBucks calculator'),
    div(HTML("&nbsp")),
    hr(),
    fluidRow (
      column(3, offset=0,
             textInput("name1", label="Child 1", value = "b", width = '550px'),
             textInput("name2", label="Child 2", value = "l", width = '550px'),
             textInput("name3", label="Child 3", value = "m", width = '550px'),
             textInput("name4", label="Child 4", value = "z", width = '550px')
             ),
      column(2, offset=0,
             numericInput('ch1.curr', 'Current balance', 0, step=0.01, width = '150px'),
             numericInput('ch2.curr', 'Current balance', 0, step=0.01, width = '150px'), 
             numericInput('ch3.curr', 'Current balance', 0, step=0.01, width = '150px'), 
             numericInput('ch4.curr', 'Current balance', 0, step=0.01, width = '150px')
             ),
      column(2, offset=0,
             numericInput('ch1.cost', 'Daily meal cost', 2.85, step=0.01, width = '150px'),
             numericInput('ch2.cost', 'Daily meal cost', 2.20, step=0.01, width = '150px'),
             numericInput('ch3.cost', 'Daily meal cost', 2.70, step=0.01, width = '150px'),
             numericInput('ch4.cost', 'Daily meal cost', 2.20, step=0.01, width = '150px')
             ),
      column(3, offset=0,
             numericInput('ch1.lunches', '# of days to fund', 10, step=1, width = '150px'),
             numericInput('ch2.lunches', '# of days to fund', 10, step=1, width = '150px'),
             numericInput('ch3.lunches', '# of days to fund', 10, step=1, width = '150px'),
             numericInput('ch4.lunches', '# of days to fund', 10, step=1, width = '150px')
             )
    ),

    hr(),
    fluidRow (
      plotOutput('plot1')
    ),
    hr(),
    fluidRow (
      wellPanel(
        h4("Instructions"),
        div(
          HTML(
            "Input area",
            "<ol>",
            "<li> Column 1 (Child ?)</li>",
            "<ul><li>Used to specify the names of the children, which will appear in the bar chart</li></ul>",
            "<li> Column 2 (Current Balance)",
            "<ul><li>Used to specify what the current account balance is.</li></ul>",
            "<li> Column 3 (Daily meal cost)",
            "<ul><li>Used to specify what the cost of a Lunch is.  Alternatively this could be used as a combination of lunch and breakfast assuming that you want to fund equal numbers of both.</li></ul>",
            "<li> Column 4 (# of days to fund)",
            "<ul><li>Used to specify the number of days to fund meals for.</li></ul>",
            "</ol>"
          )
        ),
        div(
          HTML(
            "Graph",
            "<ol>",
            "<li> The graph output is used to reflect the amount that needs to be added to each account.  If desired the image can be save or copied to share with others</li>",
            "</ol>"
          )
        )
      )
    )
  )
)