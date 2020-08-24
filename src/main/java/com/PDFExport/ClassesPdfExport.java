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

public class ClassesPdfExport {
    private List<EdsClasses> listClasses;

    public ClassesPdfExport(List<EdsClasses> listClasses) {
        this.listClasses = listClasses;
    }

    public void writeTableHeader(PdfPTable pdfPTable) {
        PdfPCell pdfCell = new PdfPCell();
        pdfCell.setBackgroundColor(Color.BLACK);
        pdfCell.setPadding(5);

        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(Color.WHITE);
        pdfCell.setPhrase(new Phrase("ID", font));
        pdfPTable.addCell(pdfCell);

        pdfCell.setPhrase(new Phrase("Title", font));
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

    }

    public void writeTableData(PdfPTable pdfPTable) {
        for (EdsClasses edsClasses : listClasses) {
            pdfPTable.addCell(String.valueOf(edsClasses.getId()));
            pdfPTable.addCell(edsClasses.getTitle());
            pdfPTable.addCell(String.valueOf(edsClasses.getDueDate()));
            pdfPTable.addCell(String.valueOf(edsClasses.getExtendedDate()));
            pdfPTable.addCell(edsClasses.getSubmissionMethod());
            pdfPTable.addCell(edsClasses.getStatus());
            pdfPTable.addCell(edsClasses.getSubmissionFormat());
        }
    }

    public void export(HttpServletResponse response) throws IOException, DocumentException {
        Document document = new Document(PageSize.A4);

        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(Color.BLACK);
        font.setSize(18);
        Paragraph paragraph = new Paragraph("List of all Classes", font);
        paragraph.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(paragraph);

        PdfPTable pdfPTable = new PdfPTable(7);
        pdfPTable.setWidths(new float[] {1.5f, 3.5f, 4.5f, 4.5f, 4.5f, 4.5f, 4.5f});
        pdfPTable.setWidthPercentage(100);
        pdfPTable.setSpacingBefore(15);

        writeTableHeader(pdfPTable);
        writeTableData(pdfPTable);
        document.add(pdfPTable);

        document.close();

    }

}
