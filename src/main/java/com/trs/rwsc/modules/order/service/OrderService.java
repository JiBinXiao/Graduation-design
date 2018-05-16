package com.trs.rwsc.modules.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trs.rwsc.common.persistence.CrudDao;
import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.service.CrudService;
import com.trs.rwsc.modules.order.dao.OrderMapper;
import com.trs.rwsc.modules.order.entity.Order;
import com.trs.rwsc.modules.supplier.dao.SupplierDao;
import com.trs.rwsc.modules.supplier.entity.Supplier;

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



}
