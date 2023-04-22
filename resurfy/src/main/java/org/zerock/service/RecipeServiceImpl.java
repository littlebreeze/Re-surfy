package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.RecipeVO;

import org.zerock.mapper.RecipeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor 
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeMapper mapper;
	@Override
	public void register(RecipeVO board) {
		log.info("register......." + board);
		mapper.insertRecipe(board);

	}
	
	@Override
	public List<RecipeVO> getList(Criteria cri) {
		log.info("get List with Criteria" + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public List<RecipeVO> getAllList() {
		log.info("getList.......");
		return mapper.getRecipeList();
	}
	
	@Transactional
	@Override
	public RecipeVO get(Long bno) {
		log.info("get......." + bno);
		mapper.updateVisitCnt(bno, 1);
		return mapper.readRecipe(bno);
	}
	
	@Override
	public boolean modify(RecipeVO board) {
		log.info("modify......." + board);
		return mapper.updateRecipe(board) == 1;
	}
	
	@Override
	public boolean modifyw(RecipeVO board) {
		log.info("modify......." + board);
		return mapper.updateRecipew(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove......." + bno);
		return mapper.deleteRecipe(bno)==1;
	}


	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count....");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<RecipeVO> getUserList(Criteria cri, String userID) {
		return mapper.getUserList(cri, userID);
	}

	@Override
	public int getUserTotal(Criteria cri, String userID) {
		return mapper.getUserTotalCount(cri, userID);
	}

	@Override
	public List<RecipeVO> sortByReplyCnt() {
		return mapper.getRecipeOrderByReplycnt();
	}

	@Override
	public List<RecipeVO> sortByVisitCnt() {
		return mapper.getRecipeOrderByVisitcnt();
	}

}
