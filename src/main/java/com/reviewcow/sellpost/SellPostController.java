package com.reviewcow.sellpost;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.model.SellPost;

@RequestMapping("/sellpost")
@Controller
public class SellPostController {
	@Autowired
	private SellPostBo sellPostBo;
	
	@RequestMapping("/upload_product_view")
	public String uploadProduct (Model model) {
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("sellpost/upload_product");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
	
	@GetMapping("/product_detail_view")
	public String productDetail (
			@RequestParam("postId") int postId,
			Model model) {
		
		SellPost sellPost = sellPostBo.getSellPostbyPostId(postId);
		
		model.addAttribute("sellPost", sellPost);
		model.addAttribute("viewList","sellpost/product_detail");
		
		return "template/layout";
	}
}
