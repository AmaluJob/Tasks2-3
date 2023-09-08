#Change Directory
cd /c/Users/Ashis/OneDrive/Desktop/Tasks\ \(2\)

#!/bin/bash

#Download the Protein FASTA File
wget https://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__MG1655_uid57779/NC_000913.faa

#Decompress the FASTA File
zcat NC_000913.faa.gz > NC_000913.faa

#Count the Number of Protein Sequences
num_sequences=$(grep -c "^>" NC_000913.faa)

#Calculate the Total Length of Proteins
total_length=$(grep -v "^>" NC_000913.faa | tr -d '\n' | wc -m)

#Calculate the Average Length
average_length=$(echo "scale=2; $total_length / $num_sequences" | bc)

#Print the Average Length
echo "Average Protein Length: $average_length"


