package mvc.qp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mvc.qp.model.KPIsModel;
import mvc.qp.model.KanbanViewModel;
import mvc.qp.model.QuotationFinalDetailModel;
import mvc.qp.model.QuoteForm;
import mvc.qp.service.QuotationService;

@Controller
public class KanBanVeiwController {

	@Autowired
	QuotationService quotationService;
	
	@RequestMapping("/kanbanView")
	public String kanbanView(Model model) {
		List<KanbanViewModel> getViews=quotationService.getAllQuotations();
		List<KanbanViewModel> sentQuotes = quotationService.getAllSendQuotations();
		List<KanbanViewModel> acceptQuotes = quotationService.getAllAcceptedQuotations();
		List<KanbanViewModel> rejectQuotes = quotationService.getAllRejectedQuotations();
		
		KPIsModel kPIsModel=quotationService.getkPIsModel();
		System.out.println(kPIsModel);
		model.addAttribute("count",kPIsModel);

		if(getViews!=null) {
			
			model.addAttribute("qDetails",getViews);
			model.addAttribute("sendQDetails",sentQuotes);
			model.addAttribute("acceptQDetails",acceptQuotes);
			model.addAttribute("rejectQDetails",rejectQuotes);
		}
		else {
			model.addAttribute("msg","Data not Present ☹️");
		}
		return "KanbanView";
	}
	
	@RequestMapping("/goToFullDetails")
	public String goToFullDetails(@RequestParam("quoteID") int quoteID,Model model) {
		
		System.out.println(quoteID);
		QuotationFinalDetailModel quote=quotationService.getSelectedQuotation(quoteID);
		System.out.println(quote);
		model.addAttribute("QDetails",quote);
		model.addAttribute("discount",quote.getDisount());
		model.addAttribute("totalAmount",quote.getGrandTotal());
		
		return "QuotationDetails";
		
	}
	
	@GetMapping("/sendController")
	@ResponseBody
	public String sendController(@RequestParam("quoteID") int quoteID,Model model) {
	   
		System.out.println(quoteID);
	    // Fetch updated list of sent quotes
	    boolean res = quotationService.setDraftToSend(quoteID);
	    if (res) {
	        return "Success";  // Respond with a success message
	    } else {
	        return "Failure";  // Respond with a failure message
	    }
	}
	
	
	@GetMapping("/acceptController")
	@ResponseBody
	public String acceptController(@RequestParam("quoteID") int quoteID,Model model) {
	   
		System.out.println(quoteID);
	    // Fetch updated list of sent quotes
	    boolean res = quotationService.setSendToAccept(quoteID);
	    if (res) {
	        return "Success";  // Respond with a success message
	    } else {
	        return "Failure";  // Respond with a failure message
	    }
	}
	
	@GetMapping("/rejectController")
	@ResponseBody
	public String rejectController(@RequestParam("quoteID") int quoteID,Model model) {
	   
		System.out.println(quoteID);
	    // Fetch updated list of sent quotes
	    boolean res = quotationService.setDraftToReject(quoteID);
	    if (res) {
	        return "Success";  // Respond with a success message
	    } else {
	        return "Failure";  // Respond with a failure message
	    }
	}
	
	
	@RequestMapping("/QuoteLIst")
	public String QuoteLIst(Model model) {
		
		List<QuotationFinalDetailModel> quoteList=quotationService.getQuoteList();
		model.addAttribute("qDetails",quoteList);
		return "QuoteLIst";
		
	}
}
