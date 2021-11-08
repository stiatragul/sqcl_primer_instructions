# Instructions for making qpcr primers for AusARG project

08/11/2021 

    Message from Ian:

    Okay Putter. What we're gonna need to do so that this exercise is successful is: (1) pull together all the available nuclear data for your blindsnakes, (2) make primers for 2 or 3 loci that are sampled in blindies and are targets in the SqCL locus set, (3) make primers for 2 or 3 loci that are sampled in blindies but are not targets in the SqCL locus set. 

    Choosing 2 or 3 loci that overlap is relatively straightforward (I'm pretty sure BDNF and PRLR are both in the SqCL set), finding the 2 or 3 loci that don't overlap is a bit more involved. What we'll do is use 'metablastr' to blast the loci used in blindies against the SqCL targets and hopefully find some that aren't represented. 

    Once we do all that we'll have 4-6 loci we need to build primers for. We can do that quickly in geneious by aligning the sequences that exist for a given locus and then using the "generate primers" function, but we want to specify that the pcr products (forward primer + amplified region + reverse primer) are <200 bases, ideally 100-150 because we've sonicated our fragments down quite small and we wanna make sure we'll be able to amplify something. 

    Here's a list of the legacy genes that we'll compare names against, and the fasta alignment of all the SqCL loci that we'll blast against.

### Step 1 in GENEIOUS or GenBank...

1. Pull together all the available nuclear data for the _HERPGROUP_ group
1. Search for all available nuclear loci for that particular herp group that you need in GenBank or geneious. 
1. Write this to a fasta file with 

### Step 2 in R or manually...
Figure out which 2 or 3 loci are targets in SqCL and which ones are NOT in SqCL set. Sets are available in (`squamate_AHE_UCE_genes_unique_flipped.fasta`). 

Choosing 2 or 3 loci that overlap is relatively straightforward (BDNF and PRLR are both in the SqCL set), 

Finding the 2 or 3 loci that don't overlap is a bit more involved. 

Use 'metablastr' to blast the loci used in _HERPGROUP_ against the SqCL targets and hopefully find some that aren't represented. 


Step 3 GENEIOUS to design primers
Once we do all that we'll have 4-6 loci we need to build primers for. 
We can do that QUICKLY in geneious by aligning the sequences that exist for a given locus and then 
using the "generate primers" function, but we want to specify that the PCR products (forward primer + amplified region + reverse primer) are <200 bases, 

ideally 100-150 because we've sonicated our fragments down quite small and we wanna make sure we'll be able to amplify something. 

make primers for 2 or 3 loci that are sampled in _HERPGROUP_ and are targets in the SqCL locus set 

make primers for 2 or 3 loci that are sampled in _HERPGROUP_ but are not targets in the SqCL locus set. 

