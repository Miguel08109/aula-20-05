import 'package:flutter/material.dart';
import '../model/ServiceOrder.dart';

class CadastroOrderModal extends StatefulWidget {
  const CadastroOrderModal({super.key});

  @override
  State<CadastroOrderModal> createState() => _CadastroOrderModalState();

  }


  class _CadastroOrderModalState extends State<CadastroOrderModal> { 
    _formKey = GlobalKey<FormState>();

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
    
  }}
}