package cn.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.pojo.Reader;
import cn.service.ReaderService;

@Controller
@RequestMapping("/reader")
public class MainController {
	@Resource
	private ReaderService readerService;

	// send
	@RequestMapping(value = "/send", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String send(HttpServletRequest request,
			@RequestParam(name = "username", required = false, defaultValue = "") String username,
			@RequestParam(name = "usermail", required = false, defaultValue = "") String usermail,
			@RequestParam(name = "usertheme", required = false, defaultValue = "") String usertheme,
			@RequestParam(name = "usercon", required = false, defaultValue = "") String usercon)
			throws ServletException, IOException {
		Reader reader = new Reader(username, usermail, usertheme, usercon);
		System.out.println(reader);
		int i = readerService.addReader(reader);
		String result = (i > 0) ? "发送成功!" : "发送失败!";
		return JSON.toJSONString(result);
	}

}
