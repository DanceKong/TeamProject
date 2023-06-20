package com.tp.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.tp.DTO.CommentDTO;
import com.tp.entity.Board;
import com.tp.entity.Comment;
import com.tp.repository.BoardRepository;
import com.tp.repository.CommentRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentService {

	private final CommentRepository commentRepository;
	private final BoardRepository boardRepository;

	public Long save(CommentDTO commentDTO) {
		Optional<Board> optionalBoard = boardRepository.findById(commentDTO.getBoardNum());
		if(optionalBoard.isPresent()) {
			Board board = optionalBoard.get();
			Comment comment = Comment.toSaveEntity(commentDTO, board);
			return commentRepository.save(comment).getId();
		} else {
			return null;
		}	
		
	}

	public List<CommentDTO> findAll(Long boardNum) {
		Board board = boardRepository.findById(boardNum).get();
		List<Comment> commentList = commentRepository.findAllByBoardOrderByIdDesc(board);
		
		List<CommentDTO> commentDTOList = new ArrayList<>();
		for(Comment comment : commentList) {
			CommentDTO commentDTO = CommentDTO.toCommentDTO(comment, boardNum);
			commentDTOList.add(commentDTO);
		}
		return commentDTOList;
	}
	
	//삭제
	@Transactional
	public void deleteById(Long id) {
		commentRepository.deleteById(id);
	}
	
	///////////////////////////////////////
	public Comment selectComment(Long id) {
		return commentRepository.findById(id).get();
	}
	
//	
//	public Comment selectOne(Long id) {
//		return commentRepository.findById(id).get();
//	}
}
