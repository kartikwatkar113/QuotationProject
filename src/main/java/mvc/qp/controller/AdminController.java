package mvc.qp.controller;

import java.util.*;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mvc.qp.model.CustomerModel;
import mvc.qp.model.ProductDetails;
import mvc.qp.model.ProductModel;
import mvc.qp.model.QuoteForm;
import mvc.qp.service.QuotationService;

@Controller
public class AdminController {

	@Autowired
	QuotationService quotationService;

	@RequestMapping("/")
	public String goToDashBoard(Model model) {

		return "AdminDashboard";
	}

	@RequestMapping("/dashBoard")
	public String goToDashBoardAgain(Model model) {

		return "AdminDashboard";
	}

	// quote form

	@PostMapping("/submitQuote")
	public String submitQuote(@RequestParam("status") String status, @RequestParam("quoteDate") String quoteDate,
			@RequestParam("customer") String customer, @RequestParam("product[]") List<String> productIds,
			@RequestParam("qty[]") List<Integer> quantities, @RequestParam("rate[]") List<Double> rates,
			@RequestParam("amount[]") List<Double> amounts, @RequestParam("subtotal") Double subtotal,
			@RequestParam("discount") Double discount, @RequestParam("grandTotal") Double grandTotal, Model model) {

		// Create a new quote object
		QuoteForm quote = new QuoteForm();
		quote.setStatus(status);
		quote.setQuoteDate(quoteDate);
		quote.setCustomer(customer);
		quote.setSubtotal(subtotal);
		quote.setDiscount(discount);
		quote.setGrandTotal(grandTotal);

		// Process each product in the quote
		List<ProductDetails> quoteProducts = new ArrayList<>();
		for (int i = 0; i < productIds.size(); i++) {
			ProductDetails quoteProduct = new ProductDetails();
			quoteProduct.setProductId(productIds.get(i));
			quoteProduct.setQty(quantities.get(i));
			quoteProduct.setRate(rates.get(i));
			quoteProduct.setAmount(amounts.get(i));
			quoteProducts.add(quoteProduct);
		}

		
		quote.setProducts(quoteProducts);
		System.out.println(quote);
		
		boolean res=quotationService.setQuotationFormDetails(quote);
		
		// Save the quote and associated products (This would be service layer logic)
		//productService.saveQuote(quote, quoteProducts);

		// Return a view or redirect after processing the quote
		return "redirect:/quotes"; // Redirect to another page after successful submission
	}



	@RequestMapping("/goForQuote")
	public String goForQuote(@ModelAttribute("quoteForm") QuoteForm quoteForm ,Model model) {

		List<CustomerModel> getAllCustomers = quotationService.getAllCustomers();
		model.addAttribute("customers", getAllCustomers);

		List<ProductModel> getAllProducts = quotationService.getAllProducts();
		model.addAttribute("products", getAllProducts);

		return "QuotationPage";
	}

	@GetMapping("/getProductPrice")
	@ResponseBody
	public Map<String, Float> getProductPrice(@RequestParam("productID") String productID) {
		int proID = Integer.parseInt(productID);
		float proPrice = quotationService.getProductPrice(proID);
		Map<String, Float> response = new HashMap<String, Float>();
		System.out.println(proPrice);
		response.put("price", proPrice);
		return response;
	}

	@RequestMapping("/kanbanView")
	public String kanbanView() {
		return "KanbanView";
	}
}
