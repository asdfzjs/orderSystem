package cn.orderSystem.dao;

import java.util.List;

import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Enterprise;
import cn.orderSystem.model.Level;
import cn.orderSystem.model.Order;
import cn.orderSystem.model.Series;

public interface LevelMapper {

	List<Level> getLevelList();
}