package org.zerock.service;

import org.zerock.domain.IngredientVO;

public interface IngredientService {
	public void register(IngredientVO ingre);
	public IngredientVO get(Long bno);
}
