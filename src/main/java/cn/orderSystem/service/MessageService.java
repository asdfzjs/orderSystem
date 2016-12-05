package cn.orderSystem.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.orderSystem.model.Message;

public interface MessageService {

	public PageInfo<Message> searchMessage(int pageNo, int pageSize,Message message);

	List<Message> getMessageList(Message message);

	public PageInfo<Message> searchMessageStatus(int pageNo, int pageSize, Message message);

	public void addMessage(Message message);
}
