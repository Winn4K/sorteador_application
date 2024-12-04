import 'package:flutter/material.dart';
import '../../Components/Header/header_home.dart';
import '../../Components/Footer/footer.dart';
import '../../Components/Header/header_home_view_model.dart';
import '../../Components/Footer/footer_view_model.dart';
import 'dart:math';

class HomeSorteadorSampleScreen extends StatefulWidget {
  @override
  _HomeSorteadorSampleScreenState createState() =>
      _HomeSorteadorSampleScreenState();
}

class _HomeSorteadorSampleScreenState extends State<HomeSorteadorSampleScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _numSorteiosController = TextEditingController();
  String? _resultado;
  int _numSorteios = 1;

  // Função para realizar o sorteio
  void _sortear() {
    final input = _textController.text;
    final valores = input.split(',').map((e) => e.trim()).toList();

    // Validação do número de sorteios (não pode ser maior que 10)
    if (_numSorteios > 10) {
      setState(() {
        _resultado = 'O número máximo de sorteios é 10.';
      });
      return;
    }

    // Validação do número de sorteios não pode ser maior que o número de valores fornecidos
    if (_numSorteios > valores.length) {
      setState(() {
        _resultado = 'O número de sorteios não pode ser maior que o número de valores fornecidos.';
      });
      return;
    }

    // Validação do número de sorteios
    if (_numSorteios <= 0) {
      setState(() {
        _resultado = 'Por favor, insira um número válido de itens a serem sorteados.';
      });
      return;
    }

    if (valores.isNotEmpty && valores.any((element) => element.isNotEmpty)) {
      List<String> sorteados = [];
      List<String> valoresDisponiveis = List.from(valores); // Copia a lista de valores

      // Realiza o número de sorteios informado pelo usuário
      for (int i = 0; i < _numSorteios; i++) {
        if (valoresDisponiveis.isEmpty) {
          setState(() {
            _resultado = 'Não há mais valores disponíveis para sorteio.';
          });
          return;
        }
        final sorteado = valoresDisponiveis[Random().nextInt(valoresDisponiveis.length)];
        sorteados.add(sorteado);
        valoresDisponiveis.remove(sorteado); // Remove o valor sorteado da lista
      }

      setState(() {
        _resultado = sorteados.join('\n'); // Cada valor em uma nova linha
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira valores separados por vírgula.';
      });
    }
  }

  // Função para limpar a caixa de texto
  void _limpar() {
    setState(() {
      _textController.clear();
      _numSorteiosController.clear();
      _resultado = null;
    });
  }

  // Função para alterar o número de sorteios com base na entrada
  void _atualizarNumeroSorteios() {
    final int? numero = int.tryParse(_numSorteiosController.text);
    if (numero != null && numero > 0) {
      setState(() {
        _numSorteios = numero;
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira um número válido.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header com o título "SORTEADOR"
          HeaderHome(
            viewModel: HeaderHomeViewModel(title: 'SORTEADOR'),
          ),

          // Caixa de texto para o número de sorteios
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Número de Sorteios:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _numSorteiosController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Digite o número de itens a serem sorteados',
                  ),
                  onChanged: (text) => _atualizarNumeroSorteios(),
                ),
              ],
            ),
          ),

          // Caixa de texto para os itens a serem sorteados
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _textController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Insira valores separados por vírgula',
                    ),
                    onChanged: (text) {
                      // Limpa os resultados quando a caixa de texto for limpa
                      if (text.isEmpty) {
                        _limpar();
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Botão "Sortear"
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: _sortear,
                    child: const Text(
                      'Sortear',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  // Resultado do sorteio
                  if (_resultado != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título alinhado à esquerda com a mesma cor laranja
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Resultado(s):',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange, // Cor laranja
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),

                        // Resultados sorteados centralizados com a mesma cor laranja
                        Center(
                          child: Text(
                            _resultado!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange, // Cor laranja
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),

          // Footer com texto de copyright
          Footer(
            viewModel: FooterViewModel(copyright: '© 2024 Sorteador App'),
          ),
        ],
      ),
    );
  }
}
