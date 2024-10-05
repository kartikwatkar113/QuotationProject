package mvc.qp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.qp.model.CustomerModel;
import mvc.qp.model.KPIsModel;
import mvc.qp.model.KanbanViewModel;
import mvc.qp.model.ProductModel;
import mvc.qp.model.QuotationFinalDetailModel;
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
	
	
	
	public List<KanbanViewModel> getAllSendQuotations() {
		return quotationRepo.getAllSendQuotations();
	}
	
	public List<KanbanViewModel> getAllAcceptedQuotations() {
		return quotationRepo.getAllAcceptedQuotations();
	}
	
	public List<KanbanViewModel> getAllRejectedQuotations() {
		return quotationRepo.getAllRejectedQuotations();
	}
	
	public boolean setDraftToSend(int quoteID) {
		
		return quotationRepo.setDraftToSend(quoteID);
	}
	
	
	
	public boolean setSendToAccept(int quoteID) {
		
		return quotationRepo.setSendToAccept(quoteID);
	}


	public boolean setDraftToReject(int quoteID) {
	
		return quotationRepo.setDraftToReject(quoteID);
	}
	
	public QuotationFinalDetailModel getSelectedQuotation(int quoteID) {
		return quotationRepo.getSelectedQuotation(quoteID);
	}
	
	
	
	//now we are goin to fetch counts
	public KPIsModel getkPIsModel(){
		return quotationRepo.getkPIsModel();
	}
	
	
	//get all quotation list
	
	public List<QuotationFinalDetailModel> getQuoteList(){
		return quotationRepo.getQuoteList();
		
	}
	
	
}
