import 'dart:io';
import 'package:math_expressions/math_expressions.dart';

void main() {
  print("=== CALCULADORA ===");
  print("Digite a expressão:");
  print("'Sair' para encerrar.\n");

// Substitui Parser()
  final parser = ShuntingYardParser();

  while (true) {
    stdout.write("Expressão: ");
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.trim().toLowerCase() == 'sair') {
      print("Encerrando...");
      break;
    }


    try {
      Expression exp = parser.parse(entrada);
      ContextModel cm = ContextModel();

      double resultado = exp.evaluate(EvaluationType.REAL, cm);

      // Tratamento de erro para verificar se o resultado é infinito ou não é um número
      if (resultado.isInfinite || resultado.isNaN) {
        print("Erro: divisão por zero ou operação inválida!\n");
      } else {
        print("Resultado: $resultado\n");
      }
    } catch (e) {
      print("Expressão inválida! Tente novamente.\n");
    }
  }
}
