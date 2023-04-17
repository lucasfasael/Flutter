import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DogEntity {
  String id;
  String nome;
  String image;
  String sexo;
  String raca;
  DogEntity({
    required this.id,
    required this.nome,
    required this.image,
    required this.sexo,
    required this.raca,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'image': image,
      'sexo': sexo,
      'raca': raca,
    };
  }

  factory DogEntity.fromMap(Map<String, dynamic> map) {
    return DogEntity(
      id: map['id'] as String,
      nome: map['nome'] as String,
      image: map['image'] as String,
      sexo: map['sexo'] as String,
      raca: map['raca'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DogEntity.fromJson(String source) => DogEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
