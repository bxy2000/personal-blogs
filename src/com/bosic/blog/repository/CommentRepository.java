package com.bosic.blog.repository;

import org.springframework.stereotype.Repository;

import com.bosic.blog.domain.Comment;

@Repository
public class CommentRepository extends GenericRepository<Comment, Long> {
}
