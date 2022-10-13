OUTPUTP = ../../gen/paper/output

all: exploration.pdf manuscript_analysis.pdf $(OUTPUTP)/exploration.pdf $(OUTPUTP)/manuscript_analysis.pdf 

$(OUTPUTP)/exploration.pdf: manuscript_analysis.Rmd
	R --vanilla < move_files_exploration.R

$(OUTPUTP)/manuscript_analysis.pdf: manuscript_analysis.Rmd
	R --vanilla < move_files_manuscript_analysis.R
	
manuscript_analysis.pdf: manuscript_analysis.Rmd
	R --vanilla < execute_manuscript_files.R

exploration.pdf: exploration.Rmd 
	R --vanilla < execute_exploration_files.R



