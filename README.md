# How the popularity of F1 influences the prices of Airbnb listings in different cities
![image](https://user-images.githubusercontent.com/109277196/194825057-e42f7bf1-74fb-40be-ab0a-332552b59e9a.png)


# Project description
Formula 1 is becoming a more popular sport every year, with weekend attendaces of hundreds of thousands of visitors in many cities around the world, with a record of around 420,00 visitors in Melbourne, Australia(ESPN, 2022). Many of those visitors are from all over the world and are in need of an accommadation for the weekend. Hotels are quickly booked up for the weekend, so the F1 fans are looking for other options. Airbnb listings are an afforable option and it feels a lot like home, with among others, kitchens and livingrooms.

We were, however, curious if the prices were significanlty higher in those weekends compared to other weekends in the same city. Hotels change their prices a lot in the peak season, so it would make sense Airbnb listers to the same thing. That's why we are conducting a research on the price infleunces of a Formula 1 event on Airbnb listings. We attempt to answer the following research question:

**"To what extent does the presence of a Formula 1 race weekend influence the prices of Airbnb listings in the respective city?"**

# Analysis
This project aims to compare the prices of Airbnb’s in cities where the Formula 1 race will take place and cities where there is no Formula 1 race (in the same country and around the same size) at the same moment in time. This way we can check if the prices are not influenced by other factors, like it is just a busier weekend. 
The data of the following cities will be used to test the research question:
-	Melbourne (F1 race) will be compared with Sydney (No F1 race) on 8-10 of April
-	Barcelona (F1 race) will be compared with Madrid (No F1 Race) on 20-22 of May
We wil also consider the influence of time in the analysis by looking at the week prior to the respective race weekend. 

### Type of analysis
The type of analysis that is used in this paper is a quasi-experiment with the difference in differences method. With this method, one can check if a treatment (in the case of this paper, a Formula 1 event) has effect on an outcome (in the case of this paper the mean Airbnb price) by comparing the average change over time in the outcome variable for the treatment group to the average change over time for the control group. 

## Analysis results
With the obtained data, explored and prepared by our team,  we came to the following findings and conclusions:

- 
-
-
## Conclusion analysis
The results of the analyses performed only confirms the hypothesis in the case of the Formula 1 event that was held in Australia. In that case, the mean Airbnb price of the city where the event was held (Melbourne) was higher than the city (Sydney) where no event was held. The dataset of Spain showed opposite results. The mean price Airbnb of the city where no event was held (Madrid), was higher than the city where the event was held (Barcelona). This went in against the hypothesis.

# Structure of the repository
```
├── README.md
├── data
├── gen
│   ├── analysis
│   ├── data-preparation
│   └── paper
└── src
   ├── analysis
   ├── data-preparation
   └── paper
```

# Example of reproducible research workflow 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project. In this example project, the following is done: 
1. Download and prepare data from insideairbnb.com (Calender and listings data from Barcelona, Madrid, Melbounre and Sydney)
2. Run some analysis on the cleaned and filtered data (filtered on date, removed unnecessary columns and merged all the datasets into two final datasets)
3. Analyse the results (see if the prices are influenced by the F1 events that took place in Barcelona and Melbourne.

# Dependencies
- R 
   - R Markdown, R script
   - R packages: Tidyverse, Dplyr, Readr
- Gnu Make
   - Makefile
- Git Bash
- GitHub

## How to run the project
To run the entire project, type "make" in the command prompt and run. type make -n beforehand to check what changes will be made.

Sidenotes: 
- make has to be installed in order for it to work.
- It can take some time fo the whole project to run.

## Sources
- Insideairbnb
- ESPN (https://www.espn.com/f1/story/_/id/33710400/australian-grand-prix-sets-new-formula-one-melbourne-sporting-attendance-records)

## Notes
- `make clean` removes all unncessary temporary files (.csv, .pdf).  
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 

## Authors
This repository is produced for the course Data Preperation and Workflow Management taught by Hannes Datta, at the Tilburg School of Economics and Management, as part of the Master's program Marketing Analytics. The repository is collabarted on by team 15, consisting of:
- Bjorn Lauwers
- Luc van Bree
- Sam Villevoye
- Sjoerd van Bijl
