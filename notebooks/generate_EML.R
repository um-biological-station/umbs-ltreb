# This script executes an EMLassemblyline workflow.

# Initialize workspace --------------------------------------------------------

# Update EMLassemblyline and load

# remotes::install_github("EDIorg/EMLassemblyline")
library(EMLassemblyline)

# Define paths for your metadata templates, data, and EML
path_templates <- "~/Documents/Research/EDI/UMBS_LTREB/metadata/templates"
path_data <- "~/Documents/Research/EDI/UMBS_LTREB/output"
path_eml <- "~/Documents/Research/EDI/UMBS_LTREB/output"
tables <- c("soils.csv", "agb.csv", "cwd.csv", "saplings.csv")

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

E <- "-84.557386634988"
N <- "45.580163500439"
S <- "45.47272902377"
W <- "-84.777685409063"

Pid <- "edi."
Sid <- "edi."

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
  data.table.name = c("Soil Inventory", 
                      "Aboveground Biomass", 
                      "Course Woody Debris", 
                      "Sapling Counts"),
  data.table.description = c(),
  other.entity = c("LTREB_README.txt", 
                   "src.zip", 
                   "notebooks.zip", 
                   "cwd_procedure.pdf", 
                   "soils_procedure.pdf", 
                   "allometric_equations.csv",
                   "plots"),
  other.entity.name = c("LTREB README", 
                        "src.zip", 
                        "notebooks.zip", 
                        "CWD Procedure", 
                        "Soils Procedure", 
                        "Allometric Equations",
                        "Plots"),
  other.entity.description = c("README file for table structure",
                               "Source data for R scripts",
                               "R notebooks for data formatting and cleaning", 
                               "Course Woody Debris procedures",
                               "Soil inventory procedure",
                               "Allometric equations for tree calculations",
                               "Master list of land plots at University of Michigan Biological Station"),
  user.id = "apawlik",
  user.domain = "EDI", 
  package.id = Sid)
