package mvc.qp.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class QuotationIntializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		Class<?> config[]= {QuotationConfigClass.class};
		return config;
	}

	@Override
	protected String[] getServletMappings() {
		String mapping[]= {"/"};
		return mapping;
	}

}