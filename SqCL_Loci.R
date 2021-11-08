# We want to do some general investigation of the SqCL loci

setwd("~/Google.Drive/ANU/Oz_ARG/SqCL_Optimization")
setwd("C:/Users/ST/Documents/repo/primer_anilios")



# Read in the fasta file of all SqCL loci for the Phyllodactylid Gymnodactylus
sqcl <- read.dna(file="SqCL_Anolis_brasiliensis.fasta", format="fasta")

legacy.genes <- sqcl[names(sqcl)[which(grepl("gene-", names(sqcl)))]]
ahe.genes <- sqcl[names(sqcl)[which(grepl("AHE-", names(sqcl)))]]
uce.loci <- sqcl[names(sqcl)[which(grepl("uce-", names(sqcl)))]]

write.FASTA(legacy.genes, file="SqCLgenes_Anolis_brasiliensis.fasta")
write.FASTA(ahe.genes,    file="SqCLahe_Anolis_brasiliensis.fasta")
write.FASTA(uce.loci,     file="SqCLuce_Anolis_brasiliensis.fasta")


probes <- read.FASTA(file="/Users/ianbrennan/Google.Drive/ANU/Oz_ARG/SqCL_squamate_probes_v2.fasta")

legacy.probes <- probes[names(probes)[which(grepl("genes", names(probes)))]]
ahe.probes <- probes[names(probes)[which(grepl("AHE-", names(probes)))]]
uce.probes <- probes[names(probes)[which(grepl("-uce-", names(probes)))]]

rownames(probes)[[1]]
grepl("-uce-", rownames(probes)[[1]])


# We want to check to make sure that our on-target and off-target loci for qPCR
# are definitely in/out of the SqCL set
# Use 'metablastr' to do a reciprocal blast search between them
library(metablastr)
rbh <- blast_best_reciprocal_hit(
  query = "/Users/ianbrennan/Google.Drive/ANU/Oz_ARG/SqCL_Optimization/Optim_qPCR_Primers.fasta",
  subject = "/Users/ianbrennan/Google.Drive/ANU/Oz_ARG/SqCL_Optimization/SqCL_Gymnodactylus_amarali.fasta",
  output.path = tempdir(),
  db.import = F
)
# should show that MOS, PDC, PRLR, and RAG2 are in the targets, but RAG1, Kif24, and ACM4 are not