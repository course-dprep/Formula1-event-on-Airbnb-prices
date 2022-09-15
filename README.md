# Research question

How do Formula 1 race weekends influence the price on Airbnb?

# Motivation 
Formula 1 race weekends causes a lot of fans travelling to the city where the race takes place. Therefore these weekends can cause a busy time for Airbnb hosts because all these fans need a place to stay. This will create a higher demand and thus the hosts of the Airbnb’s can charge a higher price for their listing compared to other weekends when there is no Formula 1 race. This project aims to compare the prices of Airbnb’s in cities where the Formula 1 race will take place and cities where there is no Formula 1 race at the same moment in time. 
The data of the following cities will be used to test the research question:
-	Melbourne will be compared with Sydney on 8-10 of April
-	Barcelona will be compared with Madrid on 20-22 of May
-	Montreal will be compared with Toronto on 17-19 of June


# Structure of the repository

├── README.md
├── data <- This is the place to store raw data 
├── gen 
│   ├── output
│   └── temp
├── makefile
└── src  
    ├── analysis
    │   ├── data_exploration.Rmd
    │   ├── makefile
    │   └── regression_analysis.Rmd
    └── data-preparation
        ├── cleaning.R
        ├── download.R
        ├── install_r_packages.R
        └── makefile




# Example of reproducible research workflow 

This is a basic example repository using Gnu make for a reproducible research workflow, as described in detail here: [tilburgsciencehub.com](http://tilburgsciencehub.com/). 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project.  In this example project, the following is done: 
1. Download and prepare data
2. Run some analysis
3. Present results in a final pdf generated using LaTeX

## Dependencies
- R 
- R packages: `install.packages("stargazer")`
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)


## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!
