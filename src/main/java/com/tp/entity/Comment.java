package com.tp.entity;



import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.stereotype.Service;

import com.tp.DTO.CommentDTO;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Service
@Table(name = "comment")
public class Comment extends BaseEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(length = 20, nullable = false)
	private String commentWriter;
	
	@Column
	private String commentContents;
	
	@Column
	@CreationTimestamp
	private Timestamp commentCreatedTime;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "board_num")
	private Board board;

	
	public static Comment toSaveEntity(CommentDTO commentDTO, Board board) {
		Comment comment = new Comment();
		comment.setId(commentDTO.getId());
		comment.setCommentWriter(commentDTO.getCommentWriter());
		comment.setCommentContents(commentDTO.getCommentContents());
		comment.setCommentCreatedTime(commentDTO.getCommentCreatedTime());
		comment.setBoard(board);
		return comment;
	}
	
}
