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
public class GenreController {

	private final BoardService boardservice;
	private final CommentService commentService;
	

	// 카테고리별
	@RequestMapping("/{genre}")
	public String join(@PathVariable("genre") String genre,
			Model model,
			@PageableDefault(page = 0, size = 10, sort = "num", direction = Sort.Direction.DESC) Pageable pageable,
			String keyword) {
		if(genre.equals(genre)) {
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
			}
			else {
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
		return "board/list";
	}
	
	@RequestMapping("/{genre}_contents")
	public String review_content(@RequestParam("num") Long num, 
			Model model,
			@PathVariable("genre") String genre,
			HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		
		List<CommentDTO> commentDTOList = commentService.findAll(num);
		model.addAttribute("commentList", commentDTOList);		
		
		viewCountUp(num, req, res);
		
		model.addAttribute("one", boardservice.selectOne(num));
		if(session.getAttribute("listnum_mo") != null) {
	    	  session.setAttribute("listnum", 3);
	    	  session.removeAttribute("listnum_mo");
	      }else {
	    	  session.setAttribute("listnum", 1);
	      }
		return "genre/" + genre + "/" + genre+ "_content";
	}
	
	
	@GetMapping("/{genre}_modifi")
	public String modify(@RequestParam("num") Long num,
			Model model,
			@PathVariable("genre") String genre, HttpSession session) {
		
		model.addAttribute("one", boardservice.selectOne(num));
		session.setAttribute("listnum", 2);
		
		return "genre/" + genre + "/" + genre + "_modify";
	}
	
	@PostMapping("/{genre}_modifi")
	public String modifyAfter(@PathVariable("genre") String genre,
			Board board,
			MultipartFile file, HttpSession session) throws Exception {
		
		Timestamp now = new Timestamp(System.currentTimeMillis());
		board.setRegdate(now);
		
		boardservice.save(board, file);
		session.setAttribute("listnum_mo", 2);
		return "redirect:/" + genre + "_contents?num=" + board.getNum();
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
                boardservice.viewCountUp(num);
                oldCookie.setValue(oldCookie.getValue() + "_[" + num + "]");	//숫자 온전히 검사하기 위해[]_[]

                oldCookie.setPath("/");				//모든 경로
                oldCookie.setMaxAge(60);			//시간설정
                res.addCookie(oldCookie);
            }
        } else {
            boardservice.viewCountUp(num);
            Cookie newCookie = new Cookie("hit","[" + num + "]");
            newCookie.setPath("/");
            newCookie.setMaxAge(60);			
            res.addCookie(newCookie);
        }
    }
//  //게시물 상세보기
//  	@RequestMapping("/co_content")
//  	public String content(@RequestParam("num") Long num,
//  			Model model,
//  			HttpServletRequest req, 
//  			HttpServletResponse res) {
//  		
//  		viewCountUp(num, req, res);
//  		model.addAttribute("one", boardservice.selectOne(num));
//  		
//  		return "genre/co/content";
//  	}

}
