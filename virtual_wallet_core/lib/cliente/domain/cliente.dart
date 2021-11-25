import 'package:meta/meta.dart';
import 'package:virtual_wallet_core/contaCorrente/domain/contaCorrente.dart';

import 'documento.dart';
import 'nome.dart';
import 'telefone.dart';

@immutable
class Cliente {
  final Nome nome;
  final Documento documento;
  final Telefone telefone;
  final ContaCorrente contaCorrente;

  Cliente._builder(ClienteBuilder builder)
      : nome = builder.nome,
        documento = builder.documento,
        telefone = builder.telefone,
        contaCorrente = builder.contaCorrente;
}

class ClienteBuilder {
  Nome nome;
  Documento documento;
  Telefone telefone;
  ContaCorrente contaCorrente;

  ClienteBuilder comNome(Nome nome) {
    this.nome = nome;
    return this;
  }

  ClienteBuilder comDocumento(Documento documento) {
    this.documento = documento;
    return this;
  }

  ClienteBuilder comTelefone(Telefone telefone) {
    this.telefone = telefone;
    return this;
  }

  ClienteBuilder comContaCorrente(ContaCorrente contaCorrente) {
    this.contaCorrente = contaCorrente;
    return this;
  }

  Cliente build() {
    return Cliente._builder(this);
  }
}
