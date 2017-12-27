library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Data Visualization of various data sets"),
  sidebarPanel(
    
    ## conditionalPanel() functions for selected tab
    conditionalPanel(condition="input.tabselected==1"),
    conditionalPanel(condition="input.tabselected==2",
                     selectInput("dataset", "select the desired dataset", choices=ls('package:datasets'), 
                                 selected = "mtcars"),
                     radioButtons("choice","Choose an option", choices=c("Dataset" = 1, "Structure" = 2,
                                                                         "Summary" = 3 ))
                     
    ),
    
    conditionalPanel(condition="input.tabselected==3",uiOutput("varx"),uiOutput("vary"))
    
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("About", value=1, helpText(p("This app allows users to visualize any of R's inbuilt datasets. The user can take a look at the data of the dataset, structure of the dataset and the summary of any given dataset. The user will also be able to create a scatter plot between any two variables of a given dataset.")
                                    )),
      tabPanel("Data", value=2, conditionalPanel(condition="input.choice==1", verbatimTextOutput("dat")),
               conditionalPanel(condition="input.choice==2", verbatimTextOutput("struct")),
               conditionalPanel(condition="input.choice==3", verbatimTextOutput("summary"))),
      tabPanel("Plot", value=3, plotOutput("plot")), 
      id = "tabselected"
      )
    )
  ))