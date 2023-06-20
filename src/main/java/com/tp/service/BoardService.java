package com.tp.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tp.DTO.BoardDTO;
import com.tp.entity.Board;
import com.tp.repository.BoardRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
	public class BoardService {
	
		private final BoardRepository boardRepository;
		
		@Transactional
	      public void save(Board board, MultipartFile file) throws Exception{
	         
	         if(!file.isEmpty()) {
	            String projectPath = System.getProperty("user.dir") +"\\src\\main\\webapp\\resources\\files";
	            
	            UUID uuid = UUID.randomUUID();
	            
	            String fileName = uuid +"_"+ file.getOriginalFilename();
	            
	            File savefile = new File(projectPath, fileName);
	            
	            file.transferTo(savefile);
	            
	            board.setFilename(fileName);
	            board.setFilepath("/resources/files/" +fileName);
	            
	         }else {
	            if(board.getFilename()==null) {
	               board.setFilename("");
	                 board.setFilepath("");
	            }
	            System.out.println("저장시 파일이름 : "+board.getFilename());
	            
	         }
	         
	         boardRepository.save(board);
	      }
	
	
	//페이징 처리, 게시물 전체
	public Page<Board> Content(Pageable pageable) {
		return boardRepository.findAll(pageable);
	}
	
	
	// 게시물 하나 가져오기
	public Board selectOne(Long num) {
		return boardRepository.findById(num).get();
	}
	
	//게시물 삭제
	@Transactional
	public void delete(Long num) {
		boardRepository.deleteById(num);
	}
	
	// 게시물 조회수 증가
	@Transactional
	public void updateHit(Long num) {
		Board board = boardRepository.findById(num).get();
		board.setHit(board.getHit()+1);
	}
	
	// 게시물 검색(게시글)
	public Page<Board> boardSearch(String keyword, Pageable pageable) {
		return boardRepository.findByTitleContaining(keyword, pageable);
	}

	// 분류에 따라 게시글 출력
	public Page<Board> CategoryList(String category, Pageable pageable) {
		return boardRepository.findByCategory(category, pageable);
	}
	
	//장르에 따라 게시글 출력
	public Page<Board> genreList(String genre, Pageable pageable){
		return boardRepository.findByGenre(genre, pageable);
	}
	
	// 장르 선택 후 검색
	public Page<Board> genreAndSearch(String genre, String keyword, Pageable pageable) {
		return boardRepository.findByGenreAndTitleContaining(genre, keyword, pageable);
	}
	
	// 카테고리 선택 후 검색
	public Page<Board> CategoryAndSearch(String category, String keyword, Pageable pageable) {
		return boardRepository.findByCategoryAndTitleContaining(category, keyword, pageable);
	}
	
	// 장르, 카테고리 선택 후 검색
	public Page<Board> GenreAndCategory(String genre, String category, Pageable pageable) {
		return boardRepository.findByGenreAndCategory(genre, category, pageable);
	}
	
	public Page<Board> GenreAndCategoryAndTitle(String genre, String category, String title, Pageable pageable) {
		return boardRepository.findByGenreAndCategoryAndTitleContaining(genre, category, title, pageable);
	}
	
	
	public Board findById(Long num) {
        
	  return boardRepository.findById(num).orElseThrow(() -> new com.tp.exception.NotFoundException("Could not found board num : " + num));
	}
	
    @Transactional
    public void viewCountUp(Long num) {
        Board board = findById(num);
        board.viewCountUp(board);
    }

}
