import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen{(super.key)};

  @override
  Widget build(BuildContext content) {

    final List<Map<String, String>> serviceOrders = [
      {
        'id': 'OS-2026-001',
        'client': 'Lab de Informática 3',
        'status': 'Em Andamento',
        'desc': 'Matutenção preventiva dos computadores.',
      },
      {
        'id': 'OS-2026-002',
        'client': 'Secretaria Executiva',
        'status': 'Aberta',
        'desc': 'Configuração de nova sub-rede local.',
      },
      {
        'id': 'OS-2026-003',
        'client': 'Bloco Técnico B',
        'status': 'Concluída',
        'desc': 'Troca de switch e testes de patch panel.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TechService Home'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair do App',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const loginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(16.0)),
      
    );
  }
}