package br.com.caelum.vraptor.dash.hibernate.stats;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Component
public class OpenRequestInterceptor implements Interceptor {

	private final OpenRequests requests;
	
	public OpenRequestInterceptor(OpenRequests requests) {
		this.requests = requests;
	}
	
	@Override
	public boolean accepts(ResourceMethod arg0) {
		return true;
	}

	@Override
	public void intercept(InterceptorStack stack, ResourceMethod method, Object instance) throws InterceptionException {
		OpenRequest openRequest = requests.add(method);
		try {
			stack.next(method, instance);
		} finally {
			requests.remove(openRequest);
		}
	}

}
