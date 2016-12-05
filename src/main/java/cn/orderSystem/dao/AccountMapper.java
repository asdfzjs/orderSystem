package cn.orderSystem.dao;


import cn.orderSystem.model.Account;

public interface AccountMapper {

	void addAccount(Account account);

	void delete(Account account);

	void updateAccount(Account account);
}