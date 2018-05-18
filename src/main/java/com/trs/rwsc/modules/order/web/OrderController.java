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
	
	
	/**
	 * 查询所有订单
	 * @param order
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "list")
    public String list(Order order,HttpServletRequest request, HttpServletResponse response, Model model) {

		
		
        Page<Order> page = orderService.findPage(new Page<Order>(request, response), order);

        model.addAttribute("page", page);
        
        return "modules/order/list";
    }
	
	/**
	 * 根据id查询
	 * @param order
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "detail")
    public String detailbyid(Order order,HttpServletRequest request, HttpServletResponse response, Model model) {

		order=orderService.get(order.getId());
	 model.addAttribute("order", order);
        return "modules/order/detail";
    }
	
	
	/**
	 * 查询回收站订单
	 * @param order
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "dellist")
    public String dellist(Order order,HttpServletRequest request, HttpServletResponse response, Model model) {

		
		
        Page<Order> page = orderService.findDelPage(new Page<Order>(request, response), order);

        model.addAttribute("page", page);
        
        return "modules/order/dellist";
    }
	
	/**
	 * 查询回收站订单
	 * @param order
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "confirmlist")
    public String confirmlist(Order order,HttpServletRequest request, HttpServletResponse response, Model model) {

		
		
        Page<Order> page = orderService.findConfirmPage(new Page<Order>(request, response), order);

        model.addAttribute("page", page);
        
        return "modules/order/confirmlist";
    }
	
	
	/**
	 * 逻辑删除 修改状态字段为 -1
	 * @param order
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "delete")
	public String delete(Order order,HttpServletRequest request, HttpServletResponse response, Model model) {
		order.setSt(-1);
		int t=orderService.update(order);
		
	    Page<Order> page = orderService.findPage(new Page<Order>(request, response), order);

        model.addAttribute("page", page);
        
        return "modules/order/list";
	}
	
	/**
	 * 确认收货 修改st为 2
	 * @param order
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "confirm")
	public String confirm(Order order,HttpServletRequest request, HttpServletResponse response, Model model) {
		order.setSt(2);
		int t=orderService.update(order);
		
	    Page<Order> page = orderService.findPage(new Page<Order>(request, response), order);

        model.addAttribute("page", page);
        
        return "modules/order/list";
	}
	
	/**
	 * 恢复数据 修改st为 1
	 * @param order
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "recover")
	public String recover(Order order,HttpServletRequest request, HttpServletResponse response, Model model) {
		order.setSt(1);
		int t=orderService.update(order);
		
	    Page<Order> page = orderService.findPage(new Page<Order>(request, response), order);

        model.addAttribute("page", page);
        
        return "modules/order/dellist";
	}
	
	
	/**
	 * 物理删除 从数据库中清除
	 * @param order
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "deleteData")
	public String deleteData(Order order,HttpServletRequest request, HttpServletResponse response, Model model) {
		orderService.deleteData(order);
		
	    Page<Order> page = orderService.findPage(new Page<Order>(request, response), order);

        model.addAttribute("page", page);
        
        return "modules/order/dellist";
	}
	
    
}
