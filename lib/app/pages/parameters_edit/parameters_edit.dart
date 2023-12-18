import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/widgets/gauge.dart';

class ParametersEditPage extends StatefulWidget {
  const ParametersEditPage({super.key});
  static const  pageConfig = PageConfig(
    icon: Icons.timer_rounded,
    name: 'edit_parameters',
    child: ParametersEditPage(),
  );

  @override
  State<ParametersEditPage> createState() => _ParametersEditPageState();
}

class _ParametersEditPageState extends State<ParametersEditPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperatura wody'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Gauge(
                        currentValue: 25,
                        minAlarmValue: 13,
                        maxAlarmValue: 28,
                        unit: "C"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: _formKey, // Associate the form key with the Form widget
                    child:
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Musisz wpisać wartość';
                                      }
                                      else if(double.tryParse(value)! < 0){
                                        return 'Wartość musi być dodatnia';
                                      }
                                      else if(double.tryParse(value)! > 50){
                                        return 'Wartość zbyt duża';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Włącz przy',
                                      hintText: 'Wpisz wartość',
                                      border: OutlineInputBorder(),
                                    ),
                                    // Add further customizations like validators here
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Musisz wpisać wartość';
                                      }
                                      else if(double.tryParse(value)! < 0){
                                        return 'Wartość musi być dodatnia';
                                      }
                                      else if(double.tryParse(value)! > 50){
                                        return 'Wartość zbyt duża';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Włącz przy',
                                      hintText: 'Wpisz wartość',
                                      border: OutlineInputBorder(),
                                    ),
                                    // Add further customizations like validators here
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: (){
                                      if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Processing Data')),
                                        );
                                      }
                                    },
                                    child: Text("Zapisz")
                                ),
                              ],
                            ),
                          ],
                        ),

                  ),

                ],
              )),
        ),
      ),
    );
  }
}
