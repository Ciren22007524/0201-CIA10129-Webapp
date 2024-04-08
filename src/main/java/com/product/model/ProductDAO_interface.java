package com.product.model;

import java.util.*;

public interface ProductDAO_interface {
	
    public void insert(ProductVO productVO);
    public void update(ProductVO productVO);
    public void delete(Integer pNo);
    public ProductVO findByPrimaryKey(Integer pNo);
    public List<ProductVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ProductVO> getAll(Map<String, String[]> map); 

}

