package com.tp.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tp.entity.Board;
import com.tp.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CategoryGenreController {
	
	private final BoardService boardservice;
	
	// 카테고리별 장르
	@RequestMapping("/{genre}_board")
	public String board(Model model,
			@PageableDefault(page = 0,size = 10, sort = "num", direction = Sort.Direction.DESC) Pageable pageable,
			String keyword,
			@PathVariable("genre") String genre
			) {
		
		
		Page<Board> list = null;
		
		if(keyword == null) {
			if(genre.equals("ro")) {
				genre = "로맨스";
			}else if(genre.equals("co")) {
				genre = "코미디";
			}else if(genre.equals("act")) {
				genre = "액션";
			}else if(genre.equals("fa")) {
				genre = "판타지";
			}else if(genre.equals("horror")) {
				genre = "공포";
			}
			list = boardservice.genreList(genre, pageable);
		}else {
			if(genre.equals("ro")) {
				genre = "로맨스";
			}else if(genre.equals("co")) {
				genre = "코미디";
			}else if(genre.equals("act")) {
				genre = "액션";
			}else if(genre.equals("fa")) {
				genre = "판타지";
			}else if(genre.equals("horror")) {
				genre = "공포";
			}
			list = boardservice.genreAndSearch(genre, keyword, pageable);
		}
		
		// 현재페이지 가져오는 nowPage
		int nowPage = list.getPageable().getPageNumber()+1;
		
		//Math.max() 는 둘 중 큰걸 반환 min 은 반대
		int startPage = Math.max(nowPage - 4, 1);
		int endPage = Math.min(nowPage + 5, list.getTotalPages());
		
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		if(genre.equals("로맨스")) {
			genre = "ro";
		}else if(genre.equals("코미디")) {
			genre = "co";
		}else if(genre.equals("액션")) {
			genre = "act";
		}else if(genre.equals("판타지")) {
			genre = "fa";
		}else if(genre.equals("공포")) {
			genre = "horror";
		}
		
		return "genre/"+genre+"/list";
	}
	@RequestMapping("/{genre}_review")
	public String review(Model model,
			@PageableDefault(page = 0,size = 10, sort = "num", direction = Sort.Direction.DESC) Pageable pageable,
			String keyword,
			@PathVariable("genre") String genre) {
		
		Page<Board> list = null;
		
		
		
		if(keyword == null) {
			if(genre.equals("ro")) {
				genre = "로맨스";
			}else if(genre.equals("co")) {
				genre = "코미디";
			}else if(genre.equals("act")) {
				genre = "액션";
			}else if(genre.equals("fa")) {
				genre = "판타지";
			}else if(genre.equals("horror")) {
				genre = "공포";
			}
			list = boardservice.GenreAndCategory(genre, "리뷰", pageable);
		}else {
			if(genre.equals("ro")) {
				genre = "로맨스";
			}else if(genre.equals("co")) {
				genre = "코미디";
			}else if(genre.equals("act")) {
				genre = "액션";
			}else if(genre.equals("fa")) {
				genre = "판타지";
			}else if(genre.equals("horror")) {
				genre = "공포";
			}
//			list = boardservice.genreAndSearch(genre, keyword, pageable);
			list = boardservice.GenreAndCategoryAndTitle(genre, "리뷰", keyword, pageable);
		}
		
		// 현재페이지 가져오는 nowPage
		int nowPage = list.getPageable().getPageNumber()+1;
		
		//Math.max() 는 둘 중 큰걸 반환 min 은 반대
		int startPage = Math.max(nowPage - 4, 1);
		int endPage = Math.min(nowPage + 5, list.getTotalPages());
		
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		if(genre.equals("로맨스")) {
			genre = "ro";
		}else if(genre.equals("코미디")) {
			genre = "co";
		}else if(genre.equals("액션")) {
			genre = "act";
		}else if(genre.equals("판타지")) {
			genre = "fa";
		}else if(genre.equals("공포")) {
			genre = "horror";
		}
		return "genre/"+genre+"/list";
	}
	
	@RequestMapping("/{genre}_recom")
	public String recom(Model model,
			@PageableDefault(page = 0,size = 10, sort = "num", direction = Sort.Direction.DESC) Pageable pageable,
			String keyword,
			@PathVariable("genre") String genre) {
		
		
		Page<Board> list = null;
		
		if(keyword == null) {
			if(genre.equals("ro")) {
				genre = "로맨스";
			}else if(genre.equals("co")) {
				genre = "코미디";
			}else if(genre.equals("act")) {
				genre = "액션";
			}else if(genre.equals("fa")) {
				genre = "판타지";
			}else if(genre.equals("horror")) {
				genre = "공포";
			}
			list = boardservice.GenreAndCategory(genre, "추천", pageable);
		}else {
			if(genre.equals("ro")) {
				genre = "로맨스";
			}else if(genre.equals("co")) {
				genre = "코미디";
			}else if(genre.equals("act")) {
				genre = "액션";
			}else if(genre.equals("fa")) {
				genre = "판타지";
			}else if(genre.equals("horror")) {
				genre = "공포";
			}
			list = boardservice.GenreAndCategoryAndTitle(genre, "추천", keyword, pageable);
		}
		
		// 현재페이지 가져오는 nowPage
		int nowPage = list.getPageable().getPageNumber()+1;
		
		//Math.max() 는 둘 중 큰걸 반환 min 은 반대
		int startPage = Math.max(nowPage - 4, 1);
		int endPage = Math.min(nowPage + 5, list.getTotalPages());
		
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		if(genre.equals("로맨스")) {
			genre = "ro";
		}else if(genre.equals("코미디")) {
			genre = "co";
		}else if(genre.equals("액션")) {
			genre = "act";
		}else if(genre.equals("판타지")) {
			genre = "fa";
		}else if(genre.equals("공포")) {
			genre = "horror";
		}
		
		return "genre/"+genre+"/list";
	}
	
	@RequestMapping("/{genre}_info")
	public String Info(Model model,
			@PageableDefault(page = 0,size = 10, sort = "num", direction = Sort.Direction.DESC) Pageable pageable,
			String keyword,
			@PathVariable("genre") String genre) {
		
		
		Page<Board> list = null;
		
		if(keyword == null) {
			if(genre.equals("ro")) {
				genre = "로맨스";
			}else if(genre.equals("co")) {
				genre = "코미디";
			}else if(genre.equals("act")) {
				genre = "액션";
			}else if(genre.equals("fa")) {
				genre = "판타지";
			}else if(genre.equals("horror")) {
				genre = "공포";
			}
			list = boardservice.GenreAndCategory(genre, "정보", pageable);
		}else {
			if(genre.equals("ro")) {
				genre = "로맨스";
			}else if(genre.equals("co")) {
				genre = "코미디";
			}else if(genre.equals("act")) {
				genre = "액션";
			}else if(genre.equals("fa")) {
				genre = "판타지";
			}else if(genre.equals("horror")) {
				genre = "공포";
			}
			list = boardservice.GenreAndCategoryAndTitle(genre, "정보", keyword, pageable);
		}
		
		// 현재페이지 가져오는 nowPage
		int nowPage = list.getPageable().getPageNumber()+1;
		
		//Math.max() 는 둘 중 큰걸 반환 min 은 반대
		int startPage = Math.max(nowPage - 4, 1);
		int endPage = Math.min(nowPage + 5, list.getTotalPages());
		
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		if(genre.equals("로맨스")) {
			genre = "ro";
		}else if(genre.equals("코미디")) {
			genre = "co";
		}else if(genre.equals("액션")) {
			genre = "act";
		}else if(genre.equals("판타지")) {
			genre = "fa";
		}else if(genre.equals("공포")) {
			genre = "horror";
		}
		
		return "genre/"+genre+"/list";
	}
	
	
}
