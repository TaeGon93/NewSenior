package kr.or.activity.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.activity.model.service.ActivityService;
import kr.or.activity.model.vo.Activity;
import kr.or.activity.model.vo.ActivityPageData;
import kr.or.category.model.service.CategoryService;
import kr.or.category.model.vo.Category;

@Controller
public class ActivityController {

	@Autowired
	private ActivityService service;
	@Autowired
	private CategoryService service2;
	
	@RequestMapping(value="/activityList.do")
	public String activityMgrAdmin(String activityCategory, int reqPage,Model model) {
		ActivityPageData apd = service.categoryActivityList(activityCategory, reqPage);
		ArrayList<Category> list = service2.getAllCategory();
		System.out.println("컨트롤러 카테고리 확인"+activityCategory);
		System.out.println("컨트롤러 reqPage"+reqPage);
		model.addAttribute("activityCategory",activityCategory);
		model.addAttribute("list",apd.getList());
		model.addAttribute("pageNavi",apd.getPageNavi());
		model.addAttribute("reqPage",apd.getReqPage());
		model.addAttribute("numPerPage",apd.getNumPerPage());
		model.addAttribute("cateList",list);
		return "activity/activityList";
	}
	
	@RequestMapping(value="/activityDetail.do")
	public String activityDetail(Activity act,Model model) {
		Activity activity = service.getOneActivity(act);
		model.addAttribute("act",activity);
		return "activity/activityDetail";
	}
	
	@RequestMapping(value="/activity2.do")
	public String activity2(Activity act,Model model) {

		return "activity/activity2";
	}
	
	
}
