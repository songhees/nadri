package com.nadri.manager.web.restController;

import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.manager.annotation.LoginedManager;
import com.nadri.manager.dto.UserCriteria;
import com.nadri.manager.service.ManagerService;
import com.nadri.manager.util.SessionUtils;
import com.nadri.manager.vo.Manager;
import com.nadri.manager.web.model.ResponseDto;

@RestController
@RequestMapping("/rest/admin")
public class ManagerRestController {
	
	static final Logger log = LogManager.getLogger(ManagerRestController.class);
	
	@Autowired
	ManagerService service;
	
	@PostMapping("/login.do")
	public ResponseDto<?> login(String id, String password) {
		ResponseDto<?> responseDto = new ResponseDto<>();
		try {
			Manager manager = service.login(id, password);
			SessionUtils.addAttribute("LOGIN_MANAGER", manager);
			responseDto.setStatus("OK");
			return responseDto;
		} catch (RuntimeException e) {
			responseDto.setStatus("FAIL");
			responseDto.setError("존재하지 않는 정보입니다.");
			return responseDto;
		}
	}
	
	/**
	 * 회원 정보 검색 창
	 * @param manager
	 * @param criteria
	 * @return
	 */
	@GetMapping("/userSearch.do")
	public Map<String, Object> userSearch(@LoginedManager Manager manager, UserCriteria criteria) {
		log.info("확인: " + criteria.toString());
		Map<String, Object> response = service.getUserByCriteria(criteria);
		
		return response;
	}
	
	@GetMapping("/famous/{category}")
	public Map<String, Object> famoust(@LoginedManager Manager manager, @PathVariable("category") String category) {
		log.info("선택:" + category);
		Map<String, Object> response = new HashMap<>();
		switch (category) {
		case "train":
			response.put("famousList", service.getFavoriteTrain());
			break;

		case "restaurant":
			response.put("famousList", service.getFavoirteRestuarnt());
			break;
			
		case "attr":
			response.put("famousList", service.getFavoirteAttraction());
			break;
		}
		
		return response;
	}
	
	@GetMapping("/chart")
	public Map<String, Object> chart(@LoginedManager Manager manager) {
		Map<String, Object> response = new HashMap<>();
		
		int total = service.getAllUser().size();
		response.put("genderRate", service.getGenderRateOfUser(total));
		response.put("ageRate", service.getAgeRateOfUser(total));
		
		return response;
	}
	
	@GetMapping("/index")
	public Map<String, Object> index(@LoginedManager Manager manager) {
		Map<String, Object> response = new HashMap<>();
		
		response.put("monthsRate", service.getUserCountByMonth());
		return response;
	}
	
	@GetMapping("/statistics")
	public Map<String, Object> statistics(@LoginedManager Manager manager) {
		Map<String, Object> response = new HashMap<>();
		
		response.put("agePayment", service.getAgePayment());
		response.put("genderPayment", service.getGenderPayment());
		return response;
	}
}
