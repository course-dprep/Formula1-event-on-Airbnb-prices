OUTPUTP = ../../gen/data-preparation/output
OUTPUTA = ../../gen/analysis/output

all: $(OUTPUTP)/filtered_spain.csv $(OUTPUTP)/filtered_australia.csv $(OUTPUTA)/plot_australia.pdf $(OUTPUTA)/plot_spain.pdf $(OUTPUTA)/table.html 


$(OUTPUTA)/plot_australia.pdf $(OUTPUTA)/plot_spain.pdf $(OUTPUTA)/table.html: $(OUTPUTP)/filtered_spain.csv $(OUTPUTP)/filtered_australia.csv plot_all.R
	R --vanilla < plot_all.R


$(OUTPUTA)/plot_australia.pdf: $(OUTPUTP)/filtered_australia.csv plot_australia.R 
	R --vanilla < plot_australia.R


$(OUTPUTA)/plot_spain.pdf: $(OUTPUTP)/filtered_spain.csv plot_spain.R 
	R --vanilla < plot_spain.R

$(OUTPUTA)/table.html: $(OUTPUTP)/filtered_spain.csv $(OUTPUTP)/filtered_australia.csv model_summaries.R 
	R --vanilla < model_summaries.R
	

clean:
	R -e "unlink('*.pdf')"
	R -e "unlink('*.csv')"