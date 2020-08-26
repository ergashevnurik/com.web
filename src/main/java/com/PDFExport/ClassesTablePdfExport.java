package com.PDFExport;

import com.Domain.EdsClasses;
import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.PdfCell;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.IOException;
import java.util.List;

public class ClassesTablePdfExport {

    private List<EdsClasses> edsClasses;

    public ClassesTablePdfExport(List<EdsClasses> edsClasses) {
        this.edsClasses = edsClasses;
    }

    public void writeTableHeader(PdfPTable pdfPTable) {
        PdfPCell pdfCell = new PdfPCell();
        pdfCell.setBackgroundColor(Color.YELLOW);

        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(Color.WHITE);

        pdfCell.setPhrase(new Phrase("ID", font));
        pdfPTable.addCell(pdfCell);

        pdfCell.setPhrase(new Phrase("Title", font));
        pdfPTable.addCell(pdfCell);

        pdfCell.setPhrase(new Phrase("Book Title", font));
        pdfPTable.addCell(pdfCell);

        pdfCell.setPhrase(new Phrase("Due Data", font));
        pdfPTable.addCell(pdfCell);

        pdfCell.setPhrase(new Phrase("Extended Data", font));
        pdfPTable.addCell(pdfCell);

        pdfCell.setPhrase(new Phrase("Submission Method", font));
        pdfPTable.addCell(pdfCell);

        pdfCell.setPhrase(new Phrase("Status", font));
        pdfPTable.addCell(pdfCell);

        pdfCell.setPhrase(new Phrase("Submission Format", font));
        pdfPTable.addCell(pdfCell);

        pdfCell.setPhrase(new Phrase("Description", font));
        pdfPTable.addCell(pdfCell);
    }

    public void writeTableData(PdfPTable pdfPTable) {
        for (EdsClasses edsClasses : edsClasses) {
            pdfPTable.addCell(String.valueOf(edsClasses.getId()));
            pdfPTable.addCell(edsClasses.getTitle());
            pdfPTable.addCell(edsClasses.getBookTitle());
            pdfPTable.addCell(String.valueOf(edsClasses.getDueDate()));
            pdfPTable.addCell(String.valueOf(edsClasses.getExtendedDate()));
            pdfPTable.addCell(edsClasses.getSubmissionMethod());
            pdfPTable.addCell(edsClasses.getStatus());
            pdfPTable.addCell(edsClasses.getSubmissionFormat());
            pdfPTable.addCell(edsClasses.getDescription());
        }
    }

    public void export(HttpServletResponse response) throws IOException, DocumentException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();
        document.add(new Paragraph("Hello"));

        PdfPTable pdfPTable = new PdfPTable(9);
        pdfPTable.setWidthPercentage(100);
        pdfPTable.setSpacingBefore(15);
        pdfPTable.setWidths(new float[] {1.5f, 5f, 5f, 1.5f, 1.5f, 5f, 5f, 5f, 5f});

        writeTableHeader(pdfPTable);
        writeTableData(pdfPTable);
        document.add(pdfPTable);

        document.close();
    }

}
