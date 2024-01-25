package com.petinder.Petinder;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;



@Document
public class PetinderEntity {
    @Id
    public String id;
    public String nome;
    public String image;
    public String sexo;
    public String raca;
    public PetinderEntity(String nome, String image, String sexo, String raca) {
        this.nome = nome;
        this.image = image;
        this.sexo = sexo;
        this.raca = raca;
    }
}
