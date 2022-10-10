DATA = ../../data
TEMP = ../../gen/data-preparation/temp
OUTPUT = ../../gen/data-preparation/output
INPUT = ../../gen/data_preparation/input

all: $(OUTPUT)/filtered_spain.csv $(OUTPUT)/filtered_australia.csv

$(DATA)/listings_melbourne.csv $(DATA)/listings_sydney.csv $(DATA)/listings_barcelona.csv	$(DATA)/listings_madrid.csv $(DATA)/calendar_melbourne.csv $(DATA)/calendar_sydney.csv $(DATA)/calendar_barcelona.csv $(DATA)/calendar_madrid.csv: download_data.R
	R --vanilla < download_data.R

$(TEMP)/cleaned_list_mel.csv $(TEMP)/cleaned_list_syd.csv $(TEMP)/cleaned_list_bar.csv $(TEMP)/cleaned_list_mad.csv $(TEMP)/cleaned_cal_mel.csv $(TEMP)/cleaned_cal_syd.csv $(TEMP)/cleaned_cal_bar.csv $(TEMP)/cleaned_cal_mad.csv:data_without_dropped_columns.R $(DATA)/listings_melbourne.csv $(DATA)/listings_sydney.csv $(DATA)/listings_barcelona.csv	$(DATA)/listings_madrid.csv $(DATA)/calendar_melbourne.csv $(DATA)/calendar_sydney.csv $(DATA)/calendar_barcelona.csv $(DATA)/calendar_madrid.csv
	R --vanilla < data_without_dropped_columns.R
	
$(TEMP)/all_calendar.csv $(TEMP)/all_listings.csv: merge_all_calendar_and_all_listings.R $(TEMP)/cleaned_list_mel.csv $(TEMP)/cleaned_list_syd.csv $(TEMP)/cleaned_list_bar.csv $(TEMP)/cleaned_list_mad.csv $(TEMP)/cleaned_cal_mel.csv $(TEMP)/cleaned_cal_syd.csv $(TEMP)/cleaned_cal_bar.csv $(TEMP)/cleaned_cal_mad.csv
	R --vanilla < merge_all_calendar_and_all_listings.R
	
$(TEMP)/merged_airbnb_data.csv: merge_data.R $(TEMP)/all_listings.csv $(TEMP)/all_calendar.csv
	R --vanilla < merge_data.R

$(TEMP)/cleaned_airbnb_data.csv: clean_data.R $(TEMP)/merged_airbnb_data.csv
	R --vanilla < clean_data.R

$(OUTPUT)/final_airbnb_dataset.csv: outlier_removal.R $(TEMP)/cleaned_airbnb_data.csv
	R --vanilla < outlier_removal.R
	
$(OUTPUT)/filtered_spain.csv $(OUTPUT)/filtered_australia.csv: final_prep_analysis.R $(OUTPUT)/final_airbnb_dataset.csv 
	R --vanilla < final_prep_analysis.R


clean:
	R -e "unlink('*.pdf')"
	R -e "unlink('*.csv')"