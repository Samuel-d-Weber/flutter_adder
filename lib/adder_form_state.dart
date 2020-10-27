import 'package:flutter/material.dart';
import 'adder_form.dart';
import 'adder.dart';

class AdderFormState extends State<AdderForm> {

  final _formKey = GlobalKey<FormState>();
  final controllera = TextEditingController();
  final controllerb = TextEditingController();
  final Adder adder = Adder();

  @override
  void dispose() {
    controllera.dispose();
    controllerb.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Column(
            children: [
              TextFormField(
                controller: controllera,
                key: Key('adder_field_a'),
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Por favor insira algo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controllerb,
                key: Key('adder_field_b'),
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Por favor insira algo';
                  }
                  return null;
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  adder.a = int.parse(controllera.text);
                  adder.b = int.parse(controllerb.text);
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          key: Key('adder_result'),
                          content: Text(adder.sum.toString()),
                        );
                      }
                  );
                }
              },
              child: Text('Somar'),
            ),
          )
        ],
      ),
    );
  }
}