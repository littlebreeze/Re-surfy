package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.OwnVO;

public interface OwnMapper {
	public int insert(OwnVO vo);
	public List<OwnVO> getList();
 	public int delete(Long ownNO);
 	public int update(OwnVO vo);
}
