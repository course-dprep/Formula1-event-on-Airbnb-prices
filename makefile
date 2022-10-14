all: analysis paper

data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis
	
paper: data-preparation analysis
	make -C src/paper
	

