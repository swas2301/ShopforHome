package com.gl.csv;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import com.gl.csv.CSVHelper;
import com.gl.entity.Product;
import com.gl.repository.ProductRepository;

@Service
public class CSVService {
@Autowired
ProductRepository repository;
@Autowired
CSVHelper csvHelper;
public void save(MultipartFile file) {
    try {
      List<Product> products = csvHelper.csvToTutorials(file.getInputStream());
    } catch (IOException e) {
      throw new RuntimeException("fail to store csv data: " + e.getMessage());
    }
  }

//  public ByteArrayInputStream load() {
//    List<Product> products = repository.findAll();
//
//    ByteArrayInputStream in = CSVHelper.tutorialsToCSV(products);
//    return in;
//  }

  public List<Product> getAllTutorials() {
    return repository.findAll();
  }

}
