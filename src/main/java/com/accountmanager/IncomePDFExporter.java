package com.accountmanager;

import java.awt.Color;
import java.io.IOException;
import java.util.List;
import com.accountmanager.entities.Income;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

import jakarta.servlet.http.HttpServletResponse;

public class IncomePDFExporter {

	private List<Income> listIncomes;
    
    public IncomePDFExporter(List<Income> listIncomes) {
        this.listIncomes = listIncomes;
    }
 
    private void writeTableHeader(PdfPTable table) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.DARK_GRAY);
        cell.setPadding(6);
         
        Font font = FontFactory.getFont(FontFactory.TIMES_BOLD);
        font.setColor(Color.WHITE);
         
        cell.setPhrase(new Phrase("Income ID", font));
         
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Amount", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Date", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Name", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Mode", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("Transaction Id", font));
        table.addCell(cell);
        
      
    }
     
    private void writeTableData(PdfPTable table) {
        for (Income inc : listIncomes) {
            table.addCell(String.valueOf(inc.getId()));
            table.addCell(String.valueOf(inc.getAmount()));
            table.addCell(String.valueOf(inc.getDate()));
            table.addCell(inc.getName());
            table.addCell(inc.getMode());
            table.addCell(inc.getTransactionId());
        }
        
        Double totalAmount = listIncomes.stream().mapToDouble(Income::getAmount).sum();

     // Add a row for the total amount
     PdfPCell cell = new PdfPCell(new Phrase("Total Amount"));
     cell.setColspan(5);
     cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
     table.addCell(cell);
     table.addCell(new PdfPCell(new Phrase(String.valueOf(totalAmount))));
    }
     
    public void export(HttpServletResponse response) throws DocumentException, IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());
         
        document.open();
        Font font = FontFactory.getFont(FontFactory.TIMES_BOLD);
        font.setSize(18);
        font.setColor(Color.BLACK);
         
        Paragraph p = new Paragraph("List of Incomes", font);
        p.setAlignment(Paragraph.ALIGN_CENTER);
         
        document.add(p);
         
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100f);
        table.setWidths(new float[] {3.5f, 3.5f, 3.0f, 3.0f, 3.0f, 3.5f});
        table.setSpacingBefore(10);
         
        writeTableHeader(table);
        writeTableData(table);
         
        document.add(table);
         
        document.close();
         
    }
	
}
