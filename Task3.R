-------------------------------------------------------------------
#Load the necessary libraries
library(ggplot2)
library(readr)

#Read the data from the specified file path
gene_info <- read_delim("C:/Users/Ashis/OneDrive/Desktop/Tasks (2)/Homo_sapiens.gene_info.gz", delim = "\t")

#Filter out rows where the chromosome value contains a "|"
gene_info <- gene_info %>%
  filter(!grepl("\\|", chromosome))

#Filter out ambiguous chromosomes and group by chromosome
gene_counts <- gene_info %>%
  filter(!is.na(chromosome) & chromosome != "Un") %>%
  group_by(chromosome) %>%
  summarise(gene_count = n())

#Create the plot
ggplot(gene_counts, aes(x = chromosome, y = gene_count)) +
  geom_bar(stat = "identity", fill = "#333333") +
  labs(
    title = "Number of genes in each chromosome",
    x = "Chromosomes",
    y = "Gene count"
  ) +
  theme_minimal() +
  scale_x_discrete(labels = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                              "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                              "21", "22", "X", "Y", "MT")) +
  scale_y_continuous(breaks = seq(0, 16000, by = 5000)) +
  theme(axis.text.x = element_text(angle = 0, hjust = 1, vjust = 0.5),
plot.title = element_text(hjust = 0.5) )

#Save the plot to a PDF file in the same location as the data file
ggsave("C:/Users/Ashis/OneDrive/Desktop/Tasks (2)/gene_counts_per_chromosome.pdf", width = 10, height = 6)
