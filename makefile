all: analysis data-preparation

data_preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis
	
clean:
	R -e "unlink('*.pdf')"
	R -e "unlink('*.csv')"
