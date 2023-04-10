package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.StepVO;

public interface StepService {
	public void register(StepVO step);
	public StepVO get(Long bno);
	public boolean modify(StepVO step);
	public boolean remove(Long bno);
	public List<StepVO> getList(Criteria cri);
	
}
