#test app to load the form and clear it for second try
## using 

library(shiny)
library(shinyjs)
source("helpers.R")

ui <- fluidPage(
  
   useShinyjs(),
   div(id="form_app",
      textInput(
        inputId = "champ_name",
        label   = "Your name (person who will be the point of contact with TCP)",
        value   = "")
  ),
  actionButton(inputId = "submit", label="Submit"),
  actionButton(inputId = "ClearAll", label= "Clear"), 
  hr(),
  textOutput("sheet_confirmation"),
  tableOutput("table_output")
)

server <- function(input, output){

  submit_check1 <- reactive({
      champ_name <- input$champ_name
      conditions_met <- champ_name != ''
                            
      if (conditions_met) {
            out <- list(submit = TRUE, error_message = NULL)
      }                 
      else {
            out <- list(submit = FALSE)
            if(champ_name== '') error_message <- "Enter name"
            out$error_message <- error_message
      }
      return(out)
    })
  
    observeEvent(input$submit, {
        sheet_confirmation <- reactive({
        champ_name    <- input$champ_name
        conditions <- submit_check1()
         if(conditions$submit) {
           out <- sprintf("Table updated")
         }
                     else {
            out <- conditions$error_message
          }
         out
      })
      
        df1_out <- reactive({
        champ_name <- input$champ_name
        conditions <- submit_check1()
        if(conditions$submit) {
          output_sheet_row <- data.frame(name=champ_name)
          #add a row to the data frame
          df1 <- rbind.data.frame(df1,output_sheet_row)
        }
        return(df1)
      })
      
      output$sheet_confirmation <- renderText(sheet_confirmation())
      output$table_output <- renderTable(df1_out())
    })
    
      observeEvent(input$ClearAll, {
      reset("form_app")
    })
  }

shinyApp(ui, server)

