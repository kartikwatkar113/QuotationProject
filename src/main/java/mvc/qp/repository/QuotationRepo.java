package mvc.qp.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import mvc.qp.model.CustomerModel;
import mvc.qp.model.ProductModel;
import mvc.qp.model.QuoteForm;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

@Repository
public class QuotationRepo {

	@Autowired
	JdbcTemplate jdbcTemplate;

	
	public List<CustomerModel> getAllCustomers(){
		
		String sql="select *From customer";
		List<CustomerModel> Customers=null;
		try {
			Customers=jdbcTemplate.query(sql,new RowMapper<CustomerModel>() {

				@Override
				public CustomerModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					CustomerModel getit=new CustomerModel();
					getit.setCustID(rs.getInt(1));
					getit.setCustName(rs.getString(2));
					getit.setCustEmail(rs.getString(3));
					getit.setCustAddress(rs.getString(4));
					return getit;
				}
				
			});
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return Customers;
		
	}

	
	
	public List<ProductModel> getAllProducts(){
		String sql="select *From product";
		List<ProductModel> products = null;
		try {
			products=jdbcTemplate.query(sql,new RowMapper<ProductModel>() {

				@Override
				public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					ProductModel getit=new ProductModel();
					getit.setProID(rs.getInt(1));
					getit.setProName(rs.getString(2));
					getit.setProPrice(rs.getFloat(3));

					return getit;
				}
				
			});
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return products;
	}
	
	
	public float getProductPrice(int productID) {
		
		String sql="select price from product where id=?";
		Float proPrice = null;
		try {
			
			proPrice=jdbcTemplate.queryForObject(sql,new RowMapper<Float>() {

				@Override
				public Float mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					return rs.getFloat(1);
				}
				
			},productID);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return proPrice;
		
	}

	
	
	
	public boolean setQuotationFormDetails(QuoteForm quote){
		int quoteID=0;
		int custID=Integer.parseInt(quote.getCustomer());
		String quoteDate=quote.getQuoteDate();
		String status=quote.getStatus();
		double discount=quote.getDiscount();
		double subtotal=quote.getSubtotal();
		double grandTotal=quote.getGrandTotal();
		String sql="call InsertQuote(?, ?, ?, ?, ?, ?)";
		try {
			quoteID=jdbcTemplate.queryForObject(sql,new RowMapper<Integer>() {

				@Override
				public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					return rs.getInt(1);
				}
				
			},custID,quoteDate,status,discount,subtotal,grandTotal);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		System.out.println("quote id is:-"+quoteID+" || for customer "+custID);
		
		return false;
		
	}
	
	
	
	
}
