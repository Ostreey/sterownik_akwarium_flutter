import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/widgets/circular_icon.dart';

import '../devices_page/devices.dart';

class ChangeSocketName extends StatelessWidget {
  const ChangeSocketName({super.key});
  static const PageConfig pageConfig = PageConfig(
    icon: Icons.electrical_services,
    name: 'change_socket_name',
    child: ChangeSocketName(),
  );

  @override
  Widget build(BuildContext context) {
    final  colorTheme = Theme.of(context).colorScheme;
    final  textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final TextEditingController socketNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Zmień nazwę gniazda"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.07),
            child: Column(
              children: [
                SizedBox(height: 27,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Gniazda", style: textTheme!.titleLarge),
                    SizedBox(height: 15,),
                    ChangeSocketNameWidget(labelName: '1'),
                    SizedBox(height: 44),
                    ChangeSocketNameWidget(labelName: '2'),
                    SizedBox(height: 44),
                    ChangeSocketNameWidget(labelName: '3'),
                    SizedBox(height: 44),
                    ChangeSocketNameWidget(labelName: '4'),
                    SizedBox(height: 44),
                    ChangeSocketNameWidget(labelName: '5'),
                    SizedBox(height: 44),
                    ChangeSocketNameWidget(labelName: '6'),
                    SizedBox(height: 44),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}

class ChangeSocketNameWidget extends StatefulWidget {
  const ChangeSocketNameWidget({super.key, required this.labelName});
  final String labelName;

  @override
  State<ChangeSocketNameWidget> createState() => _ChangeSocketNameWidgetState();
}

class _ChangeSocketNameWidgetState extends State<ChangeSocketNameWidget> {
  final TextEditingController socketNameController = TextEditingController();
  final isSuffixIconVisible = false;
  @override
  void initState() {
    super.initState();
    socketNameController.addListener(handleSuffixIcon);
  }

  @override
  void dispose() {
    socketNameController.removeListener(handleSuffixIcon);
    super.dispose();
  }

  // Callback function to print the latest value
  void handleSuffixIcon() {
    socketNameController.text.isNotEmpty ? isSuffixIconVisible : !isSuffixIconVisible;
    setState(() {
      isSuffixIconVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircularIcon(labelName: widget.labelName),
          SizedBox(width: 10), // Add spacing between CircularIcon and TextFormField
          Expanded(
            child: TextFormField(
              controller: socketNameController,
              decoration:  InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nazwa gniazda',
                hintText: "Wpisz nazwę gniazda",
                suffixIcon: socketNameController.text.isNotEmpty
                    ? IconButton(
                  icon: Icon(Icons.cancel_outlined),
                  onPressed: () {
                    socketNameController.clear();
                  },
                )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

