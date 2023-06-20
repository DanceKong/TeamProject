package com.tp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tp.DTO.CommentDTO;
import com.tp.entity.Board;
import com.tp.service.CommentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentController {
	private final CommentService commentService;
	
	//댓글 저장
	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute CommentDTO commentDTO) {
		System.out.println("commentDTO = "+commentDTO);
		Long saveResult = commentService.save(commentDTO);
		if(saveResult != null) {
			List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardNum());
			return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
		} else {
			return new ResponseEntity<>("해당 게시글이 존재하지 않습니다",HttpStatus.NOT_FOUND);
		}
		
	}
	
	//댓글 삭제
	@RequestMapping("deleteById")
	public String deleteById(@RequestParam Long id,
			@RequestParam Long num,
			HttpServletRequest req, 
	         HttpServletResponse res, HttpSession session) {
		
		session.setAttribute("listnum", 1);
		commentService.deleteById(id);
		return "redirect:/content?num=" + num;
	}

}
