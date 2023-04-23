package com.roytuts.pdf.report.generation.rest.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.roytuts.pdf.report.generation.entity.Product;
import com.roytuts.pdf.report.generation.repository.ProductRepository;
import com.thoughtworks.xstream.converters.time.LocalDateConverter;

@RestController
@CrossOrigin
public class ProductRestController {

	@Autowired
	private ProductRepository repository;
	
	@GetMapping("/getSalesByCategory")
	public List<Map<String, Object>> getSalesByCategory(){
		return this.repository.getSalesByCategory();
	}

	@GetMapping(value = "/saleDate/{updatedAt}")
	public ResponseEntity<Resource> findSalesReport(@PathVariable("updatedAt") String updatedAt)
			throws IOException, DocumentException {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate updated_at = LocalDate.parse(updatedAt, formatter);
		List<Map<String, Object>> products = repository.getProductsAtThisParticularDate(updated_at);
		Document document = new Document(PageSize.A4, 25, 25, 25, 25);

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		PdfWriter.getInstance(document, os);

		document.open();

		Paragraph title = new Paragraph("Sales on "+updatedAt,
				FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, new BaseColor(0, 255, 255)));

		document.add(title);

		PdfPTable table = new PdfPTable(5);
		table.setSpacingBefore(25);
		table.setSpacingAfter(25);

		PdfPCell c1 = new PdfPCell(new Phrase("Id"));
		table.addCell(c1);

		PdfPCell c2 = new PdfPCell(new Phrase("Name"));
		table.addCell(c2);

//		PdfPCell c3 = new PdfPCell(new Phrase("Product Added on date"));
//		table.addCell(c3);

		PdfPCell c3 = new PdfPCell(new Phrase("On"));
		table.addCell(c3);

		PdfPCell c4 = new PdfPCell(new Phrase("Price"));
		table.addCell(c4);

		PdfPCell c5 = new PdfPCell(new Phrase("Sales"));
		table.addCell(c5);

		for (Map<String, Object> product : products) {
			table.addCell(String.valueOf(product.get("id")));
			table.addCell(String.valueOf(product.get("name")));
//			table.addCell(String.valueOf(product.getCreated_at()));
			table.addCell(String.valueOf(updated_at));
			table.addCell(String.valueOf(product.get("price")));
			table.addCell(String.valueOf(product.get("total_sales")));

		}

		document.add(table);

		document.close();

