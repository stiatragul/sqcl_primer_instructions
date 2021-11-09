# Okay Putter. What we're gonna need to do so that this exercise is successful is:

# Step 1 # in GENEIOUS or GenBank...
# (1) pull together all the available nuclear data for the _HERPGROUP_ group
### Can do this with GenBank or geneious by searching *Anilios*


#Step 2 in R or manually...
# Figure out which 2 or 3 loci are targets in and NOT in SqCL set (squamate_AHE_UCE_genes_unique_flipped.fasta)
# Choosing 2 or 3 loci that overlap is relatively straightforward (BDNF and PRLR are both in the SqCL set), 
# Finding the 2 or 3 loci that don't overlap is a bit more involved. 
# Use 'metablastr' to blast the loci used in _HERPGROUP_ against the SqCL targets and hopefully find some that aren't represented. 


# Step 3 GENEIOUS to design primers
# Once we do all that we'll have 4-6 loci we need to build primers for. 
# We can do that QUICKLY in geneious by aligning the sequences that exist for a given locus and then 
# using the "generate primers" function, but we want to specify that the PCR products (forward primer + amplified region + reverse primer) are <200 bases, 
# ideally 100-150 because we've sonicated our fragments down quite small and we wanna make sure we'll be able to amplify something. 
# make primers for 2 or 3 loci that are sampled in _HERPGROUP_ and are targets in the SqCL locus set 
# make primers for 2 or 3 loci that are sampled in _HERPGROUP_ but are not targets in the SqCL locus set. 


# We want to do some general investigation of the SqCL loci

setwd("C:/Users/ST/Documents/repo/primer_anilios")

# Read in the fasta file of all SqCL loci for the Phyllodactylid Gymnodactylus
sqcl <- read.dna(file="SqCL_Anolis_brasiliensis.fasta", format="fasta")

legacy.genes <- sqcl[names(sqcl)[which(grepl("gene-", names(sqcl)))]]
ahe.genes <- sqcl[names(sqcl)[which(grepl("AHE-", names(sqcl)))]]
uce.loci <- sqcl[names(sqcl)[which(grepl("uce-", names(sqcl)))]]

## Install metablastr
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

BiocManager::install(c("Biostrings", "GenomicFeatures", "GenomicRanges", "Rsamtools", "IRanges", "rtracklayer", "biomaRt"))
# install.packages("devtools")
# install the current version of metablastr on your system
devtools::install_github("HajkD/metablastr", build_vignettes = TRUE, dependencies = TRUE)


library(metablastr)
blast_test <- blast_best_reciprocal_hit(
  query = "anilios_qpcr_primers.fasta",
  subject = "squamate_AHE_UCE_genes_unique_flipped.fasta",
  output.path = tempdir(),
  db.import = F
)

blast_test |> View()

# should show that MOS, PDC, PRLR, and RAG2 are in the targets, but RAG1, Kif24, and ACM4 are not
