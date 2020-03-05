import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';
const _rotuloCampoValor = 'Número da conta';
const _dicaCampoValor = '0000';

const _rotuloCampoNumeroConta = 'Valor';
const _dicaCampoNumeroConta = '0.00';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTranferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTranferenciaState();
  }
}

class FormularioTranferenciaState extends State<FormularioTranferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: _rotuloCampoNumeroConta,
            dica: _dicaCampoNumeroConta,
            icone: Icons.monetization_on,
          ),
          RaisedButton(
            onPressed: () => _criaTransferencia(context),
            child: Text(_textoBotaoConfirmar),
          ),
        ],
      )),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
