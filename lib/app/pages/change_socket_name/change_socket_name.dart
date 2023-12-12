import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/widgets/circular_icon.dart';

import '../devices_page/devices.dart';

class ChangeSocketName extends StatefulWidget {
  const ChangeSocketName({super.key, this.socketNames});

  static const PageConfig pageConfig = PageConfig(
    icon: Icons.electrical_services,
    name: 'change_socket_name',
    child: ChangeSocketName(),
  );

  final List<String>? socketNames;

  @override
  State<ChangeSocketName> createState() => _ChangeSocketNameState();
}

class _ChangeSocketNameState extends State<ChangeSocketName> {
  @override
  Widget build(BuildContext context) {
    final  textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final TextEditingController socketNameController = TextEditingController();

    void updateSocketName(int index, String newName) {
      setState(() {
        widget.socketNames![index] = newName;
        debugPrint("Scoketname: ${widget.socketNames![index]}");
      });
    }

     return PopScope(
      canPop:false,
      onPopInvoked: (_) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final result = await prefs.setStringList('socket_names', widget.socketNames!);
        if(result){
         context.pop(widget.socketNames!);
        }
      },
      child: Scaffold(
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
                      ChangeSocketNameWidget(labelName: '1', initSocketName: widget.socketNames![0], onTextChanged: (value) => updateSocketName(0, value)),
                      SizedBox(height: 44),
                      ChangeSocketNameWidget(labelName: '2', initSocketName: widget.socketNames![1],  onTextChanged: (value) => updateSocketName(1, value)),
                      SizedBox(height: 44),
                      ChangeSocketNameWidget(labelName: '3', initSocketName: widget.socketNames![2],  onTextChanged: (value) => updateSocketName(2, value)),
                      SizedBox(height: 44),
                      ChangeSocketNameWidget(labelName: '4', initSocketName: widget.socketNames![3],  onTextChanged: (value) => updateSocketName(3, value)),
                      SizedBox(height: 44),
                      ChangeSocketNameWidget(labelName: '5', initSocketName: widget.socketNames![4],  onTextChanged: (value) => updateSocketName(4, value)),
                      SizedBox(height: 44),
                      ChangeSocketNameWidget(labelName: '6', initSocketName: widget.socketNames![5],  onTextChanged: (value) => updateSocketName(5, value)),
                      SizedBox(height: 44),
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}

class ChangeSocketNameWidget extends StatefulWidget {
  const ChangeSocketNameWidget({super.key, required this.labelName, required this.initSocketName, required this.onTextChanged});
  final String labelName;
  final String initSocketName;
  final Function onTextChanged;

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
    socketNameController.text = widget.initSocketName;
  }

  @override
  void dispose() {
    socketNameController.removeListener(handleSuffixIcon);
    super.dispose();
  }

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
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
               widget.onTextChanged(value);
              },
              controller: socketNameController,
              decoration:  InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nazwa gniazda",
                hintText: "Wpisz nazwę gniazda",
                suffixIcon: socketNameController.text.isNotEmpty
                    ? IconButton(
                  icon: Icon(Icons.cancel_outlined),
                  onPressed: () {
                    socketNameController.clear();
                    widget.onTextChanged(socketNameController.text);
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

