package mvc.qp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.qp.model.CustomerModel;
import mvc.qp.model.KanbanViewModel;
import mvc.qp.model.ProductModel;
import mvc.qp.model.QuoteForm;
import mvc.qp.repository.QuotationRepo;

@Service
public class QuotationService {

	@Autowired
	QuotationRepo quotationRepo;
	
	public List<CustomerModel> getAllCustomers(){
		return quotationRepo.getAllCustomers();
	}
	
	public List<ProductModel> getAllProducts(){
		return quotationRepo.getAllProducts();
	}
	
	public float getProductPrice(int productID) {
		return quotationRepo.getProductPrice(productID);
		
	}
	
	
	public boolean setQuotationFormDetails(QuoteForm quote){
		return quotationRepo.setQuotationFormDetails(quote);
		
	}

	public List<KanbanViewModel> getAllQuotations() {
	
		return quotationRepo.getAllQuotations();
	}
	
	
	public QuoteForm getSelectedQuotation(int quoteID) {
		return quotationRepo.getSelectedQuotation(quoteID);
	}
	
}
