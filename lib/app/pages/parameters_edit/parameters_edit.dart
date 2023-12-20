import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/domain/models/parameters_edit_page_model/parameters_edit_page_model.dart';
import 'package:sterownik_akwarium/app/pages/widgets/gauge.dart';

class ParametersEditPage extends StatefulWidget {
  const ParametersEditPage({super.key, this.data});

  static const  pageConfig = PageConfig(
    icon: Icons.timer_rounded,
    name: 'edit_parameters',
    child: ParametersEditPage(),
  );
  final ParametersEditPageModel? data;

  @override
  State<ParametersEditPage> createState() => _ParametersEditPageState();
}

class _ParametersEditPageState extends State<ParametersEditPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.data!.appBarTitle),
      ),
      body: SafeArea(
        child:  Padding(
              padding: EdgeInsets.all(20),
              child: Column(

                children: [
                 Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HisteresisTextWidget(value: "${widget.data!.minValue} ${widget.data!.unit}", labelName: 'Min',),
                        Gauge(
                            size: 200,
                            currentValue: widget.data!.currentValue,
                            minAlarmValue: widget.data!.minValue,
                            maxAlarmValue: widget.data!.maxValue,
                            unit: widget.data!.unit),
                        HisteresisTextWidget(value: "${widget.data!.maxValue} ${widget.data!.unit}", labelName: 'Max',),
                      ],
                    ),
                  SizedBox(
                    height: 45,
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
    );
  }
}

class HisteresisTextWidget extends StatelessWidget {
  const HisteresisTextWidget({
    super.key, required this.value, required this.labelName,
  });
  final String labelName;
  final String value;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorTheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(labelName),
        Text(value,style: textTheme.bodyLarge!.copyWith(color: colorTheme.primary)),
      ],
    );
  }
}
