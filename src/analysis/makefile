PREP = ../../gen/data-preparation/output
ANALYSIS = ../../gen/analysis/output

all: $(ANALYSIS)/table.html $(ANALYSIS)/plot_australia.pdf $(ANALYSIS)/plot_spain.pdf  

$(ANALYSIS)/table.html: $(PREP)/filtered_spain.csv $(PREP)/filtered_australia.csv model_summaries.R 
	R --vanilla < model_summaries.R

$(ANALYSIS)/plot_australia.pdf: $(PREP)/filtered_australia.csv plot_australia.R 
	R --vanilla < plot_australia.R

$(ANALYSIS)/plot_spain.pdf: $(PREP)/filtered_spain.csv plot_spain.R
	R --vanilla < plot_spain.R
	