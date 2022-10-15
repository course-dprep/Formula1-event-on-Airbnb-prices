PREP = ../../gen/data-preparation/output
ANALYSIS = ../../gen/analysis/output

all: $(ANALYSIS)/table.png $(ANALYSIS)/plot_australia.png $(ANALYSIS)/plot_spain.png 

$(ANALYSIS)/table.png: $(PREP)/filtered_spain.csv $(PREP)/filtered_australia.csv model_summaries.R 
	R --vanilla < model_summaries.R

$(ANALYSIS)/plot_australia.png: $(PREP)/filtered_australia.csv plot_australia.R 
	R --vanilla < plot_australia.R

$(ANALYSIS)/plot_spain.png: $(PREP)/filtered_spain.csv plot_spain.R
	R --vanilla < plot_spain.R
	