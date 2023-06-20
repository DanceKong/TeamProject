package com.tp.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.tp.DTO.BoardDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long num;
	
	@Column(length=50, nullable = false)
	private String genre;
	
	@Column(length=50, nullable = false)
	private String category;
	
	@Column(length=50, nullable = false)
	private String writer;
	
	@Column(length=50, nullable = false)
	private String title;
	
	@Column(length=500, nullable = false)
	private String content;
	
	@Column(columnDefinition = "int default 0")
	private int hit;
	
	@CreationTimestamp
	@Column
	private Timestamp regdate;
	
	@Column(length=150)
	private String filename;
	
	@Column(length=300)
	private String filepath;
	
	public void viewCountUp(Board board) {
        board.hit++;
    }
	
	@OneToMany(mappedBy = "board", cascade = CascadeType.REMOVE, orphanRemoval = true, fetch = FetchType.LAZY)
	private List<Comment> commentList = new ArrayList<>();
	

}


