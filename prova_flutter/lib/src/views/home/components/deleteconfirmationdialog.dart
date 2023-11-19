import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final Function onConfirm;

  const DeleteConfirmationDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmar Exclusão'),
      content: const Text('Você tem certeza que deseja excluir este item?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fechar o popup
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop(); // Fechar o popup
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
