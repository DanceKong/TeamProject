package com.tp.DTO;

import java.sql.Timestamp;

import com.tp.entity.Comment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class CommentDTO {

	private Long id;
	private String commentWriter;
	private String commentContents;
	private Long boardNum;
	private Timestamp commentCreatedTime;
	
	public static CommentDTO toCommentDTO(Comment comment, Long boardNum) {
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setId(comment.getId());
		commentDTO.setCommentWriter(comment.getCommentWriter());
		commentDTO.setCommentContents(comment.getCommentContents());
		commentDTO.setCommentCreatedTime(comment.getCommentCreatedTime());
		commentDTO.setBoardNum(boardNum);
		return commentDTO;
	}
}
