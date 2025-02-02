package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.jobpostingDAO;
import com.boot.DTO.jobpostingDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("jobpostingService")
public class jobpostingServiceImpl implements jobpostingService{

	@Autowired
	private jobpostingDAO jobpostingDAO;
	
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
//	public ResumeDTO resumeList(String login_email) {
	// 전체 공고
	public ArrayList<jobpostingDTO> jobpostingList(String login_email) {
		log.info("@# jobpostingList");
		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
		ArrayList<jobpostingDTO> list = dao.jobpostingList(login_email);		
		return list;
	}
	
	
	@Override
	// 기업입장) 제안관리
	public ArrayList<jobpostingDTO> individualCom(String login_email) {
		log.info("@# individualCom");
		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
		ArrayList<jobpostingDTO> list = dao.individualCom(login_email);		
		return list;
	}

	
	@Override
	public void deleteNotice(String notice_num) {
		jobpostingDAO.deleteNotice(notice_num);
	}

	@Override
	public void deleteOffer(String notice_num) {
		jobpostingDAO.deleteOffer(notice_num);
	}

	@Override
	public void deleteNoticeScrap(String notice_num) {
		jobpostingDAO.deleteNoticeScrap(notice_num);
	}

	@Override
	public void deleteRecentNotice(String notice_num) {
		jobpostingDAO.deleteRecentNotice(notice_num);
	}

	@Override
	public void deleteSubmit(String notice_num) {
		jobpostingDAO.deleteSubmit(notice_num);
	}
	
    // 5개의 삭제 메서드를 하나로 합친 메서드
    @Override
    public void deleteNoticeWithRelatedData(String notice_num) {
        jobpostingDAO.deleteSubmit(notice_num);
        jobpostingDAO.deleteOffer(notice_num);
        jobpostingDAO.deleteNoticeScrap(notice_num);
        jobpostingDAO.deleteRecentNotice(notice_num);
        jobpostingDAO.deleteNotice(notice_num);
    }
   
    // 전체, 진행, 마감 공고 갯수
	@Override
	public jobpostingDTO jobpostingTotalCount(String login_email) {
		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
		return dao.jobpostingTotalCount(login_email);
	}

	@Override
	public ArrayList<jobpostingDTO> jobpostingSupport(String notice_num) {
		log.info("@# jobpostingList");
		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
		ArrayList<jobpostingDTO> list = dao.jobpostingSupport(notice_num);
		return list;
	}

//    // 지원자 카운트
//	@Override
//	public ArrayList<jobpostingDTO> jobpostingSupportCount(String notice_num) {
//		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
//		return dao.jobpostingSupportCount(notice_num);
//	}

	// 포지션제안 Insert
	@Override
	public void jobpostingOffer(jobpostingDTO jobpostingDTO) {
		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
		dao.jobpostingOffer(jobpostingDTO);
		log.info("@# 잡포스팅Dao jobpostingDTO=>"+jobpostingDTO);
		
	}

    @Override
    public List<jobpostingDTO> jobpostingResumeStack(int resume_num) {
        return jobpostingDAO.jobpostingResumeStack(resume_num);
    }	
    
    // 필터링된 지원자 목록을 가져오는 메서드
    @Override
    public ArrayList<jobpostingDTO> jobpostingSupportFiltered(String notice_num, String submitStatus, String submitCheck) {
        Map<String, Object> params = new HashMap<>();
        params.put("notice_num", notice_num);
        params.put("submitStatus", submitStatus);
        params.put("submitCheck", submitCheck);
        ArrayList<jobpostingDTO> jobpostingSupport = jobpostingDAO.jobpostingSupportFiltered(params);
        
        for (jobpostingDTO dto : jobpostingSupport) {
            List<jobpostingDTO> stacks = jobpostingDAO.jobpostingResumeStack(dto.getResume_num());
            ArrayList<String> stackNames = new ArrayList<>();
            for (jobpostingDTO stack : stacks) {
                stackNames.add(stack.getStack_name());
            }
            dto.setStack_names(stackNames);
        }
        
        return jobpostingSupport;
    }

    // 열람, 미열람
    @Override
    public void updateSubmitCheck(int resumeNum, int noticeNum, String status) {
    	jobpostingDAO.updateSubmitCheck(resumeNum, noticeNum, status);
    }
    
    // 합격, 불합격, 보류
    @Override
    public void updateStatus(int resumeNum, int noticeNum, String updateStatus) {
    	jobpostingDAO.updateStatus(resumeNum, noticeNum, updateStatus);
    }


}






