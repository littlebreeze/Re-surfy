package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.StepVO;

import org.zerock.mapper.RecipeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor 
public class StepServiceImpl implements StepService {
	private RecipeMapper mapper;

	@Override
	public boolean register(List<StepVO> boards) {
	    try {
	        log.info("register steps...");
	        for (StepVO board : boards) {
	            mapper.insertStep(board);
	        }
	
	    } catch (Exception e) {
	        log.error("Error registering steps", e);
	        return false;
	    }
		return true;
	}

	@Override
	public List<StepVO> get(Long bno) {
		log.info("get....." + bno);
		return mapper.readStep(bno);
	}

	@Override
	public boolean modify(StepVO board) {
		log.info("modifyStep......" + board);
		return mapper.updateStep(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("removeStep......" + bno);
		return mapper.deleteStep(bno) == 1;
	}

	@Override
	public List<StepVO> getList() {
		log.info("getList.......");
		return mapper.getStepList();
	}
	

}
