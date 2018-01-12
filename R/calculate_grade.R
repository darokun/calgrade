calculate_grade <- function(grammar_mistakes, spelling_mistakes, style_mistakes, content_mistakes, late = FALSE, by = 0) {

    grammar_grade <- grammar_mistakes * 0.5
    spelling_grade <- spelling_mistakes * 0.25
    style_grade <- style_mistakes * 0.25
    content_grade <- content_mistakes * 0.5
    
    mistakes <- grammar_grade + spelling_grade + style_grade + content_grade
    grade <- 100 - mistakes
    
    if(late == FALSE) {    
        final_grade <- grade
    
  } else if(by >= 1 & by <= 3) {
        final_grade <- grade * 0.9  
  }
    else if(by >= 4 & by <= 7) {
        final_grade <- grade * 0.8
  }
    else if(by >= 8 & by <= 14) {
        final_grade <- grade * 0.7
  }
    else if(by > 14) {
        final_grade <- grade * 0
  }

cat("Grading \n Grammar:", grammar_mistakes, "* 0.50 =", grammar_grade,
        "\n Spelling:", spelling_mistakes, "* 0.25 =", spelling_grade,
        "\n Style:", style_mistakes, "* 0.25 =", style_grade,
        "\n Content:", content_mistakes, "* 0.50 =", content_grade,
        "\n Grade: 100 -", mistakes, "=", grade,
        "\n Late?", if(late == TRUE) print("Yes") else print("No"), 
        "\n By how many days?", "by", by, "day(s)",
        "\n Final grade:", final_grade,
        "\n Comments:")
}