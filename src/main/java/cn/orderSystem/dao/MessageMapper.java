package cn.orderSystem.dao;

import java.util.List;

import cn.orderSystem.model.Message;

public interface MessageMapper {

	List<Message> searchMessage(Message message);

	void addMessage(Message message);
}