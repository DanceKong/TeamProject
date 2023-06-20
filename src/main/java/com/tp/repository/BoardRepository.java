package com.tp.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tp.entity.Board;

public interface BoardRepository extends JpaRepository<Board, Long>{
	
	//제목으로 검색
	Page<Board> findByTitleContaining(String keyword, Pageable pageable);
	
	//카테고리별
	Page<Board> findByCategory(String category, Pageable pageable);
	
	//장르별
	Page<Board> findByGenre(String genre, Pageable pageable);
	
	//장르 선택 후 제목으로 검색
	Page<Board> findByGenreAndTitleContaining(String genre, String title, Pageable pageable);
	
	//카테고리 선택 후 제목으로 검색
	Page<Board> findByCategoryAndTitleContaining(String category, String title, Pageable pageable);
	
	// 장르 선택 후 카테고리 선택
	Page<Board> findByGenreAndCategory(String genre, String category, Pageable pageable);
	
	Page<Board> findByGenreAndCategoryAndTitleContaining(String genre, String category, String title, Pageable pageable);
}
