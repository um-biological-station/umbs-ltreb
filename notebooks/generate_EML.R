# This script executes an EMLassemblyline workflow.

# Initialize workspace --------------------------------------------------------

# Update EMLassemblyline and load

# remotes::install_github("EDIorg/EMLassemblyline")
library(EMLassemblyline)

# Define paths for your metadata templates, data, and EML
path_templates <- "~/Documents/Research/EDI/UMBS_LTREB/metadata/templates"
path_data <- "~/Documents/Research/EDI/UMBS_LTREB/output"
path_eml <- "~/Documents/Research/EDI/UMBS_LTREB/output"
tables <- c("soils_2014.csv")

# Create metadata templates ---------------------------------------------------

EMLassemblyline::template_core_metadata(
  path = path_templates,
  license = "CCBY",
  write.file = TRUE)

EMLassemblyline::template_table_attributes(
  path = path_templates,
  data.path = path_data,
  data.table = tables)

view_unit_dictionary()

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
  dataset.title = "", 
  temporal.coverage = c("start", "end"), 
  geographic.description = "University of Michigan Biological Station, Douglas Lake, MI", 
  geographic.coordinates = c(N, E, S, W), 
  maintenance.description = "complete",
  data.table = tables, 
  data.table.name = c("", ""),
  data.table.description = c("These soils were sampled and characterized as part of a long-term project quantifying ecosystem carbon stocks and their controls across forest succession.",),
  other.entity = c("", "src.zip"),
  other.entity.name = c("R script for data formatting and cleaning", "Source data for R script"),
  other.entity.description = c("R script for data formatting and cleaning", "Source data for R script"),
  user.id = "apawlik",
  user.domain = "EDI", 
  package.id = Sid)
