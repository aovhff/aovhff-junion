package com.boot.Controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.SNSDTO;
import com.boot.DTO.SNSFeedbackDTO;
import com.boot.DTO.SNSFollowDTO;
import com.boot.DTO.SNSIntroDTO;
import com.boot.DTO.UserDTO;
import com.boot.Service.SNSMyPageService;
import com.boot.Service.SNSService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SNSMyPageController {
	
	@Autowired
	private SNSMyPageService snsMyPageService;

	@Autowired
	private SNSService snsService;

	@RequestMapping("/snsUserPage")
	public String SNSUserPage(@RequestParam HashMap<String, String> param, Model model, 
			HttpServletRequest httpServletRequest, String user_email, Integer resume_num) {
	    log.info("@# snsUserPage 시작");

	    HttpSession session = httpServletRequest.getSession();
	    Object userType = session.getAttribute("login_usertype");
	    String email = (String) session.getAttribute("login_email");

	    // user_email이 null 또는 비어있을 경우 세션의 이메일을 사용
	    if (user_email == null || user_email.isEmpty()) {
	        user_email = email;
	    }

	    log.info("@# param follow_email: " + param.get("follow_email"));
	    
	    // SNS 목록 가져오기
	    ArrayList<SNSDTO> snsList = snsService.snsList();
	    log.info("@# list" + snsList);
	    model.addAttribute("snsList", snsList);

	    // 이력서 정보 가져오기
	    List<ResumeDTO> resumeList = snsMyPageService.resumeInfo(param);
//	    ResumeDTO resumeDTO = snsMyPageService.resumeInfo(param);
	    log.info("@# resumeList" + resumeList);
	    model.addAttribute("resumeList", resumeList);
	    
	    // 특정 resume_num에 해당하는 이력서 선택
	    if (resumeList != null && !resumeList.isEmpty()) {
	        ResumeDTO selectedResume = resumeList.get(0); // 기본적으로 첫 번째 이력서를 선택
	        if (resume_num != null) {
	            for (ResumeDTO resume : resumeList) {
	                // 여기서 resume.getResume_num()이 int라면, resume_num.intValue()로 변환하여 비교
	                if (resume.getResume_num() == resume_num) { 
	                    selectedResume = resume;
	                    break;
	                }
	            }
	        }
	        model.addAttribute("resumeInfo", selectedResume);
	        param.put("resume_num", String.valueOf(selectedResume.getResume_num()));
	    }
	    // 유저 정보 가져오기
	    UserDTO userDTO = snsMyPageService.getUserInfo(user_email);
	    log.info("@# UserInfo: " + userDTO);
	    model.addAttribute("userInfo", userDTO);

	    // SNS 소개 정보 가져오기
	    SNSIntroDTO introDTO = snsMyPageService.getSNSIntro(user_email);
	    model.addAttribute("userIntro", introDTO);

	    // SNS 소개 정보 수정
	    if (param.containsKey("sns_intro") && !param.get("sns_intro").isEmpty()) {
	        log.info("Modifying SNS Intro for user: " + user_email);
	        snsMyPageService.modifySNSIntro(param);
	    }

	    // 스택 및 직무 정보 가져오기
	    List<SNSIntroDTO> getSNSStack = snsMyPageService.getSNSStack(user_email);
	    model.addAttribute("SNSStack", getSNSStack);

	    List<SNSIntroDTO> getSNSJob = snsMyPageService.getSNSJob(user_email);
	    model.addAttribute("SNSJob", getSNSJob);
	    
	    List<SNSFeedbackDTO> getFeedback = snsMyPageService.getFeedback(param);
	    model.addAttribute("SNSFeedback", getFeedback);

	    SNSFollowDTO followerCount = snsMyPageService.followerCount(user_email);
	    log.info("@#follow_email: " + user_email);
	    model.addAttribute("followerCount", followerCount);
	    
	    SNSFollowDTO followingCount = snsMyPageService.followingCount(user_email);
	    log.info("@#follow_email: " + user_email);
	    model.addAttribute("followingCount", followingCount);
	    
	    param.put("login_email", user_email);
//	    팔로잉 List
	    List<SNSFollowDTO> followingList = snsMyPageService.followingList(param);
	    log.info("Following List: " + followingList);
	    model.addAttribute("following", followingList);

	 // follow_email을 param에 명시적으로 설정
	    param.put("follow_email", user_email);

	    log.info("@# param follow_email: " + param.get("follow_email"));
	    
//	    팔로워 List
	    List<SNSFollowDTO> followerList = snsMyPageService.followerList(param);
	    log.info("Follower List: " + followerList);
	    model.addAttribute("follower", followerList);
	    
	    // 게시물 삭제
	    snsMyPageService.deletePost(param);

	    // 이메일 정보 모델에 추가
	    model.addAttribute("user_email", user_email);

	    return "/snsUserPage";
	}

	@RequestMapping("/deletePost")
	public String deletePost(@RequestParam HashMap<String, String> param, HttpServletRequest httpServletRequest) {
	    log.info("@# deletePost 시작");

	    // 게시글 삭제 로직 호출
	    snsMyPageService.deletePost(param);

	    return "redirect:/snsUserPage"; // 삭제 후 다시 사용자 페이지로 리다이렉트
	}
	
//	@RequestMapping("/deleteFeedback")
//	public String deleteFeedback(@RequestParam HashMap<String, String> param, HttpServletRequest httpServletRequest) {
//		log.info("@# deleteFeedback 시작");
//		
//		// 게시글 삭제 로직 호출
//		snsMyPageService.deleteFeedback(param);
//		
//		return "redirect:/snsUserPage"; // 삭제 후 다시 사용자 페이지로 리다이렉트
//	}

	@RequestMapping("/writeFeedback")
	public String writeFeedback(@ModelAttribute SNSFeedbackDTO snsFeedbackDTO, HttpServletRequest httpServletRequest) {
	    log.info("@# writeFeedback 시작");
	    log.info("이력서 번호: " + snsFeedbackDTO.getResume_num());

	    HttpSession session = httpServletRequest.getSession();
	    String loginEmail = (String) session.getAttribute("login_email");

	    // 피드백 작성자 이메일 설정
	    snsFeedbackDTO.setLogin_email(loginEmail);

	    // 로그로 데이터 확인
	    log.info("로그인 이메일: " + loginEmail);
	    log.info("피드백 내용: " + snsFeedbackDTO.getFeedback_content());
	    log.info("유저 타입: " + snsFeedbackDTO.getUser_type());

	    // 피드백 날짜를 현재 날짜로 설정
	    snsFeedbackDTO.setFeedback_date(LocalDate.now());

	    try {
	        // 피드백 작성 로직 호출
	        snsMyPageService.writeFeedback(snsFeedbackDTO);
	    } catch (Exception e) {
	        log.error("피드백 등록 중 오류 발생: ", e);
	        return "redirect:/snsUserPage?error"; // 실패 시 에러 파라미터를 추가하여 리다이렉트
	    }

	    log.info("피드백 작성 완료");
	    return "redirect:/snsUserPage"; // 피드백 작성 후 다시 사용자 페이지로 리다이렉트
	}



	
	@RequestMapping("/snsCompanyPage")
//	public String SNSCompanyPage(@RequestParam(value = "com_email", required = false) String com_email , Model model, HttpSession session) {
	public String SNSCompanyPage(String com_email, String user_email, Model model, HttpServletRequest httpServletRequest) {
		log.info("@# snsCompanyPage");
		
        HttpSession session = httpServletRequest.getSession();
        Object userType = session.getAttribute("login_usertype");
        Object email = session.getAttribute("login_email");
        
        model.addAttribute("com_email", com_email);
		
        ArrayList<SNSDTO> snsList = snsService.snsList();
        log.info("@# list" + snsList);
        // 모델에 SNS 목록 추가
        model.addAttribute("snsList", snsList);
		
		CompanyInfoDTO companyDTO = snsMyPageService.companyInfo(com_email);
		log.info("@# snsCompanyPage" + companyDTO);
		model.addAttribute("company", companyDTO);
		
	    // 유저 정보 가져오기
	    UserDTO userDTO = snsMyPageService.getUserInfo(user_email);
	    log.info("@# UserInfo: " + userDTO);
	    model.addAttribute("userInfo", userDTO);
	    
	    SNSFollowDTO followerCount = snsMyPageService.followerCount(com_email);
	    log.info("@#follow_email: " + user_email);
	    model.addAttribute("followerCount", followerCount);
		
		return "/snsCompanyPage";
	}
	
//	@RequestMapping("/snsMain")
//	public String SNSMain() {
//		log.info("@# snsMain");
//		
//		return "/snsMain";
//	}
	
}
