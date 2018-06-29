package cn.wmy.newsssh.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import cn.wmy.newsssh.bean.User;
import cn.wmy.newsssh.service.UserSvc;
import cn.wmy.newsssh.utils.BaseUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
// 自动根据bean的类名实例化一个首写字母为小写的bean，如userAct
// @RequestMapping("/user" )//@RequestMapping 来映射Request 请求与处理器
public class UserAct extends ActionSupport {
	@Resource
	// 把service注入到action中,不需要new
	private UserSvc userSvc;

	private String uid, pwd; // 属性值来源于前端同名传输来的数据
	private String jsonResult;
	private HashMap<String, Object> jsonobj = new HashMap<String, Object>();

	// INPUT 和 SUCCESS是actionsupport类提供的两个返回常量。
	// INPUT默认用来返回输入异常，SUCCESS默认是处理数据完成，成功跳转。
	// INPUT从哪里来就回到哪里去？例如登录页面，进入后台后返回input,那就是继续回到登录页面。
	public String doLogin() {
		try {
			// HttpServletRequest request =ServletActionContext.getRequest();
			Long n = userSvc.getCount();
			if (n == 0) {
				User user = new User();
				user.setUid("15436304");

				user.setXm("wmy");
				user.setPwd(BaseUtil.wmyCode("123", ""));
				user.setBj("信息学院");
				user.setRole("1");
				userSvc.addU(user);
			}
			User user0 = userSvc.findU(uid, pwd);
			jsonobj.clear();
			if (user0 != null) {
				jsonobj.put("ok", true);
				jsonobj.put("msg", "goIndex");
				Map<String, Object> session = ActionContext.getContext().getSession();
				session.put("me", user0);
			} else {
				jsonobj.put("ok", false);
				jsonobj.put("msg", "用户不存在");
			}

		} catch (Exception e) {
			jsonobj.put("ok", false);
			jsonobj.put("msg", "系统错误2");
		}
		jsonResult = BaseUtil.toJson(jsonobj);
		HttpServletResponse response = ServletActionContext.getResponse();
		BaseUtil.outPrint(response, jsonResult);
		return null;
	}

	public String doLogout() {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		session.put("me", null);
		return "logout";
	}

	// 请求跳转到新闻管理页

	public String goIndex() {
		return "goadmin";
	}

	// ///////////////// 属性的 get/set 方 法
	// //////////////////////////////////////////////////
	// ///
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {

		this.pwd = pwd;
	}
}
