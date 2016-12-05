package cn.orderSystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.orderSystem.dao.AdminMapper;
import cn.orderSystem.dao.MessageMapper;
import cn.orderSystem.dao.OrderMapper;
import cn.orderSystem.dao.UserMapper;
import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Message;
import cn.orderSystem.model.Order;
import cn.orderSystem.model.User;
import cn.orderSystem.service.AdminService;
import cn.orderSystem.service.MessageService;
import cn.orderSystem.service.OrderService;
import cn.orderSystem.service.UserService;


@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageMapper messageDAO;

	public List<Message> getMessageList(Message message) {
		Map<String, Object> params = new HashMap<>();
		return messageDAO.searchMessage(message);
	}
	
	
	public PageInfo<Message> searchMessage(int pageNo, int pageSize,Message message) {
		PageHelper.startPage(pageNo, pageSize);
		List<Message> list = getMessageList(message);
		return new PageInfo<Message>(list);
	}


	@Override
	public PageInfo<Message> searchMessageStatus(int pageNo, int pageSize, Message message) {
		PageHelper.startPage(pageNo, pageSize);
		List<Message> list = getMessageList(message);
		return new PageInfo<Message>(list);
	}


	@Override
	public void addMessage(Message message) {
		
		messageDAO.addMessage(message);
	}
	

}
