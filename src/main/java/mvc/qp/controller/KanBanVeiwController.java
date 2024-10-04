package mvc.qp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.qp.model.KanbanViewModel;
import mvc.qp.model.QuoteForm;
import mvc.qp.service.QuotationService;

@Controller
public class KanBanVeiwController {

	@Autowired
	QuotationService quotationService;
	
	@RequestMapping("/kanbanView")
	public String kanbanView(Model model) {
		List<KanbanViewModel> getViews=quotationService.getAllQuotations();
		if(getViews!=null) {
			model.addAttribute("qDetails",getViews);
		}
		else {
			model.addAttribute("msg","Data not Present ☹️");
		}
		return "KanbanView";
	}
	
	@RequestMapping("/goToFullDetails")
	public String goToFullDetails(@RequestParam("quoteID") int quoteID) {
		
		QuoteForm quote=quotationService.getSelectedQuotation(quoteID);
		
		
		return "QuotationDetails";
		
	}
}
