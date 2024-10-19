from PyPDF2 import PdfMerger
import os

# Define the path to the folder containing PDFs
folder_path = './singular'

# Get all the PDF filenames in the folder and sort them by name
pdf_files = sorted([file for file in os.listdir(folder_path) if file.endswith('.pdf')])

# Initialize PdfMerger object
merger = PdfMerger()

# Append each PDF to the merger object
for pdf in pdf_files:
    merger.append(os.path.join(folder_path, pdf))

# Define the output file name
output_pdf = 'merged_output.pdf'

# Write the merged PDF to the output file
with open(output_pdf, 'wb') as output_file:
    merger.write(output_file)

# Close the PdfMerger
merger.close()

output_pdf
