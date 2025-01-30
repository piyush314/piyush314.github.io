import os
import shutil
from pathlib import Path

PAPERS_DIR = "/Users/7ps/Dropbox/projects/writing-projects/my_papers"
WEBSITE_DIR = "/Users/7ps/Dropbox/projects/webResumeBlogNews/al-folio"
PDF_DIR = f"{WEBSITE_DIR}/assets/pdf"
PREVIEW_DIR = f"{WEBSITE_DIR}/assets/img/publication_preview"

def organize_pdfs():
    papers_path = Path(PAPERS_DIR)
    
    # Create destination directories if they don't exist
    Path(PDF_DIR).mkdir(parents=True, exist_ok=True)
    Path(PREVIEW_DIR).mkdir(parents=True, exist_ok=True)
    
    # Find and copy PDFs
    for pdf_file in papers_path.rglob("*.pdf"):
        # Skip certain types of PDFs
        if any(x in str(pdf_file) for x in ['draft', 'outline', 'notes']):
            continue
            
        # Create sanitized filename
        project_name = pdf_file.parent.parent.name.lower()
        base_name = pdf_file.stem.lower().replace(' ', '-')
        new_name = f"{project_name}-{base_name}.pdf"
        
        # Copy to assets directory
        destination = Path(PDF_DIR) / new_name
        shutil.copy2(pdf_file, destination)
        print(f"Copied: {pdf_file.name} -> {new_name}")

if __name__ == "__main__":
    organize_pdfs()