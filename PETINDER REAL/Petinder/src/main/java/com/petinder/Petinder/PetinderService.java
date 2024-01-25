package com.petinder.Petinder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetinderService {
    @Autowired
    PetinderRepository petinderRepository;

    public void save(PetinderEntity petinderEntity) {
        petinderRepository.save(petinderEntity);
    }

    public List<PetinderEntity> list() {
        return petinderRepository.findAll();
    }
}
