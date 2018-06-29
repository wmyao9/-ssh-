package cn.wmy.newsssh.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.wmy.newsssh.bean.User;
import cn.wmy.newsssh.dao.BaseDao;
import cn.wmy.newsssh.utils.BaseUtil;

@Service
public class UserSvc {
	@Resource
	private BaseDao<User> dao;
	public void addU(User user) {
		dao.save(user);
	}
	public User findU(String uid, String pwd) {
		return dao.get(" from User u where u.uid = ? and u.pwd= ? ",new Object[] { uid, BaseUtil.wmyCode(pwd, "") });
	}
	public Long getCount() {
		return dao.count("select count(*) from User");
	}
}
