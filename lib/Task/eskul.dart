import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:throught_1/helpers/size_helper.dart';
import 'package:throught_1/pages/eskul_output.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';

class EskulForm extends StatefulWidget {
  const EskulForm({super.key});

  @override
  State<EskulForm> createState() => _EskulFormState();
}

class _EskulFormState extends State<EskulForm> {
  final _Formkey = GlobalKey<FormState>();
  final maskFormatter = MaskTextInputFormatter(
    mask: '(+##) ###-####-#####', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
  );

  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController kelasController = TextEditingController();
  TextEditingController tglDaftarController = TextEditingController();

  String _pilihKelas = "";
  String? _eskulError;   

  final List<String> kelas = [
    "X",
    "XI",
    "XII",
  ];

  String _pilihEskul = "";
  final Map<String,bool> eskul = {
    "English Club" : false,
    "Band" : false,
    "Science Club" : false,
    "Futsal" : false,
    "Voli" : false,
    "Bola Basket" : false,
  };
  
  @override
  void initState(){
    super.initState();
    tglDaftarController.text = "";    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
         child: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _Formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Formulir Eskul",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 18),

                      TextFormField(
                        controller: namaLengkapController,
                        decoration: InputDecoration(
                          hintText: "Nama Lengkap",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Nomor';
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),
                      TextFormField(
                        controller: nomorController,
                        keyboardType: TextInputType.numberWithOptions(),
                        inputFormatters: [maskFormatter],
                        decoration: InputDecoration(
                          hintText: "Nomor Telepon",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Nomor Telepon';
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                       TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@") || !value.contains(".com")) return 'Input Email dengan benar';
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Pilih Kelas",
                          border: OutlineInputBorder(),
                        ),
                        items: kelas
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _pilihKelas = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih kelas';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24),

                      Text(
                        "Eskul (Maximal 2)",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      
                      ...eskul.keys.map((key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: eskul[key],
                          onChanged: (value) {
                          setState(() {
                            int jumlahTerpilih = eskul.values.where((v) => v == true).length;

                            if (value == true && jumlahTerpilih >= 2) {
                              _eskulError = "Maksimal pilih 2 eskul!";
                              return;   
                            }

                            eskul[key] = value!;

                            if (eskul.values.any((v) => v == true)) {
                              _eskulError = null;
                            }
                          });
                        },
                        );
                      }).toList(),

                      const SizedBox(height: 24),

                       TextFormField(
                        controller: tglDaftarController,
                        decoration: InputDecoration(
                          hintText: "Tanggal Daftar",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Input Tanggal Lahir';
                          }
                          return null;
                        },
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              tglDaftarController.text = DateFormat('yyyy-MM-dd')
                                  .format(pickedDate);
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 18),
                      SizedBox(
                        width: displayWidth(context) * 0.8,
                        height: displayHeight(context) * 0.075,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _submit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
  
  void _submit() {
  final isValid = _Formkey.currentState!.validate();
  
  String eskulTerpilihString = eskul.keys
      .where((key) => eskul[key] == true)
      .join(', ');
      
  if (eskulTerpilihString.isEmpty) {
    setState(() {
      _eskulError = "Silakan pilih minimal 1 eskul!";
    });
    return; 
  }
  if (isValid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputEskulScreen(
          namaLengkap: namaLengkapController.text,
          nomor: nomorController.text,
          email: emailController.text,
          tglDaftar: tglDaftarController.text,
          kelas: _pilihKelas,
          eskul: eskulTerpilihString,
        ),
      ),
    );
  }
}
}