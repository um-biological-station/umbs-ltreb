# This script executes an EMLassemblyline workflow.

# Initialize workspace --------------------------------------------------------

# Update EMLassemblyline and load

# remotes::install_github("EDIorg/EMLassemblyline")
library(EMLassemblyline)
# using R version 4.0.1 (2020-06-06)

# Define paths for your metadata templates, data, and EML
path_templates <- "~/Documents/Research/EDI/UMBS_LTREB/metadata/templates"
path_data <- "~/Documents/Research/EDI/UMBS_LTREB/output"
path_eml <- "~/Documents/Research/EDI/UMBS_LTREB/output"
tables <- c("agb.csv", "cwd.csv", "saplings.csv", "soils.csv")

# Create metadata templates ---------------------------------------------------

EMLassemblyline::template_core_metadata(
  path = path_templates,
  license = "CCBY",
  write.file = TRUE)

EMLassemblyline::template_table_attributes(
  path = path_templates,
  data.path = path_data,
  data.table = tables)

# view_unit_dictionary()

EMLassemblyline::template_categorical_variables(
  path = path_templates, 
  data.path = path_data)

# Create taxonomic coverage template (Not-required. Use this to report 
# taxonomic entities in the metadata)

remotes::install_github("EDIorg/taxonomyCleanr")
library(taxonomyCleanr)

taxonomyCleanr::view_taxa_authorities()

EMLassemblyline::template_taxonomic_coverage(
  path = path_templates, 
  data.path = path_data,
  taxa.table = "",
  taxa.col = "",
  taxa.name.type = "",
  taxa.authority = 3)

# Make EML from metadata templates --------------------------------------------

# Once all your metadata templates are complete call this function to create 
# the EML.

E <- "-84.714524"
N <- "45.558794"
S <- "45.558794"
W <- "-84.714524"

Pid <- "edi.243.5"
Sid <- "edi.65.1"

EMLassemblyline::make_eml(
  path = path_templates,
  data.path = path_data,
  eml.path = path_eml, 
  dataset.title = "Forest tree, woody debris, and soil inventory data from long-term research plots for LTREB at the University of Michigan Biological Station", 
  temporal.coverage = c("1934", "2020"), 
  geographic.description = "University of Michigan Biological Station, Douglas Lake, MI", 
  geographic.coordinates = c(N, E, S, W), 
  maintenance.description = "ongoing",
  data.table = tables, 
  data.table.name = c("Aboveground Biomass", 
                      "Coarse Woody Debris", 
                      "Sapling Counts",
                      "Soil Inventory"),
  data.table.description = c("Adult tree measurements and biomass estimates from 1934 to 2019.", 
                             "Measurements and biomass estimates of coarse woody debris longer than 20 centimeters from 2014 and 2020.", 
                             "Saplings counts and biomass estimates from 2014 and 2019.",
                             "Soil makeup and concentration measurements from 2014."),
  other.entity = c("LTREB_README.txt", 
                   "raw.zip", 
                   "notebooks.zip", 
                   "cwd_procedure.pdf", 
                   "soils_procedure.pdf", 
                   "allometric_equations.csv",
                   "UMBS_plots.csv"),
  other.entity.name = c("LTREB README", 
                        "Source Data", 
                        "R Notebooks", 
                        "CWD Procedure", 
                        "Soils Procedure", 
                        "Allometric Equations",
                        "UMBS Plot Information"),
  other.entity.description = c("README file for table structure",
                               "Source data for R scripts",
                               "R notebooks for data formatting and cleaning", 
                               "Course Woody Debris procedures",
                               "Soil inventory procedure",
                               "Allometric equations for tree calculations",
                               "Master list of land plots at University of Michigan Biological Station"),
  user.id = "umbiologicalstat",
  user.domain = "EDI", 
  package.id = Sid)
