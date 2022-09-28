boxplot.pdf: plot.R all_listings.csv all_calendar.csv merged_airbnb_data.csv cleaned_airbnb_data.csv final_airbnb_dataset.csv
	R --vanilla < plot.R

all_listings.csv all_calendar.csv: download_data.R 
	R --vanilla < download_data.R
	
merged_airbnb_data.csv: merge_data.R all_listings.csv all_calendar.csv
	R --vanilla < merge_data.R

cleaned_airbnb_data.csv: clean_data.R merged_airbnb_data.csv
	R --vanilla < clean_data.R

final_airbnb_dataset.csv: outlier_removal.R cleaned_airbnb_data.csv
	R --vanilla < outlier_removal.R

clean:
	R -e "unlink('*.pdf')"
	R -e "unlink('*.csv')"