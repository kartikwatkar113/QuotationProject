package mvc.qp.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import mvc.qp.model.CustomerModel;
import mvc.qp.model.KPIsModel;
import mvc.qp.model.KanbanViewModel;
import mvc.qp.model.ProductDetails;
import mvc.qp.model.ProductModel;
import mvc.qp.model.QuotationFinalDetailModel;
import mvc.qp.model.QuoteForm;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

@Repository
public class QuotationRepo {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<CustomerModel> getAllCustomers() {

		String sql = "select *From customer";
		List<CustomerModel> Customers = null;
		try {
			Customers = jdbcTemplate.query(sql, new RowMapper<CustomerModel>() {

				@Override
				public CustomerModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					CustomerModel getit = new CustomerModel();
					getit.setCustID(rs.getInt(1));
					getit.setCustName(rs.getString(2));
					getit.setCustEmail(rs.getString(3));
					getit.setCustAddress(rs.getString(4));
					return getit;
				}

			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return Customers;

	}

	public List<ProductModel> getAllProducts() {
		String sql = "select *From product";
		List<ProductModel> products = null;
		try {
			products = jdbcTemplate.query(sql, new RowMapper<ProductModel>() {

				@Override
				public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					ProductModel getit = new ProductModel();
					getit.setProID(rs.getInt(1));
					getit.setProName(rs.getString(2));
					getit.setProPrice(rs.getFloat(3));

					return getit;
				}

			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return products;
	}

	public float getProductPrice(int productID) {

		String sql = "select price from product where id=?";
		Float proPrice = null;
		try {

			proPrice = jdbcTemplate.queryForObject(sql, new RowMapper<Float>() {

				@Override
				public Float mapRow(ResultSet rs, int rowNum) throws SQLException {

					return rs.getFloat(1);
				}

			}, productID);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return proPrice;

	}

	public boolean setQuotationFormDetails(QuoteForm quote) {
		int quoteID = 1000;
		int custID = Integer.parseInt(quote.getCustomer());
		String quoteDate = quote.getQuoteDate();
		String status = quote.getStatus();
		double discount = quote.getDiscount();
		double subtotal = quote.getSubtotal();
		double grandTotal = quote.getGrandTotal();
		String sql = "call InsertQuote(?, ?, ?, ?, ?, ?)";
		try {
			quoteID = jdbcTemplate.queryForObject(sql, new RowMapper<Integer>() {

				@Override
				public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {

					return rs.getInt(1);
				}

			}, custID, quoteDate, status, discount, subtotal, grandTotal);

			String sql1 = "insert into lineitem(quote_id,product_id,qty,rate,amount) values(?,?,?,?,?)";

			for (ProductDetails prod : quote.getProducts()) {
				int res = jdbcTemplate.update(sql1, quoteID, prod.getProductId(), prod.getqty(), prod.getRate(),
						prod.getAmount());
				System.out.println(res);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		System.out.println("quote id is:-" + quoteID + " || for customer " + custID);

		return false;

	}

	public List<KanbanViewModel> getAllQuotations() {
		String sql = "select q.quote_id,c.name,c.address from quote q inner join customer c on q.customer_id=c.id where q.status='Draft' order by q.quote_id desc";
		List<KanbanViewModel> getAllQuotations = null;
		try {
			getAllQuotations = jdbcTemplate.query(sql, new RowMapper<KanbanViewModel>() {

				@Override
				public KanbanViewModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					KanbanViewModel getit = new KanbanViewModel();
					getit.setQuoteID(rs.getInt(1));
					getit.setCustName(rs.getString(2));
					getit.setCustaddress(rs.getString(3));
					return getit;
				}

			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return getAllQuotations;
	}

	public List<KanbanViewModel> getAllSendQuotations() {
		String sql = "select q.quote_id,c.name,c.address from quote q inner join customer c on q.customer_id=c.id where q.status='Send' order by q.quote_id desc";
		List<KanbanViewModel> getAllSentQuotations = null;
		try {
			getAllSentQuotations = jdbcTemplate.query(sql, new RowMapper<KanbanViewModel>() {

				@Override
				public KanbanViewModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					KanbanViewModel getit = new KanbanViewModel();
					getit.setQuoteID(rs.getInt(1));
					getit.setCustName(rs.getString(2));
					getit.setCustaddress(rs.getString(3));
					return getit;
				}

			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return getAllSentQuotations;
	}

	public List<KanbanViewModel> getAllAcceptedQuotations() {
		String sql = "select q.quote_id,c.name,c.address from quote q inner join customer c on q.customer_id=c.id where q.status='Accept' order by q.quote_id desc";
		List<KanbanViewModel> getAllAcceptedQuotations = null;
		try {
			getAllAcceptedQuotations = jdbcTemplate.query(sql, new RowMapper<KanbanViewModel>() {

				@Override
				public KanbanViewModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					KanbanViewModel getit = new KanbanViewModel();
					getit.setQuoteID(rs.getInt(1));
					getit.setCustName(rs.getString(2));
					getit.setCustaddress(rs.getString(3));
					return getit;
				}

			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return getAllAcceptedQuotations;
	}

	public List<KanbanViewModel> getAllRejectedQuotations() {
		String sql = "select q.quote_id,c.name,c.address from quote q inner join customer c on q.customer_id=c.id where q.status='Reject' order by q.quote_id desc";
		List<KanbanViewModel> getAllRejectedQuotations = null;
		try {
			getAllRejectedQuotations = jdbcTemplate.query(sql, new RowMapper<KanbanViewModel>() {

				@Override
				public KanbanViewModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					KanbanViewModel getit = new KanbanViewModel();
					getit.setQuoteID(rs.getInt(1));
					getit.setCustName(rs.getString(2));
					getit.setCustaddress(rs.getString(3));
					return getit;
				}

			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return getAllRejectedQuotations;
	}

	public QuotationFinalDetailModel getSelectedQuotation(int quoteID) {
		QuotationFinalDetailModel quoteForm = null;

		String sql = "select q.quote_id, q.quote_date, c.name, c.email, c.address, q.discount, q.grand_total from quote q inner join customer c on q.customer_id=c.id where q.quote_id=?";

		try {
			quoteForm = jdbcTemplate.queryForObject(sql, new RowMapper<QuotationFinalDetailModel>() {

				@Override
				public QuotationFinalDetailModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					QuotationFinalDetailModel getit = new QuotationFinalDetailModel();
					getit.setQuoteID(rs.getInt(1));
					getit.setQuoteDate(rs.getString(2));
					getit.setCustName(rs.getString(3));
					getit.setCustEmail(rs.getString(4));
					getit.setCustAddress(rs.getString(5));
					getit.setDisount(rs.getDouble(6));
					getit.setGrandTotal(rs.getDouble(7));
					return getit;
				}

			}, quoteID);

			String sql1 = "select p.name, l.qty,l.rate,l.amount from lineitem l inner join quote q on q.quote_id=l.quote_id inner join product p on p.id=l.product_id where q.quote_id=?";
			List<ProductDetails> proDetails = null;

			proDetails = jdbcTemplate.query(sql1, new RowMapper<ProductDetails>() {

				@Override
				public ProductDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
					ProductDetails getit = new ProductDetails();
					getit.setProName(rs.getString(1));
					getit.setQty(rs.getInt(2));
					getit.setRate(rs.getDouble(3));
					getit.setAmount(rs.getDouble(4));
					return getit;
				}

			}, quoteID);

			quoteForm.setProducts(proDetails);

			System.out.println(quoteForm);

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return quoteForm;
	}

	public boolean setDraftToSend(int quoteID) {

		String sql = "update quote set status='Send' where quote_id=? ";

		int res = 0;
		try {
			res = jdbcTemplate.update(sql, quoteID);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return res > 0 ? true : false;
	}

	public boolean setSendToAccept(int quoteID) {
		String sql = "update quote set status='Accept' where quote_id=? ";

		int res = 0;
		try {
			res = jdbcTemplate.update(sql, quoteID);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return res > 0 ? true : false;
	}

	public boolean setDraftToReject(int quoteID) {
		String sql = "update quote set status='Reject' where quote_id=? ";

		int res = 0;
		try {
			res = jdbcTemplate.update(sql, quoteID);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return res > 0 ? true : false;
	}
	
	
	//now we are going to fetch counts
	public KPIsModel getkPIsModel(){
		
		KPIsModel kpIsModel=new KPIsModel();
		String sql="select count(quote_id) from quote where status='Draft' or status='send'";
		String sql1="select (select count(quote_id) from quote where status='accept')/(select count(quote_id) from quote where status='accept' or status='reject')";
		String sql2="select (select count(quote_id) from quote where status='reject')/(select count(quote_id) from quote where status='accept' or status='reject')";
		String sql3="select sum(grand_total) from quote where month(quote_date)=month(current_date) and year(quote_date)=year(current_date)";
		
		long openQuotes=0;
		double conversionRatio=0;
		double rejectionRatio=0;
		long quotedCurMoth=0;
		
		try {
			openQuotes=jdbcTemplate.queryForObject(sql,new RowMapper<Long>() {

				@Override
				public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
					return rs.getLong(1);
				}
				
			});
			
			
			
			conversionRatio=jdbcTemplate.queryForObject(sql1,new RowMapper<Double>() {

				@Override
				public Double mapRow(ResultSet rs, int rowNum) throws SQLException {
					return rs.getDouble(1);
				}
				
			});
			
			
			
			rejectionRatio=jdbcTemplate.queryForObject(sql2,new RowMapper<Double>() {

				@Override
				public Double mapRow(ResultSet rs, int rowNum) throws SQLException {
					return rs.getDouble(1);
				}
				
			});
			
			
			
			quotedCurMoth=jdbcTemplate.queryForObject(sql3,new RowMapper<Long>() {

				@Override
				public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
					return rs.getLong(1);
				}
				
			});
			
			kpIsModel.setOpenQuotes(openQuotes);
			kpIsModel.setConversionRatio(conversionRatio);
			kpIsModel.setRejectionRatio(rejectionRatio);
			kpIsModel.setQuotedCurMoth(quotedCurMoth);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return kpIsModel;
	}
	
	//get all quotation list
	
	public List<QuotationFinalDetailModel> getQuoteList(){
		
		String sql="select q.quote_id, c.name,q.quote_date ,q.status, q.grand_total from quote q inner join customer c on q.customer_id=c.id";
		List<QuotationFinalDetailModel> getQuoteList=null;
		
		try {
			getQuoteList=jdbcTemplate.query(sql, new RowMapper<QuotationFinalDetailModel>() {

				@Override
				public QuotationFinalDetailModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					QuotationFinalDetailModel getit=new QuotationFinalDetailModel();
					getit.setQuoteID(rs.getInt(1));
					getit.setCustName(rs.getString(2));
					getit.setQuoteDate(rs.getString(3));
					getit.setStatus(rs.getString(4));
					getit.setGrandTotal(rs.getDouble(5));
					return getit;
				}
				
			});
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return getQuoteList;
		
	}
	
}
