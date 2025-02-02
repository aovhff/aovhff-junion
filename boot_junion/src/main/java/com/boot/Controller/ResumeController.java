package com.boot.Controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.DTO.JoinDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.ResumeUploadDTO;
import com.boot.DTO.UserDTO;
import com.boot.DTO.UserImageUploadDTO;
import com.boot.Service.JoinService;
import com.boot.Service.LoginService;
import com.boot.Service.ResumeService;
import com.boot.Service.ResumeUploadService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResumeController {
	
	@Autowired
	private ResumeUploadService service;
	
	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private JoinService joinService;
	
	@Autowired
	private LoginService loginService;
	
//	// 개인 - 이력서 목록페이지
//	@RequestMapping("/resumeListOld")
//	public String resumeList(Model model, HttpServletRequest request) 
//	{
//		log.info("@# resumeList");	
//		
//		// 세션에 이메일 담아서 쓰는 법
//		HttpSession session = request.getSession();		
//		String login_email = (String)session.getAttribute("login_email");
//		log.info("@# login_email=>"+login_email);
//		ArrayList<ResumeDTO> resumeList = resumeService.resumeList(login_email);
//					
//		
//		model.addAttribute("resumeList",resumeList);		
//		log.info("@# resumeList 리턴==========>"+resumeList);	
//		
//		
//		
//		return "resumeList";
//	}
	
	//
	@RequestMapping("/resumeWrite")
	public String resumeWrite(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest request) 
	{
		log.info("@# resume resumeWrite");		

		List<JoinDTO> stack = joinService.stack();		
		model.addAttribute("stack_name", stack);
		
		List<JoinDTO> stack2 = joinService.stack2();		
		model.addAttribute("stack_name2", stack2);
		
		List<JoinDTO> stack3 = joinService.stack3();		
		model.addAttribute("stack_name3", stack3);
		
		HttpSession session = request.getSession();		
		String login_email = (String)session.getAttribute("login_email");
		param.put("user_email", login_email); // "xml-파라미터명이랑 일치", 값 :
		
		UserDTO dtos = resumeService.userInfo(login_email);
		log.info("@# UserDTO dtos======>"+dtos);
		model.addAttribute("userInfo",dtos);
		

		return "resumeWrite";
	}
	
	// 개인 - 이력서 작성후 등록
	@RequestMapping("/resumeWriteOk")
	public String resumeWriteOk(Model model, HttpServletRequest request, ResumeDTO resumeDTO, @RequestParam String stack_name) 
//	public String resumeWriteOk(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest request, ResumeDTO resumeDTO) 
	{
		log.info("@# resume resumeWriteOk");		
		
		HttpSession session = request.getSession();		
		String login_email = (String)session.getAttribute("login_email");		
		String login_name = (String)session.getAttribute("login_name");		
//		param.put("user_email", login_email); // "xml-파라미터명이랑 일치", 값 :			
		
		UserDTO dtos = resumeService.userInfo(login_email);
		
		String user_name = dtos.getUser_name();		
		String user_gender = dtos.getUser_gender();
		String user_tel = dtos.getUser_tel();
		String user_location = dtos.getUser_location();
		String user_birthdate = dtos.getUser_birthdate();
		
		
		log.info("@# resume dtos");	
		
		resumeDTO.setUser_email(login_email);		
//		resumeDTO.setResume_gender(user_gender);
//		resumeDTO.setUser_tel(user_tel);
//		resumeDTO.setUser_address(user_location);
		resumeDTO.setResume_age(user_birthdate);
						

		log.info("@# resume login_email ==>>" + login_email);	
		log.info("@# resume resumeDTO ==>>" + resumeDTO);
				
		// 파일 업로드 if문 시작
		if (resumeDTO.getResumeUploadList() != null) {
			resumeDTO.getResumeUploadList().forEach(attach -> log.info("@# 보드컨트롤러 write / attach 호출=>"+attach));
		}
//		param.put("resume_image", attach);
		
		resumeService.resumeWrite(resumeDTO);
//		resumeService.resumeWrite(param,resumeDTO);
//		resumeService.resumeWrite(param);
//		resumeService.resumeWrite(param, login_email);
		// 파일 업로드 if문 끝
		
		int resume_num = resumeDTO.getResume_num();
		
		log.info("@# resume resumeDTO  resume_num==>>" + resume_num);
		
		String arr2 [] = stack_name.split(",");
		
		log.info("@# resume resumeDTO  arr2==>>" + arr2);
		
		for(int i = 0; i<arr2.length; i++) 
		{
			resumeService.insertResumeStack(arr2[i],resume_num); 
		}
		
		return "redirect:resumeList";
	}

	// 개인 - 이력서 상세페이지
	@RequestMapping("/resumeInfo")
	public String resumeInfo(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest request) 
	{
		log.info("@# resume/resumeInfo");	
		HttpSession session = request.getSession();		
		String login_email = (String)session.getAttribute("login_email");
		
		ResumeDTO dto = resumeService.resumeInfo(param);
		UserDTO dtos = resumeService.userInfo(login_email);
		log.info("@# UserDTO dtos==========>"+dtos);
		
		String user_name =  dtos.getUser_name();
		String user_gender = dtos.getUser_gender();
		String user_tel = dtos.getUser_tel();
		String user_location = dtos.getUser_location();
		String user_location2 = dtos.getUser_location2();
		String user_birthdate = dtos.getUser_birthdate();
		
		dto.setResume_age(user_birthdate);				
		
		
		model.addAttribute("resumeInfo", dto);
		model.addAttribute("user_gender", user_gender);
		model.addAttribute("user_tel", user_tel);
		model.addAttribute("user_location", user_location);
		model.addAttribute("user_location2", user_location2);
		model.addAttribute("user_name", user_name);
		
		log.info("@# dto==========>"+dto);	
		
		
		String link = dto.getResume_portfolio_url();
		log.info("@# link===========>"+link);
        model.addAttribute("links", link);
        
		
		
		return "resumeInfo";
	}
		
	
	// 개인 - 이력서 수정페이지
	@RequestMapping("/resumeModify")
	public String resumeModify(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest request) 
	{
		HttpSession session = request.getSession();		
		String login_email = (String)session.getAttribute("login_email");			
		param.put("user_email", login_email); // "xml-파라미터명이랑 일치", 값 :
		
		ResumeDTO dto = resumeService.resumeInfo(param);
		log.info("@# resumeModify ResumeDTO dto======>"+dto);
		model.addAttribute("resumeInfo", dto);	
		
		List<JoinDTO> stack = joinService.stack();		
		model.addAttribute("stack_name", stack);
		
		List<JoinDTO> stack2 = joinService.stack2();		
		model.addAttribute("stack_name2", stack2);
		
		List<JoinDTO> stack3 = joinService.stack3();		
		model.addAttribute("stack_name3", stack3);
		
		UserDTO dtos = resumeService.userInfo(login_email);
		model.addAttribute("userInfo",dtos);
		
		String[] stackNames = dto.getStack_name().split(",");
		model.addAttribute("stackNameList", Arrays.asList(stackNames));
		
		return "resumeModify";
	}
	
	// 개인 - 이력서 수정페이지
	@RequestMapping("/resumeModifyOk")
	public String resumeModifyOk(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest request,RedirectAttributes rttr
			,@RequestParam String stack_name, ResumeDTO resumeDTO) 
	{
		HttpSession session = request.getSession();		
		String login_email = (String)session.getAttribute("login_email");			
		param.put("user_email", login_email); // "xml-파라미터명이랑 일치", 값 :
		log.info("@# resume/resumeModifyOk");		
		log.info("@# resumeModifyOk param ==========>"+param);
		log.info("@# resumeModifyOk resume_num ==========>");
		
		UserDTO dtos = resumeService.userInfo(login_email);
		String user_name = dtos.getUser_name();		
		String user_gender = dtos.getUser_gender();
		String user_tel = dtos.getUser_tel();
		String user_location = dtos.getUser_location();
		String user_birthdate = dtos.getUser_birthdate();		
		param.put("user_name", user_name); // 파람에 값 저장하는 것// "xml-파라미터명이랑 일치", 값 :
		param.put("resume_gender",user_gender); // 파람에 값 저장하는 것// "xml-파라미터명이랑 일치", 값 :
		param.put("user_tel", user_tel); // 파람에 값 저장하는 것// "xml-파라미터명이랑 일치", 값 :
		param.put("user_address", user_location); // 파람에 값 저장하는 것// "xml-파라미터명이랑 일치", 값 :
		param.put("resume_age", user_birthdate); // 파람에 값 저장하는 것// "xml-파라미터명이랑 일치", 값 :
		
//		 핵심 파라미터 = resume num 가져오기
		ResumeDTO dto = resumeService.resumeInfo(param);		
		log.info("@# resumeModify param 정보 넣은 ResumeDTO dto======>"+dto);
		log.info("@# resumeModify param======>"+param);
		log.info("@# resumeModify ResumeDTO dto.getResume_comPart()======>"+dto.getResume_comPart());
		log.info("@# resumeModify  ResumeDTO dto.getResume_comPosition()======>"+dto.getResume_comPosition());
		model.addAttribute("resumeInfo", dto);	
		
		
		// 파일 수정 if문 시작
		if (resumeDTO.getResumeUploadList() != null) {//파일(이미지) 있으면
			resumeDTO.getResumeUploadList().forEach(attach -> {
				log.info("@# resume컨트롤러 write / attach 호출=>"+attach);
				List<ResumeUploadDTO> list = service.resumeGetFileList(dto.getResume_num());//현재 DB에 있는 파일내용 가져와서
					
				for (int i = 0; i < list.size(); i++) {//파일갯수만큼
					service.deleteResumeImage(dto.getResume_num());//수정전 데이터 삭제
				}
				service.resumeInsertFile(attach);//새 파일 저장
			});
		}// 파일 수정 if문 끝
		
//		resumeService.resumeModify(dto);//이력서 수정
		resumeService.resumeModify(param);//이력서 수정
		
		int resume_num = resumeDTO.getResume_num();
		
		log.info("@# resume resumeDTO  resume_num==>>" + resume_num);		
		String arr3 [] = stack_name.split(",");
		
		log.info("@# resume resumeDTO  arr3==>>" + arr3);		
		resumeService.deleteResumeStack(String.valueOf(resume_num));
		
		for(int i = 0; i<arr3.length; i++) 
		{			
			resumeService.insertResumeStack(arr3[i], resume_num);
		}
		
		
		rttr.addAttribute("pageNum",param.get("pageNum"));
		rttr.addAttribute("amount",param.get("amount"));
		
		return "redirect:resumeList";
	}
	
	@RequestMapping("/resumeDelete")
	public String resumeDelete(HashMap<String, String> param, HttpServletRequest request,RedirectAttributes rttr, ResumeDTO resumeDTO) 
//	public String resumeDelete(@RequestParam("deleteResume")String[]deleteResume, HashMap<String, String> param) 
	{
		log.info("@# delete");		
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        
        log.info("@# ajaxMsg====>"+ajaxMsg);	
        for(int i=0; i<size; i++) {
        	resumeService.resumeDelete(ajaxMsg[i]);
        	resumeService.deleteResumeStack(ajaxMsg[i]);
        	resumeService.deleteResumeInSubmit(ajaxMsg[i]);
        	List<ResumeUploadDTO> fileList = service.resumeGetFileList(Integer.parseInt(ajaxMsg[i]));
        	service.resumeDeleteFile(fileList);
        }        

        rttr.addAttribute("pageNum",param.get("pageNum"));
		rttr.addAttribute("amount",param.get("amount"));	
		
		return "redirect:resumeList";
	}
	
	// 이력서정보 - 셀렉트 박스 공유여부
	@PostMapping("/changeOfferState")
	@ResponseBody
	public String changeOfferState(@RequestParam("resume_offer") String resume_offer,@RequestParam("resume_num") String resume_num, Model model) 
//	public String changeOfferState(HashMap<String, String> param, Model model) 
	{
		log.info("@# resume/changeOfferState");			
		log.info("@# resume/changeOfferState resume_num===>"+resume_num);
		log.info("@# resume/changeOfferState resume_offer===>"+resume_offer);		
		
		model.addAttribute("resumeOffer",resume_offer);
		
		try {
				resumeService.resumeOfferUpdate(resume_num, resume_offer);
            return "변경 성공!";
        } catch (Exception e) {
            log.error("Error updating resume_offer state", e);
            return "변경 실패: " + e.getMessage();
        }
				
	}	
	
}
