package com.petinder.Petinder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/petinder")
public class PetinderController {

    @Autowired
    PetinderService petinderService;

    @GetMapping
    public List<PetinderEntity> list() {
        return petinderService.list();
    }

    @PostMapping
    public void save(@RequestBody PetinderEntity petinderEntity) {
        petinderService.save(petinderEntity);
    }
}
