# Form_test
Test of a submit and clear button in Shiny app

The app has a submit and clear button to allow repeated entry of data by the user.   The real app is connected to a Google Sheet which accumulates records; it also creates a SurveyMonkey survey.

What I expect to have happen:
After the Clear button is clicked, the shinyjs::reset function clears the data field.   From the help file:

"Reset any input element back to its original value. You can either reset one specific input at a time by providing the id of a shiny input, or reset all inputs within an HTML tag by providing the id of an HTML tag.

Reset can be performed on any traditional Shiny input widget, which includes: textInput, numericInput, sliderInput, selectInput, selectizeInput, radioButtons, dateInput, dateRangeInput, checkboxInput, checkboxGroupInput. Buttons are not supported, meaning that you cannot use this function to reset the value of an action button back to 0."

So, when the reset function executes, I expect the state of the Submit button to stay the same.

The submit_check1 reactive function executes when the Clear button is clicked; it prints out the error message.   

(This is acceptable behavior although it would be great to set the state of the form back to original behavior, where the error message only appears if you click Submit without entering a string in the name text box.)

Here's the part I don't understand:

it looks like the reactive functions sheet_confirmation and df1_out are both executing once the name box is filled in, event though they are contained within an observeEvent function that requires a change in state of submit button to execute.

Can anyone explain why?
