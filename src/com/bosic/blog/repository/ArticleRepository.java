package com.bosic.blog.repository;

import org.springframework.stereotype.Repository;

import com.bosic.blog.domain.Article;

@Repository
public class ArticleRepository extends GenericRepository<Article, Long> {
}
