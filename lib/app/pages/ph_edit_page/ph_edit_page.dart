import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/domain/models/parameters_edit_page_model/parameters_edit_page_model.dart';
import 'package:sterownik_akwarium/app/pages/ph_edit_page/ph_edit_provider.dart';
import 'package:sterownik_akwarium/app/pages/water_temp_edit_page/water_temp_edit_provider.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_button.dart';
import 'package:sterownik_akwarium/app/pages/widgets/gauge.dart';

class PhEditPage extends ConsumerStatefulWidget {
  const PhEditPage({super.key, this.data});

  static const  pageConfig = PageConfig(
    icon: Icons.timer_rounded,
    name: 'ph_edit',
    child: PhEditPage(),
  );
  final ParametersEditPageModel? data;


  @override
  _PhEditPageState createState() => _PhEditPageState();
}

class _PhEditPageState extends ConsumerState<PhEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _setValueController = TextEditingController();
  final TextEditingController _histeresisController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _setValueController.text = widget.data!.minValue.toString();
    _histeresisController.text = widget.data!.maxValue.toString();
  }

  var setValueChanged;
  var histeresisMaxValueChanged;
  var histeresisMinValueChanged;
 late double phSetValue;
  late double phHisteresisMax;
  late double phHisteresisMin;
  @override
  Widget build(BuildContext context) {
    phSetValue = widget.data!.minValue;
    phHisteresisMin = widget.data!.minValue - widget.data!.maxValue;
    phHisteresisMax = widget.data!.minValue + widget.data!.maxValue;

    ref.listen(phEditProvider, (previous, next) {
      if(next is AsyncData){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Zapisano'),
              duration: Duration(seconds: 1),
            )
        );
        setState(() {
          setValueChanged = double.parse(_setValueController.text);
          var newHisteresis = double.parse(_histeresisController.text);
          double newHisteresisMin = setValueChanged - newHisteresis;
          histeresisMinValueChanged = double.parse(newHisteresisMin.toStringAsFixed(1));
          double newHisteresisMax = setValueChanged + newHisteresis;
          histeresisMaxValueChanged = double.parse(newHisteresisMax.toStringAsFixed(1));
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
                    HisteresisTextWidget(value: "${histeresisMinValueChanged ?? phHisteresisMin.toStringAsFixed(1)} ${widget.data!.unit}", labelName: 'Min',),
                    Gauge(
                        size: 200,
                        currentValue: widget.data!.currentValue,
                        minAlarmValue: histeresisMinValueChanged ?? phHisteresisMin,
                        maxAlarmValue: histeresisMaxValueChanged ?? phHisteresisMax,
                        unit: widget.data!.unit),
                    HisteresisTextWidget(value: "${histeresisMaxValueChanged ?? phHisteresisMax.toStringAsFixed(1)} ${widget.data!.unit}", labelName: 'Max',),
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
                              controller: _setValueController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Musisz wpisać wartość';
                                }
                                else if(double.tryParse(value)! < 0){
                                  return 'Wartość musi być dodatnia';
                                }
                                else if(double.tryParse(value)! > 1000){
                                  return 'Wartość zbyt duża';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Wartość zadana',
                                hintText: 'Wpisz wartość',
                                border: OutlineInputBorder(),
                              ),
                              // Add further customizations like validators here
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: TextFormField(
                              controller: _histeresisController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Musisz wpisać wartość';
                                }
                                else if(double.tryParse(value)! < 0){
                                  return 'Wartość musi być dodatnia';
                                }
                                else if(double.tryParse(value)! > 1000){
                                  return 'Wartość zbyt duża';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Histereza',
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
                              ref.read(phEditProvider.notifier).publish(widget.data!.endpoint, _setValueController.text, _histeresisController.text );

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
