# Tidy Data Presentation Outline

## Goals for Presentation

  - Inform others about tidy data philosophy
      + remember to mention Codd's 3rd normal form
  - Introduce some common terminology for describing datasets in a data science setting
  - Compare tidy and untidy data formats and why they're tidy or untidy
      + the 5 common types of untidiness
  - Give real-world examples of untidy data sets and how to get them to be tidy
      + Borrow largely from the Wickham paper, but could also try and incorporate a WFAA example
  - Explain why it matters
      + This isn't just about getting data so data scientists can work with it in R, it's also applicable to tools like Tableau and excel

## Presentation Format

  - Can't be a powerpoint because I'll need to incorporate code (minimal amount) and data tables (lots)
  - Let's use some type of RMarkdown presentation
      + good practice, because I don't make a lot of presentations in RMarkdown

## Outline

- Introduction
    + What is being discussed today?
        * Show the presentation outline and manage expectations for the length of the presentation
    + What will you learn?
    + What is this based off of?
- Idea (the theory)
    + What is tidy data and why is it important?
        * The three mandates of tidy data
    + How does data "become" untidy?
    + How do we get data to become tidy?
    + How does analysis depend on the form of the data set?
- Execution (the practice)
    + Five common types of untidy data and how to get them tidy again
        * After going through a few, could be an opportunity for audience participation
        * Live coding?
    + Displaying tidy data
- Tips for getting there
    + __OPTIONAL__: A slight aside - data organization in spreadsheets
        * Be consistent
            - codes for categorical variables
            - missing values
            - variable names
            - subject identifiers
            - data layout across multiple files
            - file names
            - date format
            - phrases in notes/data dictionary
        * write dates like YYYY-MM-DD
        * do not leave any cells empty
        * put just one thing in a cell
        * organize the data as a single rectangle (with subjects as rows and variables as columns, and with a single header row, i.e. tidy)
        * create a data dictionary
        * do not include calculations in the raw data files
        * do not use font color or highlighting as data
        * choose good names for things
        * make backups
        * use data validation to avoid data entry errors
        * save the data in plain text files
    + Get comfortable with the language of tidy data
        * Recall the three mandates, are there synonyms/do you refer to the same thing by different names?
    + Begin by asking yourself two questions
        * What is the data?
        * What am I trying to do with the data?
    + Then ask yourself if the data is in accordance with the three mandates.
- Conclusion
    + X most important things to remember (list of 5 or so items)
    + Other resources

## Misc. Notes

Resources

  - [_The_ tidy data paper](http://vita.had.co.nz/papers/tidy-data.html)
  - [Informal version of tidy data paper](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html)
  - [Practical introduction to tidy data](http://r4ds.had.co.nz/tidy-data.html)
  - [Tidy data presentation](http://stat405.had.co.nz/lectures/18-tidy-data.pdf)
  - [Database Normalization](https://www.essentialsql.com/get-ready-to-learn-sql-database-normalization-explained-in-simple-english/)
  - [Codd's 3rd Normal Form](https://en.wikipedia.org/wiki/Third_normal_form)
  - [Tidy data analysis (an extension of the tidy data paradigm)](https://simplystatistics.org/2017/05/24/toward-tidy-analysis/)
  - [Data Organization in Spreadsheets](https://www.tandfonline.com/doi/full/10.1080/00031305.2017.1375989)
  - [Tidy Data in Python](http://www.jeannicholashould.com/tidy-data-in-python.html)
