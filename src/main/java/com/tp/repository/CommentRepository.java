package com.tp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tp.entity.Board;
import com.tp.entity.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long>{

	List<Comment> findAllByBoardOrderByIdDesc(Board board);
}
