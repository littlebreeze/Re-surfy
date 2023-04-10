package org.zerock.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.service.IngredientService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Reply/*")
@AllArgsConstructor
public class ReplyController {
	private IngredientService Service;
	
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		return null;}
	
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") Long page, @PathVariable("bno") Long bno){
		return null;
	}
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
		return null;
		
	}
	public ResponseEntity<ReplyVO> remove(@PathVariable("rno") Long rno){
		return null;
		
	}
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno){
		return null;
		
	}
}
