package cn.orderSystem.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.orderSystem.model.Account;
import cn.orderSystem.model.Enterprise;

public interface AccountService {

	public void addAccount(Account account);

	public void delete(Account account);

	public void updateAccount(Account account);
}
