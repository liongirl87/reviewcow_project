package com.reviewcow.point;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/point")
@Controller
public class PointController {
	
	@RequestMapping("/manage_point_view")
	public String managePointView(Model model) {
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("point/manage_point");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
