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
@AllArgsConstructor //모든 생성자를 주입한다.
public class StepServiceImpl implements StepService {
	private RecipeMapper mapper;
	@Override
	public void register(StepVO vo) {
		// TODO Auto-generated method stub

	}


	@Override
	public boolean modify(StepVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("removeStep......." + bno);
		return mapper.deleteStep(bno)==1;	
	}

	/*@Override
	public List<StepVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}*/

	@Override
	public List<StepVO> get(Long bno) {
		log.info("getStep.......");
		return mapper.readStep(bno);
	}

	@Override
	public List<StepVO> getList() {
		log.info("getListIngre.......");
		return mapper.getStepList();
	}

}
