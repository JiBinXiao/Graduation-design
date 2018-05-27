package com.trs.rwsc.modules.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.service.CrudService;
import com.trs.rwsc.modules.order.dao.OrderMapper;
import com.trs.rwsc.modules.order.entity.Order;


@Service
@Transactional(readOnly=true)
public class OrderService extends CrudService<OrderMapper, Order>{
	
	@Autowired
	private OrderMapper orderMapper;

	@Transactional(readOnly=false)
	public int add(Order order) {
		// TODO Auto-generated method stub
		return orderMapper.insertSelective(order);
	}

	@Transactional(readOnly=false)
	public int update(Order order) {
		// TODO Auto-generated method stub
		return orderMapper.updateByPrimaryKeySelective(order);
	}

	public Page<Order> findDelPage(Page<Order> page, Order order) {
		order.setPage(page);
		page.setList(dao.findDelList());
		return page;
	}

	public Page<Order> findConfirmPage(Page<Order> page, Order order) {
		order.setPage(page);
		page.setList(dao.findConfirmList());
		return page;
	}

	//查询为收货
	public Page<Order> findNotList(Page<Order> page, Order order) {
		// TODO Auto-generated method stub
		order.setPage(page);
		page.setList(dao.findNotList());
		return page;
	}


	



}
