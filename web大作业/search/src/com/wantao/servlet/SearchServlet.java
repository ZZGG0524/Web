package com.wantao.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;



/*
 *@author:wantao
 *@time:Jul 17, 2018 1:56:32 PM
 *@description:
 */
public class SearchServlet extends HttpServlet {
	// 模拟数据
	public static List<String> datas = new ArrayList<>();
	static {
		datas.add("ajax get");
		datas.add("ajax post");
		datas.add("ajax put");
		datas.add("ajax delete");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String keyword = (String) req.getParameter("keyword");
		List<String> dataList = getDataByKeyword(keyword);
		// 转化为json格式
		JSONArray jsons = JSONArray.fromObject(dataList);
		resp.getWriter().write(jsons.toString());
	
	}

	// 获得数据
	public List<String> getDataByKeyword(String keyword) {
		List<String> lists = new ArrayList<>();
		for (String data : datas) {
			if (data.contains(keyword)) {
				lists.add(data);
			}
		}
		return lists;
	}
}
