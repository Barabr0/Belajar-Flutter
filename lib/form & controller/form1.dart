import 'package:flutter/material.dart';

class Formulir extends StatefulWidget {
  const Formulir({super.key});

  @override
  State<Formulir> createState() => _FormulirState();
}

class _FormulirState extends State<Formulir> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _formAlamatController = TextEditingController();
  final TextEditingController _formNamaController = TextEditingController();

  
  DateTime? selectedDate;
  String? _pilihanSeks = 'Laki-laki'; 

  String _outputNama = '';
  DateTime? _outputTanggal;
  String _outputGender = '';
  String _outputAlamat = '';


  @override
  void dispose() {
    _formAlamatController.dispose();
    _formNamaController.dispose();
    super.dispose();
  }

  void _submitForm() {
    setState(() {
      
      _outputNama = _formNamaController.text;
      _outputTanggal = selectedDate;
      _outputGender = _pilihanSeks ?? '-';
      _outputAlamat = _formAlamatController.text;
    });


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data berhasil disimpan!')),
    );

    _clearInput();
  }
  
  void _clearInput() {
    _formAlamatController.clear();
    _formNamaController.clear();
  }

  void _handleRadioValueChange(String? value) {
    setState(() {
      _pilihanSeks = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulir Biodata')),
      body: Center( 
        child: Padding(
          
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _formNamaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Lengkap tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030),
                        );

                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      },
                      child: const Text('Pilih Tanggal'),                  
                    ),
                    const SizedBox(width: 10),
                    Text(
                      selectedDate == null
                          ? 'Belum memilih tanggal'
                          : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                
                const Text('Jenis Kelamin:', style: TextStyle(fontWeight: FontWeight.bold)),
                RadioListTile<String>(
                  title: const Text('Laki-laki'),
                  value: 'Laki-laki',
                  groupValue: _pilihanSeks,
                  onChanged: _handleRadioValueChange, 
                ),
                RadioListTile<String>(
                  title: const Text('Perempuan'),
                  value: 'Perempuan',
                  groupValue: _pilihanSeks,
                  onChanged: _handleRadioValueChange, 
                ),
                const SizedBox(height: 10),
              TextFormField(
              controller: _formAlamatController,
              maxLines: 5, 
              minLines: 5, 
              keyboardType: TextInputType.multiline, 
              decoration: InputDecoration(
                hintText: 'Enter your text here...',
                border: OutlineInputBorder(), 
              ),
              validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                },
            ),
                const SizedBox(height: 10),
                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitForm();
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    child: const Text('Simpan'),
                  ),
                ),
                const SizedBox(height: 20),

                
                const Divider(thickness: 2),
                const Text(
                  "Biodata Terhitung:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Nama Lengkap : ${_outputNama.isEmpty ? '-' : _outputNama}',
                  style: const TextStyle(fontSize: 16), 
                ),
                Text(
                  'Tanggal Lahir : ${_outputTanggal == null ? '-' : 
                  "${_outputTanggal!.day}-${_outputTanggal!.month}-${_outputTanggal!.year}"}',
                  style: const TextStyle(fontSize: 16),
                ),
                
                Text(
                  'Kelamin : ${_outputGender.isEmpty ? '-' : _outputGender}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Alamat : ${_outputAlamat.isEmpty ? '-' : _outputAlamat}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
