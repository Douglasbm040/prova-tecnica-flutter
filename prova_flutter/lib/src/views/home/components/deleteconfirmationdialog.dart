import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final Function onConfirm;

  DeleteConfirmationDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirmar Exclusão'),
      content: Text('Você tem certeza que deseja excluir este item?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fechar o popup
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop(); // Fechar o popup
          },
          child: Text('Confirmar'),
        ),
      ],
    );
  }
}
