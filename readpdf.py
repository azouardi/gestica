#! python3
# combinePdfs.py - Combines all the PDFs in the current working directory into
# into a single PDF.
import PyPDF2, os
from pathlib import Path, WindowsPath
# Get all the PDF filenames.
pdfFiles = []
for filename in os.listdir(WindowsPath('C:\\Users\\ouardi\\ownCloud\\02_Work\\04_Manager')):
    if filename.endswith('.pdf'):
        pdfFiles.append(filename)
        pdfFiles.sort(key = str.lower)
        pdfWriter = PyPDF2.PdfFileWriter()
# TODO: Loop through all the PDF files.
# TODO: Loop through all the pages (except the first) and add them.
# TODO: Save the resulting PDF to a file.