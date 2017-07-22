package com.bosic.blog.repository;

import org.springframework.stereotype.Repository;

import com.bosic.blog.domain.Topic;

@Repository
public class TopicRepository extends GenericRepository<Topic, Long> {
}
