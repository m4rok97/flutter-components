import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _date = '';
  String _selectedPower = 'Super Force';
  TextEditingController _inputFieldDateController = new TextEditingController();
  List<String> _powers = ['Super Force', 'Super Jump', 'Invisibility'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          children: <Widget>[
            _createNameInput(),
            Divider(),
            _createEmailInput(),
            Divider(),
            _createPasswordInput(),
            Divider(),
            _createDate(context),
            Divider(),
            _createDropDown(),
            Divider(),
            _createNameTile(),
          ]),
    );
  }

  Widget _createNameInput() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          counter: Text('${_name.length}'),
          icon: Icon(Icons.account_circle),
          labelText: 'Name',
          helperText: 'Your name',
          hintText: 'John Doe',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          suffixIcon: Icon(Icons.accessibility)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createNameTile() {
    return ListTile(
      title: Text('The name is $_name'),
      trailing: Text('Has power $_selectedPower'),
    );
  }

  Widget _createEmailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: 'Email',
          helperText: 'Your email',
          hintText: 'jonh@gmail',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          suffixIcon: Icon(Icons.alternate_email)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPasswordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock),
          labelText: 'Password',
          helperText: 'Your password',
          hintText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          suffixIcon: Icon(Icons.lock_open)),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      decoration: InputDecoration(
          icon: Icon(Icons.lock),
          labelText: 'Birth Date',
          helperText: '13/05/97',
          hintText: 'Birth Date',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          suffixIcon: Icon(Icons.lock_open)),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025));
    if (pickedDate != null) {
      setState(() {
        _date = pickedDate.toString().substring(0, 10);
        _inputFieldDateController.text = _date;
      });
    }
  }

  Widget _createDropDown() {
    List<DropdownMenuItem<String>> _itemsList = [];
    _powers.forEach((power) {
      _itemsList.add(new DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: DropdownButton(
              value: _selectedPower,
              items: _itemsList,
              onChanged: (opt) {
                _selectedPower = opt;
              }),
        ),
      ],
    );
  }
}
