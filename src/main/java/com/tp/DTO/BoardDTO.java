package com.tp.DTO;

import java.sql.Timestamp;

import javax.persistence.Column;

import com.tp.entity.Board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Data;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class BoardDTO {

	private Long num;
	private String genre;
	private String writer;
	private String title;
	private String content;
	private Timestamp regdate;
	private int hit;
	private String filename;
	private String filepath;
	
	public static Board toEntity(final BoardDTO dto) {
		return Board.builder()
				.num(dto.getNum())
				.genre(dto.getGenre())
				.writer(dto.getWriter())
				.title(dto.getTitle())
				.content(dto.getContent())
				.regdate(dto.getRegdate())
				.hit(0)
				.filename(dto.getFilename())
				.filepath(dto.getFilepath())
				.build();
	}
}
