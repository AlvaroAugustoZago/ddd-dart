import 'package:meta/meta.dart';

import 'documento.dart';
import 'nome.dart';
import 'telefone.dart';

@immutable
class Cliente {
  final Nome nome;
  final Documento documento;
  final Telefone telefone;

  const Cliente(this.nome, this.documento, this.telefone);

  static Cliente from(Nome nome, Documento documento, Telefone telefone) {
    return new Cliente(nome, documento, telefone);
  }
}
