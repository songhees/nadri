package com.nadri.restaurant.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.nadri.restaurant.service.RestaurantService;
import com.nadri.restaurant.vo.Restaurant;
import com.nadri.restaurant.web.form.RestaurantInsertForm;


@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	
	@Autowired
	RestaurantService rtService;
	
	
	
	/*
	 * 요청방식 : GET
	 * 요청URL : /restaurant/main
	 * 요청파라미터 : category
	 * 이동할 뷰페이지 : /WEB-INF/views/restaurant/main.jsp
	 * 뷰페이지에 전달되는 데이터 : Restaurant
	 */
	@GetMapping("/main.nadri")
	public String main(Model model) {
		
		List<Restaurant> restaurants = rtService.getBestRestaurants();
		model.addAttribute("restaurants", restaurants);
		
		
		return "/restaurant/main";
	}
	
	
	
	/*
	 * 요청방식 : GET
	 * 요청URL : /restaurant/detail
	 * 요청파라미터 : no
	 * 이동할 뷰페이지 : /WEB-INF/views/restaurant/detail?no=
	 * 뷰페이지에 전달되는 데이터 : Restarant
	 */
	
	@GetMapping("/detail.nadri")
	public String detail(int no, Model model) {
	
		Restaurant restaurant = rtService.getRestaurantDetail(no);
		model.addAttribute("restaurant", restaurant);
		
		return "restaurant/detail";	// prefix="/WEB-INF-views/" viewName="home" suffix=".jsp"
	
	}
	
	
	@GetMapping("/insert.nadri")
	public String form() {
		
		return "restaurant/form";
	}
	
	@PostMapping("/insert.nadri")
	public String save(RestaurantInsertForm form) throws IOException  {
		String saveDirectory = "C:\\Develop\\projects\\final-workspace\\nadri\\src\\main\\webapp\\resources\\images\\restaurants";
		Restaurant rt = new Restaurant();
		MultipartFile upfiles = form.getUpfiles();
		
		if(!upfiles.isEmpty()) {
			String filename = upfiles.getOriginalFilename();
			rt.setPicture(filename);
			
			InputStream in = upfiles.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(saveDirectory, filename));
			
			FileCopyUtils.copy(in, out);
		}
		
		BeanUtils.copyProperties(form, rt);
		
		rtService.addNewRestaurant(rt);
		
		return "redirect:insert.nadri";
	}
	

}
