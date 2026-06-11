import 'package:flutter/material.dart';
import '../model/ServiceOrder.dart';

class CadastroOrderModal extends StatefulWidget {
  const CadastroOrderModal({super.key});

  @override
  State<CadastroOrderModal> createState() => _CadastroOrderModalState();

  }


  class _CadastroOrderModalState extends State<CadastroOrderModal> { 
    final _formKey = GlobalKey<FormState>();

    final _ClientController = TextEditingController();
    final _descController = TextEditingController();
    
    String _statusSelecionado = 'Aberta';
    
    
    @override
  void dispose() {
    _ClientController.dispose();
    _descController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: bottomInset + 20,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nova Ordem de Serviço',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),

              TextFormField(
                controller: _ClientController,
                decoration: const InputDecoration(
                  labelText: 'Cliente / local',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.business),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por Favor, insira o cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: 'Descrição do Problema/Serviço',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por Favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),


              DropdownButtonFormField<String>(
                initialValue: _statusSelecionado,
                decoration: const InputDecoration(
                  labelText: 'Status Inicial',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.info_outline),
                ),
                items: ['Aberta', 'Em Andamento', 'Concluída']
                  .map(
                    (status) =>
                      DropdownMenuItem(value: status, child: Text(status)),
                  )
                  .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _statusSelecionado = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 24),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final novaOrdem = ServiceOrder(
                      id: 'OS-2026-${DateTime.now()
                      .microsecondsSinceEpoch.toString().substring(9)}',
                      client: _ClientController.text,
                      status: _statusSelecionado,
                      desc: _descController.text,
                    );

                    Navigator.pop(context, novaOrdem);
                  }
                },
                child: const Text(
                  'Salvar Ordem',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}