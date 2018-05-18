package com.trs.rwsc.modules.order.dao;

import java.util.List;

import com.trs.rwsc.common.persistence.CrudDao;
import com.trs.rwsc.common.persistence.annotation.MyBatisDao;
import com.trs.rwsc.modules.order.entity.Order;
import com.trs.rwsc.modules.supplier.entity.Supplier;

@MyBatisDao
public interface OrderMapper extends CrudDao<Order>{
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order order);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

	List<Order> findDelList();

	List<Order> findConfirmList();
}