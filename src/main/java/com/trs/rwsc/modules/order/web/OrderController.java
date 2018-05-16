package com.trs.rwsc.modules.order.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.validator.constraints.Mod10Check;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.utils.RtnResult;
import com.trs.rwsc.modules.order.entity.Order;
import com.trs.rwsc.modules.order.service.OrderService;
import com.trs.rwsc.modules.supplier.entity.Supplier;

@Controller
@RequestMapping(value = "${adminPath}/orders/")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "add")
	@ResponseBody
	public String add(Order order,Model model ) {
			order.setCreatedate(new Date());
			order.setPrice(order.getNum()*order.getPrice());
			order.setSt(1);
			order.setSupplierId(1);
		     int ret=orderService.add(order);
	  
	    	String msg="保存失败";
	        if(ret==1){
	            msg = "保存成功！";
	        }
	        return RtnResult.successInfo(msg, null);
		}
	
	
	 @RequestMapping(value = "list")
    public String list(Order order,HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<Order> page = orderService.findPage(new Page<Order>(request, response), order);

        model.addAttribute("page", page);
        
        return "modules/order/list";
    }
    
}
