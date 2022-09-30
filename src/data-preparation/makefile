DATA = ../../data
TEMP = ../../gen/data-preparation/temp
OUTPUT = ../../gen/data-preparation/output
INPUT = ../../gen/data_preparation/input

all: $(DATA)/all_listings.csv $(DATA)/all_calendar.csv $(TEMP)/merged_airbnb_data.csv $(TEMP)/cleaned_airbnb_data.csv $(OUTPUT)/final_airbnb_dataset.csv
	
$(DATA)/all_listings.csv $(DATA)/all_calendar.csv: download_data.R 
	R --vanilla < download_data.R
	
$(TEMP)/merged_airbnb_data.csv: merge_data.R $(DATA)/all_listings.csv $(DATA)/all_calendar.csv
	R --vanilla < merge_data.R

$(TEMP)/cleaned_airbnb_data.csv: clean_data.R $(TEMP)/merged_airbnb_data.csv
	R --vanilla < clean_data.R

$(OUTPUT)/final_airbnb_dataset.csv: outlier_removal.R $(TEMP)/cleaned_airbnb_data.csv
	R --vanilla < outlier_removal.R

clean:
	R -e "unlink('*.pdf')"
	R -e "unlink('*.csv')"