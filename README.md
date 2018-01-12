# calgrade
======================================================

## Overview
calgrade is a package including one function called `calculate_grade`. The main objective of this function is to calculate students' grades for assignments in the Scientific English courses, as part of the [IntMOSH](http://www.en.m-osh.med.uni-muenchen.de/index.html) at [LMU Munich](http://www.en.uni-muenchen.de/index.html).

## Installation
You can install the package from GitHub:
```r
# install.packages("devtools")
devtools::install_github("darokun/calgrade")
```

You can then load the package:
```r
library(calgrade)
```

## Grading
Grading starts with each assignment being worth 100% (100 points). The function discounts points depending on the type and number of mistakes. These can be set into these four arguments:
* `grammar_mistakes` for grammar mistakes: 0.5 points off
* `spelling_mistakes` spelling mistakes: 0.25 points off
* `style_mistakes` style mistakes: 0.25 points off
* `content_mistakes` content mistakes: 0.5 points off

A secondary level takes into account if the assignment was handed in late, and by how many days. The argument `late` is set to `FALSE` by default. When turned to `TRUE`, the number of late days must be inputted in the argument `by`. Late days discount works as follows:

| Days late | Maximum grade possible |
|-----------|------------------------|
| 1-3 days  | 90%                    |
| 4-7 days  | 80%                    |
| 8-14 days | 70%                    |
| > 14 days | 0%                     |

## Output
The function `calculate_grade` returns a description that includes each type of mistake times the weight (the number of points off), and the total grade per type of mistake. It shows the raw grade before any late discounts. Then it shows if the student handed in late (yes/no), and by how many days. Last, it returns the final grade, and provides a space for comments.
In my everyday practice I then copy and paste this output (I know, awful) into the document that the student has handed in, and write any additional comments I may have. I then send this file back to the student as a feedback for their work.
 
## Usage
**Example 1.** A student who got 4 grammar mistakes, 2 spelling mistakes, 0 style mistakes, and 3 content mistakes, handing in on time:
```r
calculate_grade(grammar_mistakes = 4, spelling_mistakes = 2, style_mistakes = 0, content_mistakes = 3, late = FALSE)
[1] "No"
Grading 
 Grammar: 4 * 0.50 = 2 
 Spelling: 2 * 0.25 = 0.5 
 Style: 0 * 0.25 = 0 
 Content: 3 * 0.50 = 1.5 
 Grade: 100 - 4 = 96 
 Late? No 
 By how many days? by 0 day(s) 
 Final grade: 96 
 Comments:
```

**Example 2.** A student who got 9 grammar mistakes, 5 spelling mistakes, 3 style mistakes, and 2 content mistakes, handing in 3 days late:
```r
calculate_grade(grammar_mistakes = 9, spelling_mistakes = 5, style_mistakes = 3, content_mistakes = 2, late = TRUE, by = 3)
[1] "Yes"
Grading 
 Grammar: 9 * 0.50 = 4.5 
 Spelling: 5 * 0.25 = 1.25 
 Style: 3 * 0.25 = 0.75 
 Content: 2 * 0.50 = 1 
 Grade: 100 - 7.5 = 92.5 
 Late? Yes 
 By how many days? by 3 day(s) 
 Final grade: 83.25 
 Comments:
```

**Example 3.** A student who got 2 grammar mistakes, 0 spelling mistakes, 0 style mistakes, and 0 content mistakes, handing in 14 days late:
```r
calculate_grade(grammar_mistakes = 2, spelling_mistakes = 0, style_mistakes = 0, content_mistakes = 0, late = TRUE, by = 14)
[1] "Yes"
Grading 
 Grammar: 2 * 0.50 = 1 
 Spelling: 0 * 0.25 = 0 
 Style: 0 * 0.25 = 0 
 Content: 0 * 0.50 = 0 
 Grade: 100 - 1 = 99 
 Late? Yes 
 By how many days? by 14 day(s) 
 Final grade: 69.3 
 Comments:
 ```

