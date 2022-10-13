OUTPUTP = ../../gen/paper/output

all: $(OUTPUTP)/manuscript_analysis.pdf

$(OUTPUTP)/manuscript_analysis.pdf: manuscript_analysis.Rmd
	Rscript -e "rmarkdown::render('manuscript_analysis.Rmd')"