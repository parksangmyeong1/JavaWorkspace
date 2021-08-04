package com.bitcamp.firstSpring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.firstSpring.member.domain.OrderCommand;

@Controller
@RequestMapping("/order/order")
public class OrderController {

	@RequestMapping(method=RequestMethod.GET)
	public String getOrderForm() {
		// /WEB-INF/views/order/orderForm.jsp
		return "order/orderForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String getOrder(
			OrderCommand orderCommand) {
		
		System.out.println(orderCommand);
		
		
		// /WEB-INF/views/order/orderForm.jsp
		return "order/order";
	}
}
