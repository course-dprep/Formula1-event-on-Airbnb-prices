PREP = ../../gen/data-preparation/output
ANALYSIS = ../../gen/analysis/output

all: $(ANALYSIS)/plot_australia.pdf $(ANALYSIS)/plot_spain.pdf $(ANALYSIS)/table.html 


$(ANALYSIS)/plot_australia.pdf $(ANALYSIS)/plot_spain.pdf $(ANALYSIS)/table.html: $(PREP)/filtered_spain.csv $(PREP)/filtered_australia.csv plot_all.R
	R --vanilla < plot_all.R


$(ANALYSIS)/plot_australia.pdf: $(PREP)/filtered_australia.csv plot_australia.R 
	R --vanilla < plot_australia.R


$(ANALYSIS)/plot_spain.pdf: $(PREP)/filtered_spain.csv plot_spain.R 
	R --vanilla < plot_spain.R

$(ANALYSIS)/table.html: $(PREP)/filtered_spain.csv $(PREP)/filtered_australia.csv model_summaries.R 
	R --vanilla < model_summaries.R
	
	

clean:
	R -e "unlink('*.pdf')"
	R -e "unlink('*.csv')"