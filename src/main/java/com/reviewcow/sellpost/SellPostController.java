package com.reviewcow.sellpost;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sellpost")
@Controller
public class SellPostController {
	
	@RequestMapping("/upload_product_view")
	public String uploadProduct (Model model) {
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("sellpost/upload_product");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
