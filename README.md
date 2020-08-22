View the GitHub repo for this dataset at https://github.com/alexandriapawlik/umbs-ltreb

# UMBS LTREB Data Tables

### 1. Above Ground Biomass Estimates

	A. Methods: see methods metadata  
	B. Temporal coverage: 1934 to 2019  
	C. Raw data:   
		1. AGB_2014_clean.csv: cleaned by Alina Drebin in 2018 as part of package edi.243.2, however only incomplete data cleaning information was found as of 2020  
		2. AGB_2019_raw.csv: raw 2019 measurements and calculations from Luke Nave  
	D. Data cleaning:   
		1. LTREB_AGB_2019_cleaning.Rmd: cleaned by Alexandria Pawlik  
	E. Output: agb.csv  
	F. Other related files:  
		1. UMBS_plots.csv: information about all observed UMBS plots  

### 2. Course Woody Debris Measurements

	A. Methods: cwd_procedure.pdf  
	B. Temporal coverage: 2014 to 2019  
	C. Raw data:  
		1. CWD_2014_raw.csv: raw 2014 measurements and calculations from Luke Nave  
		2. CWD_2020_raw.csv: raw 2019 measurements and calculations from Luke Nave in 2020  
	D. Data cleaning:  
		1. LTREB_CWD_cleaning.Rmd: 2014 data cleaning by Alina Drebin in 2018 as part of package edi.243.2, otherwise cleaned by Alexandria Pawlik
	E. Output: cwd.csv
	F. Other related files:
		1. UMBS_plots.csv: information about all observed UMBS plots
		
### 3. Sapling Counts

	A. Methods: see methods metadata
	B. Temporal coverage: 2014 to 2019
	C. Raw data:
		1. saplings_2014_raw.csv: raw 2014 measurements and calculations from Luke Nave
		2. saplings_2019_raw.csv: raw 2019 measurements from Luke Nave
		3. saplings_biomass.csv: calculated values for 2019 data, from Luke Nave in 2020
	D. Data cleaning:
		LTREB_saplings_cleaning.csv: 2014 data cleaning by Alina Drebin in 2018 as part of package edi.243.2, otherwise cleaned by Alexandria Pawlik
	E. Output: saplings.csv
	F. Other related files:
		1. UMBS_plots.csv: information about all observed UMBS plots

### 4. Soil Makeup

	A. Methods: soils_procedure.pdf
	B. Temporal coverage: 2014 (samples collected in 2014, measured over the following year)
	C. Raw data:
		1. soils_2014_from_Mfield.csv: raw 2014 measurements from Mfield data upload
	D. Data cleaning:
		1. LTREB_soils_cleaning.Rmd: 2014 data cleaning by Alina Drebin in 2018 as part of package edi.243.2, otherwise cleaned by Alexandria Pawlik
	E. Output: soils.csv
	F. Other related files:
		1. UMBS_plots.csv: information about all observed UMBS plots
