import 'package:virtual_wallet_core/cliente/domain/cliente.dart';
import 'package:virtual_wallet_core/cliente/domain/cliente.repository.dart';
import 'package:virtual_wallet_core/contaCorrente/app/cmd/registrarNovaConta.cmd.dart';
import 'package:virtual_wallet_core/contaCorrente/app/contaCorrente.service.dart';

import 'cmd/criarConta.cmd.dart';

class ClienteService {
  final ContaCorrenteService contaCorrenteService;
  final ClienteRepository repository;

  ClienteService(this.contaCorrenteService, this.repository);

  void criarConta(RegistrarCliente cmd) {
    Cliente cliente = ClienteBuilder()
        .comNome(cmd.nome)
        .comTelefone(cmd.telefone)
        .comDocumento(cmd.documento)
        .comContaCorrente(contaCorrenteService.registrar(RegistrarNovaConta()))
        .build();
    repository.save(cliente);
  }
}
