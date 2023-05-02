package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
	public boolean register(List<StepVO> board) {
		log.info("register....." + board);
		int cnt=0;
		for (StepVO stepVO : board) {
			cnt+=mapper.insertStep(stepVO);
		}
		return cnt==board.size();
	}

	@Override
	public List<StepVO> get(Long bno) {
		log.info("get....." + bno);
		return mapper.readStep(bno);
	}

	@Override
	public boolean modify(List<StepVO> board) {
		log.info("modifyStep......" + board);
		int cnt=0;
		for (StepVO stepVO : board) {
			if(mapper.updateStep(stepVO)==1)
				cnt++;
		}
		return cnt == board.size();
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

	@Transactional
	@Override
	public void registerAll(List<StepVO> list) {
		list.forEach(step -> mapper.insertStep(step));
		
	}
	

}