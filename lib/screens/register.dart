import 'package:flutter/material.dart';
import 'package:lab3inputinfo/models/branch.dart';
import 'package:lab3inputinfo/models/faculty.dart';
import 'package:lab3inputinfo/models/subject.dart';
import 'package:lab3inputinfo/models/year.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _stdID = TextEditingController();
  // Radio button for select year
  String? groupYear;
  List<YearStudy>? years;

  // Radio button for select Branch
  String? groupBranch;
  List<Branch>? branches;

  // Checkbox
  List<Subject>? subjects;
  List subjectChecked = [];

  // Dropdown
  List<Faculty>? faculties = Faculty.getFaculty();
  late List<DropdownMenuItem<Faculty>> _dropdownMenuItem;
  late Faculty? _selectedFacultyItem;

  @override
  void initState() {
    super.initState();

    years = YearStudy.getYear();
    branches = Branch.getBranch();
    _dropdownMenuItem = buildDropdownMenuItem(faculties);
    _selectedFacultyItem = null;
    subjects = Subject.getSubject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 36),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              firstNameTextfield(),
              SizedBox(height: 16),
              lastNameTextfield(),
              SizedBox(height: 16),
              stdIdTextfield(),
              SizedBox(height: 16),
              Text(
                'ชั้นปีที่กำลังศึกษา',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Column(
                children: buildRadioYear(),
              ),
              SizedBox(height: 16),
              Text(
                'หลักสูตรที่ศึกษา',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Column(
                children: buildRadioBranch(),
              ),
              SizedBox(height: 16),
              Text(
                'คณะ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Center(
                child: Container(
                  width: 300,
                  child: DropdownFaculty(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'วิชาที่ชื่นชอบ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Column(
                children: buildSubjectCheckbox(),
              ),
              SizedBox(height: 32),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => buildSheet(),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildSheet() => Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'ชื่อ : ${_firstname.text} ${_lastname.text}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Text(
                'รหัสนิสิต : ${_stdID.text}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Text(
                'คณะ : ${_selectedFacultyItem!.facultyThName}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Text(
                'สาขา : ${groupBranch} ปี ${groupYear}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Text(
                'วิชาที่ชอบ : ${subjectChecked}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      );

  List<Widget> buildSubjectCheckbox() {
    List<Widget> listSubject = [];

    for (var subject in subjects!) {
      listSubject.add(
        CheckboxListTile(
          title: Text(subject.subjectThName!),
          subtitle: Text(subject.subjectEngName!),
          value: subject.checked,
          onChanged: (value) {
            setState(() {
              subject.checked = value;
            });
            if (value!) {
              subjectChecked.add(subject.subjectThName);
            } else {
              subjectChecked.remove(subject.subjectThName);
            }
            // print(checkedDrink);
          },
        ),
      );
    }
    return listSubject;
  }

  DropdownButton<Faculty> DropdownFaculty() {
    return DropdownButton(
      hint: Text('เลือกคณะที่สังกัด '),
      items: _dropdownMenuItem,
      value: _selectedFacultyItem,
      isExpanded: true,
      borderRadius: BorderRadius.all(Radius.circular(6)),
      onChanged: (Faculty? value) {
        setState(() {
          _selectedFacultyItem = value!;
        });
      },
    );
  }

  List<Widget> buildRadioBranch() {
    List<Widget> listbranches = [];
    for (var branch in branches!) {
      listbranches.add(RadioListTile<dynamic>(
        title: Text(branch.branchThName!),
        subtitle: Text(branch.branchEngName!),
        value: branch.branchValue,
        groupValue: groupBranch,
        onChanged: (value) {
          setState(() {
            groupBranch = value;
          });
        },
      ));
    }
    return listbranches;
  }

  List<Widget> buildRadioYear() {
    List<Widget> listyear = [];
    for (var year in years!) {
      listyear.add(RadioListTile<dynamic>(
        title: Text(year.yearStudy!),
        value: year.yearValue,
        groupValue: groupYear,
        onChanged: (value) {
          setState(() {
            groupYear = value;
          });
        },
      ));
    }
    return listyear;
  }

  Widget firstNameTextfield() {
    return TextFormField(
      controller: _firstname,
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณาป้อนชื่อ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'ชื่อ',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget lastNameTextfield() {
    return TextFormField(
      controller: _lastname,
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณาป้อนนามสกุล';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'นามสกุล',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget stdIdTextfield() {
    return TextFormField(
      controller: _stdID,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'กรุณาป้อนรหัสนิสิต';
        } else if (value.length != 9) {
          return 'รหัวนิสิตต้องมีตัวเลข 9 ตัว';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'รหัสนิสิต',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  List<DropdownMenuItem<Faculty>> buildDropdownMenuItem(
      List<Faculty>? faculties) {
    List<DropdownMenuItem<Faculty>> items = [];
    for (var item in faculties!) {
      items.add(
        DropdownMenuItem(
          child: Text(item.facultyThName!),
          value: item,
        ),
      );
    }
    return items;
  }
}
