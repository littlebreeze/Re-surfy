package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.IngredientVO;

public interface IngredientService {
	public void register(IngredientVO board);
	public IngredientVO get(Long ino);
	public boolean modify(IngredientVO board);
	public boolean remove(Long ino);
}
