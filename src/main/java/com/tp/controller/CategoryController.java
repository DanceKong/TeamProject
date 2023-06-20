package com.tp.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tp.DTO.CommentDTO;
import com.tp.entity.Board;
import com.tp.service.BoardService;
import com.tp.service.CommentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CategoryController {
	
	private final BoardService boardService;
	private final CommentService commentService;
	
	
	// 분류별 페이지로 이동
	@RequestMapping("/{category}_all")
	public String category(@PathVariable("category") String category, 
			Model model,
			@PageableDefault(page = 0,size = 10, sort = "num", direction = Sort.Direction.DESC) Pageable pageable,
			String keyword) {
		
		Page<Board> list = null;
		
		if(keyword == null) {
			if(category.equals("review")) {
				category = "리뷰";
			}else if(category.equals("recom")) {
				category = "추천";
			}else if(category.equals("info")) {
				category = "정보";
			}
			list = boardService.CategoryList(category, pageable);
		}else {
			if(category.equals("review")) {
				category = "리뷰";
			}else if(category.equals("recom")) {
				category = "추천";
			}else if(category.equals("info")) {
				category = "정보";
			}
			list = boardService.CategoryAndSearch(category, keyword, pageable);
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
		
		model.addAttribute("list", list);
		
		if(category.equals("리뷰")) {
			category = "review";
		}else if(category.equals("추천")) {
			category = "recom";
		}else if(category.equals("정보")) {
			category = "info";
		}
		
		
		return category + "/" + category;
	}

	@GetMapping("/review_save")
	public String reviewsave() {
		return "review/review_save";
	}

	@PostMapping("/review_save")
	public String reviewSave(Board board, MultipartFile file) throws Exception {
		boardService.save(board, file);
		return "redirect:/review";

	}

	// 리뷰 게시물 상세보기
	@RequestMapping("/{category}_content")
	public String review_content(@RequestParam("num") Long num, 
			Model model,
			@PathVariable("category") String category,
			HttpServletRequest req, 
			HttpServletResponse res, HttpSession session) {
		
		List<CommentDTO> commentDTOList = commentService.findAll(num);
		model.addAttribute("commentList", commentDTOList);
		
		viewCountUp(num, req, res);
		model.addAttribute("one", boardService.selectOne(num));

		if(session.getAttribute("listnum_mo") != null) {
	    	  session.setAttribute("listnum", 3);
	    	  session.removeAttribute("listnum_mo");
	      }else {
	    	  session.setAttribute("listnum", 1);
	      }
		return category + "/" + category + "_content";
	}
	
	// 리뷰 게시물 수정
	@GetMapping("{category}_modify")
	public String modify(@RequestParam("num") Long num,
			Model model,
			@PathVariable("category") String category, HttpSession session) {
		
	    model.addAttribute("one", boardService.selectOne(num));
	    session.setAttribute("listnum", 2);
	    
	    return category + "/" + category + "_modify";
	}

	// 리뷰 게시물 수정 후 확인
	@PostMapping("{category}_modify")
	public String modifyAfter(Board board, 
			MultipartFile file,
			@PathVariable("category") String category, HttpSession session) throws Exception {
		
		Timestamp now = new Timestamp(System.currentTimeMillis());
		board.setRegdate(now);
		
		session.setAttribute("listnum_mo", 2);
		boardService.save(board, file);
		return "redirect:/" + category + "_content?num=" + board.getNum();
	}
	
	//조회수 중복 방지 쿠키값 설정
    private void viewCountUp(Long num, HttpServletRequest req, HttpServletResponse res) {

        Cookie oldCookie = null;

        Cookie[] cookies = req.getCookies();
        System.out.println(cookies);
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("hit")) {
                    oldCookie = cookie;
                }
            }
        }

        if (oldCookie != null) {
            if (!oldCookie.getValue().contains("[" + num.toString() + "]")) {	
                boardService.viewCountUp(num);
                oldCookie.setValue(oldCookie.getValue() + "_[" + num + "]");	//숫자 온전히 검사하기 위해[]_[]

                oldCookie.setPath("/");				//모든 경로
                oldCookie.setMaxAge(60);			//시간설정
                res.addCookie(oldCookie);
            }
        } else {
            boardService.viewCountUp(num);
            Cookie newCookie = new Cookie("hit","[" + num + "]");
            newCookie.setPath("/");
            newCookie.setMaxAge(60);			
            res.addCookie(newCookie);
        }
    }



}