		ByteArrayInputStream is = new ByteArrayInputStream(os.toByteArray());

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType("application/pdf"));
		headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
		headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=SalesOnParticularDay.pdf");

		ResponseEntity<Resource> response = new ResponseEntity<Resource>(new InputStreamResource(is), headers,
				HttpStatus.OK);

		return response;

	}
	@GetMapping(value = "/salesTill/{updatedAt}")
	public ResponseEntity<Resource> salesTill(@PathVariable("updatedAt") String updatedAt)
			throws IOException, DocumentException {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate updated_at = LocalDate.parse(updatedAt, formatter);
		List<Map<String, Object>> products = repository.downloadTillThisDate(updated_at);
		Document document = new Document(PageSize.A4, 25, 25, 25, 25);

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		PdfWriter.getInstance(document, os);

		document.open();

		Paragraph title = new Paragraph("Sales Till "+updatedAt,
				FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, new BaseColor(0, 255, 255)));

		document.add(title);

		PdfPTable table = new PdfPTable(6);
		table.setSpacingBefore(25);
		table.setSpacingAfter(25);

		PdfPCell c1 = new PdfPCell(new Phrase("Id"));
		table.addCell(c1);

		PdfPCell c2 = new PdfPCell(new Phrase("Name"));
		table.addCell(c2);

		PdfPCell c3 = new PdfPCell(new Phrase("From"));
		table.addCell(c3);

		PdfPCell c4 = new PdfPCell(new Phrase("Till"));
		table.addCell(c4);

		PdfPCell c5 = new PdfPCell(new Phrase("Product Price"));
		table.addCell(c5);

		PdfPCell c6 = new PdfPCell(new Phrase("Sales Count"));
		table.addCell(c6);

		for (Map<String, Object> product : products) {
			LocalDate createdAt= LocalDate.parse(String.valueOf(product.get("created_at")).subSequence(0, 10), formatter);
			table.addCell(String.valueOf(product.get("id")));
			table.addCell(String.valueOf(product.get("name")));
			table.addCell(String.valueOf(createdAt));
			table.addCell(String.valueOf(updated_at));
			table.addCell(String.valueOf(product.get("price")));
			table.addCell(String.valueOf(product.get("total_sales")));

		}

		document.add(table);

		document.close();

		ByteArrayInputStream is = new ByteArrayInputStream(os.toByteArray());

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType("application/pdf"));
		headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
		headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=SalesTillDate.pdf");

		ResponseEntity<Resource> response = new ResponseEntity<Resource>(new InputStreamResource(is), headers,
				HttpStatus.OK);

		return response;

	}
	@GetMapping(value = "salesFromTill/{from}/{till}")
	public ResponseEntity<Resource> salesFromTill(@PathVariable("from") String from ,@PathVariable("till") String till)
			throws IOException, DocumentException {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate From = LocalDate.parse(from, formatter);
		LocalDate Till=LocalDate.parse(till,formatter);
		List<Map<String, Object>> products = repository.fromTillThisDate(From,Till);
		Document document = new Document(PageSize.A4, 25, 25, 25, 25);

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		PdfWriter.getInstance(document, os);

		document.open();

		Paragraph title = new Paragraph("Sales From"+From+" Till "+Till,
				FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, new BaseColor(0, 255, 255)));

		document.add(title);

		PdfPTable table = new PdfPTable(6);
		table.setSpacingBefore(25);
		table.setSpacingAfter(25);

		PdfPCell c1 = new PdfPCell(new Phrase("Id"));
		table.addCell(c1);

		PdfPCell c2 = new PdfPCell(new Phrase("Name"));
		table.addCell(c2);

		PdfPCell c3 = new PdfPCell(new Phrase("From"));
		table.addCell(c3);

		PdfPCell c4 = new PdfPCell(new Phrase("Till"));
		table.addCell(c4);

		PdfPCell c5 = new PdfPCell(new Phrase("Product Price"));
		table.addCell(c5);

		PdfPCell c6 = new PdfPCell(new Phrase("Sales Count"));
		table.addCell(c6);

		for (Map<String, Object> product : products) {
			table.addCell(String.valueOf(product.get("id")));
			table.addCell(String.valueOf(product.get("name")));
			table.addCell(String.valueOf(From));
			table.addCell(String.valueOf(Till));
			table.addCell(String.valueOf(product.get("price")));
			table.addCell(String.valueOf(product.get("total_sales")));

		}

		document.add(table);

		document.close();

		ByteArrayInputStream is = new ByteArrayInputStream(os.toByteArray());

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType("application/pdf"));
		headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
		headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=SalesWithInSomeDuration.pdf");

		ResponseEntity<Resource> response = new ResponseEntity<Resource>(new InputStreamResource(is), headers,
				HttpStatus.OK);

		return response;

	}
	@GetMapping("/report/sales")
	public ResponseEntity<Resource> generateExcelReport() throws IOException, DocumentException {
		List<Product> products = repository.findAll();

		Document document = new Document(PageSize.A4, 25, 25, 25, 25);

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		PdfWriter.getInstance(document, os);

		document.open();

		Paragraph title = new Paragraph("Sales Information for Products",
				FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, new BaseColor(0, 255, 255)));

		document.add(title);

		PdfPTable table = new PdfPTable(6);
		table.setSpacingBefore(25);
		table.setSpacingAfter(25);

		PdfPCell c1 = new PdfPCell(new Phrase("Id"));
		table.addCell(c1);

		PdfPCell c2 = new PdfPCell(new Phrase("Name"));
		table.addCell(c2);

		PdfPCell c3 = new PdfPCell(new Phrase("Product Added on date"));
		table.addCell(c3);

		PdfPCell c4 = new PdfPCell(new Phrase("Product Sold till Date"));
		table.addCell(c4);

		PdfPCell c5 = new PdfPCell(new Phrase("Product Price"));
		table.addCell(c5);

		PdfPCell c6 = new PdfPCell(new Phrase("Sales Count"));
		table.addCell(c6);

		for (Product product : products) {
			table.addCell(String.valueOf(product.getId()));
			table.addCell(product.getName());
			table.addCell(String.valueOf(product.getCreated_at().toLocalDate()));
			table.addCell(String.valueOf(product.getUpdated_at().toLocalDate()));
			table.addCell(String.valueOf(product.getPrice()));
			table.addCell(String.valueOf(product.getSales()));

		}

		document.add(table);

		document.close();

		ByteArrayInputStream is = new ByteArrayInputStream(os.toByteArray());

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType("application/pdf"));
		headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
		headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=ProductSalesReport.pdf");

		ResponseEntity<Resource> response = new ResponseEntity<Resource>(new InputStreamResource(is), headers,
				HttpStatus.OK);

		return response;
	}

}
