import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/domain/models/parameters_edit_page_model/parameters_edit_page_model.dart';
import 'package:sterownik_akwarium/app/pages/water_temp_edit_page/water_temp_edit_provider.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_button.dart';
import 'package:sterownik_akwarium/app/pages/widgets/gauge.dart';

class WaterTempEditPage extends ConsumerStatefulWidget {
  const WaterTempEditPage({super.key, this.data});

  static const  pageConfig = PageConfig(
    icon: Icons.timer_rounded,
    name: 'water_temp_edit',
    child: WaterTempEditPage(),
  );
  final ParametersEditPageModel? data;


  @override
  _WaterTempEditPageState createState() => _WaterTempEditPageState();
}

class _WaterTempEditPageState extends ConsumerState<WaterTempEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _minController.text = widget.data!.minValue.toString();
    _maxController.text = widget.data!.maxValue.toString();
  }

   var minValueChanged;
   var maxValueChanged;
  var  frequencyValueChanged;


  @override
  Widget build(BuildContext context) {
    ref.listen(publishProvider, (previous, next) {
      if(next is AsyncData){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Zapisano'),
              duration: Duration(seconds: 1),
            )
        );
        setState(() {
          minValueChanged = double.parse(_minController.text);
          maxValueChanged = double.parse(_maxController.text);
        });
      }
    });

final isPublishing = ref.watch(publishProvider).isLoading;
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
                        HisteresisTextWidget(value: "${minValueChanged ?? widget.data!.minValue} ${widget.data!.unit}", labelName: 'Min',),
                        Gauge(
                            size: 200,
                            currentValue: widget.data!.currentValue,
                            minAlarmValue: minValueChanged ?? widget.data!.minValue,
                            maxAlarmValue: maxValueChanged ?? widget.data!.maxValue,
                            unit: widget.data!.unit),
                        HisteresisTextWidget(value: "${maxValueChanged ?? widget.data!.maxValue} ${widget.data!.unit}", labelName: 'Max',),
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
                                    controller: _minController,
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
                                    controller: _maxController,
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
                               CustomButton(text: "Zapisz",isLoading: isPublishing,  onPressed: (){
                                 if (_formKey.currentState!.validate()) {
                                 ref.read(publishProvider.notifier).publish(widget.data!.endpoint, _minController.text, _maxController.text );

                                 }
                               },
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
