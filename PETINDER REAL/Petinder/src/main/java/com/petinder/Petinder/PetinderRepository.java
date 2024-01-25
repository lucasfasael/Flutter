package com.petinder.Petinder;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface PetinderRepository extends MongoRepository<PetinderEntity, Integer>{
    
}
