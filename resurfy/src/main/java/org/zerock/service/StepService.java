package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.StepVO;

public interface StepService {
	public void register(StepVO board);
	public StepVO get(Long bno);
	public boolean modify(StepVO board);
	public boolean remove(Long bno);
	public List<StepVO> getList(Criteria cri);
	
}
