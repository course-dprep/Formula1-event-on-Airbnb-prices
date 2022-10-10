# How the popularity of F1 influences the prices of Airbnb listings in different cities
![image](https://user-images.githubusercontent.com/109277196/194825057-e42f7bf1-74fb-40be-ab0a-332552b59e9a.png)


# Project description
Formula 1 is becoming a more popular sport every year, with weekend attendaces of more than 300,000 visitors in many cities around the world (SOURCE?). Many of those visitors are from all over the world and are in need of an accommadation for the weekend. Hotels are quickly booked up for the weekend, so the F1 fans are looking for other options. Airbnb listings are an afforable option and it feels a lot like home, with among others, kitchens and livingrooms.

We were, however, curious if the prices were significanlty higher in those weekends compared to other weekends in the same city. Hotels change their prices a lot in the peak season(SOURCE?), so it would make sense Airbnb listers to the same thing. That's why we are conducting a research on the price infleunces of a Formula 1 event on Airbnb listings. We attempt to answer the following research question:

**"To what extent does the presence of a Formula 1 race weekend influence the prices of Airbnb listings in the respective city?"**

# Analysis
This project aims to compare the prices of Airbnb’s in cities where the Formula 1 race will take place and cities where there is no Formula 1 race (in the same country and around the same size) at the same moment in time. This way we can check if the prices are not influenced by other factors, like it is just a busier weekend. 
The data of the following cities will be used to test the research question:
-	Melbourne (F1 race) will be compared with Sydney (No F1 race) on 8-10 of April
-	Barcelona (F1 race) will be compared with Madrid (No F1 Race) on 20-22 of May
We wil also consider the influence of time in the analysis by looking at the ... previous weekends and the ... weekends after the race weekend. 

## Analysis results
With the obtained data, explored and prepared by our team,  we came to the following findings and conclusions:

- 


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
