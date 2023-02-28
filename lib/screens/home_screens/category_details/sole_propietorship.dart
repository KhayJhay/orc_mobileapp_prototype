import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:registrar_general_prototype/apis/payment_api.dart';
import 'package:registrar_general_prototype/utils/constants.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:multiselect/multiselect.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:date_field/date_field.dart';

class SoleProprietorship_Registration extends StatefulWidget {
  const SoleProprietorship_Registration({
    Key? key,
    this.pageTitle,
  }) : super(key: key);

  final String? pageTitle;

  @override
  State<SoleProprietorship_Registration> createState() =>
      _SoleProprietorship_RegistrationState();
}

class _SoleProprietorship_RegistrationState
    extends State<SoleProprietorship_Registration> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole = 'Writer';
  String? selectedComp = 'Reader';
  bool isLoading = false;
  final T = TextEditingController();
  final TextEd = TextEditingController();
  final TextEditingController title = TextEditingController();
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    final dropdown = DropDownTextField(
      initialValue: "Mr.",
      listSpace: 20,
      textFieldDecoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Title',
      ),
      listPadding: ListPadding(top: 20),
      enableSearch: false,
      validator: (value) {
        if (value == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      dropDownList: const [
        DropDownValueModel(name: 'Mr.', value: "Mr."),
        DropDownValueModel(name: 'Mrs', value: "Mrs"),
        DropDownValueModel(name: 'Miss', value: "Miss"),
        DropDownValueModel(name: 'Ms', value: "Ms"),
        DropDownValueModel(name: 'Dr', value: "Dr"),
      ],
      listTextStyle:
          const TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium'),
      dropDownItemCount: 3,
      onChanged: (val) {
        title.text = val.toString();
      },
    );

    final dropdownBOP = DropDownTextField(
      initialValue: "Apply for BOP Now",
      listSpace: 20,
      textFieldDecoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Bop Priority',
      ),
      listPadding: ListPadding(top: 20),
      enableSearch: false,
      validator: (value) {
        if (value == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      dropDownList: const [
        DropDownValueModel(
            name: 'Apply for BOP Now', value: "Apply for BOP Now"),
        DropDownValueModel(
            name: 'Apply for BOP Later', value: "Apply for BOP Later"),
        DropDownValueModel(
            name: 'Already have a BOP', value: "Already have a BOP"),
      ],
      listTextStyle:
          const TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium'),
      dropDownItemCount: 3,
      onChanged: (val) {
        title.text = val.toString();
      },
    );

    final isicCode = DropDownTextField(
      initialValue: "Apply for BOP Now",
      listSpace: 20,
      textFieldDecoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Bop Priority',
      ),
      listPadding: ListPadding(top: 20),
      enableSearch: false,
      validator: (value) {
        if (value == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      dropDownList: const [
        DropDownValueModel(
            name: 'Apply for BOP Now', value: "Apply for BOP Now"),
        DropDownValueModel(
            name: 'Apply for BOP Later', value: "Apply for BOP Later"),
        DropDownValueModel(
            name: 'Already have a BOP', value: "Already have a BOP"),
      ],
      listTextStyle:
          const TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium'),
      dropDownItemCount: 3,
      onChanged: (val) {
        title.text = val.toString();
      },
    );

    final selectSectors = DropDownMultiSelect(
      onChanged: (List<String> x) {
        setState(() {
          selected = x;
        });
      },
      options: const [
        'Legal',
        'Education',
        'Utilities',
        'Tourism',
        'Quary/Mining',
        'Insurance',
        'Agriculture',
        'Oil & Gas',
        'Construction',
        'Telecom / ICT',
        'Estate/Housing',
        'Entertainment',
        'Food Industry',
        'Manufacturing',
        'Pharmaceutical'
            'Security',
        'Media',
        'Shipping & Port',
        'Hospitality',
        'Health Care',
        'Security / Brokers',
        'Commerce / Trading',
        'Banking and Finance',
        'Sanitation',
        'Transportation / Aerospace',
        'fashion / Beautification',
        'Refinery of Minerals',
        'Others(Please Specify)',
      ],
      selectedValues: selected,
      whenEmpty: 'Select Business Sectors',
    );

    final selectQualifications = DropDownMultiSelect(
      onChanged: (List<String> x) {
        setState(() {
          selected = x;
        });
      },
      options: const [
        'Professional qualification',
        'Tertiary level qualification',
        'Company Secretary Trainee',
        'Barrister or Solicitor in the Republic',
        'Institute of Chartered Accountants',
        'Under the supervision of a qualified\nCompany Secretary',
        'Institute of Chartered Secretaries\nand Administrators',
        'By virtue of an academic qualification',
      ],
      selectedValues: selected,
      whenEmpty: 'Select qualifications',
    );

    final steps = [
      CoolStep(
        title: 'Company Information (A)',
        subtitle:
            'All fields marked with an asterisk(*) indicates a mandatory field',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              _buildTextField(
                labelText: 'Business Name *',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Company Name is required';
                  }
                  return null;
                },
                press: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("General nature of business *"),
                  SizedBox(
                    height: 10,
                  ),
                  selectSectors,
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _buildTextField(
                labelText: 'Principal Activity*',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Person's Name is required";
                  }
                  return null;
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date Commencement*"),
                  SizedBox(
                    height: 5,
                  ),
                  DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45, fontSize: 13),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      labelText: 'Starting Date',
                    ),
                    mode: DateTimeFieldPickerMode.dateAndTime,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) =>
                        (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {
                      print(value);
                    },
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'TIN*',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "TIN is required";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (B)',
        subtitle:
            'Company must have a registered  office and this is the address to which the Registrar of  Companies may send Correspondence',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Business Address Information",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Ownership of premises *"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 180,
                        child: _buildSelector(
                          context: context,
                          name: 'Rented',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: SizedBox(
                          width: 180,
                          child: _buildSelector(
                            context: context,
                            name: 'Owner occupied',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: _buildSelector(
                          context: context,
                          name: 'Free use',
                        ),
                      ),
                    ],
                  ),
                )
              ]),
              _buildTextField(
                labelText: "Land Lords Name",
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (C)',
        subtitle: 'Proprietor/Proprietress',
        content: Container(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  SizedBox(
                    height: 10,
                  ),
                  dropdown
                ],
              ),
              _buildTextField(
                labelText: 'First Name*',
              ),
              _buildTextField(
                labelText: 'Middle Name',
              ),
              _buildTextField(
                labelText: 'Last Name*',
              ),
              _buildTextField(
                labelText: 'Any Former Name',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender*"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'Male',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'Female',
                      ),
                    ],
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Date  of Birth*',
              ),
              _buildTextField(
                labelText: 'Place of Birth*',
              ),
              _buildTextField(
                labelText: 'Nationality*',
              ),
              _buildTextField(
                labelText: 'Occupation*',
              ),
              _buildTextField(
                labelText: 'Mobile No 1*',
              ),
              _buildTextField(
                labelText: 'Mobile No 2',
              ),
              _buildTextField(
                labelText: 'Fax',
              ),
              _buildTextField(
                labelText: 'Email Address*',
              ),
              _buildTextField(
                labelText: 'Ghana Card(National Identity Card)',
              ),
              Text(
                "Residential Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Country*',
              ),
              Text(
                "Occupational Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Country*',
              ),
              _buildTextField(
                labelText: 'Particulars of other Directorships*',
              ),
              _buildTextField(
                labelText: "Director's Signature",
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (D)',
        subtitle: 'Residential Addres of Proprietor or Proprietress',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Ownership of premises *"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 180,
                        child: _buildSelector(
                          context: context,
                          name: 'Rented',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: SizedBox(
                          width: 180,
                          child: _buildSelector(
                            context: context,
                            name: 'Owner occupied',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: _buildSelector(
                          context: context,
                          name: 'Free use',
                        ),
                      ),
                    ],
                  ),
                )
              ]),
              _buildTextField(
                labelText: "Land Lords Name",
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (E)',
        subtitle:
            'Company must have a registered  office and this is the address to which the Registrar of  Companies may send Correspondence',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Other Places  of Business",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Ownership of premises *"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 180,
                        child: _buildSelector(
                          context: context,
                          name: 'Rented',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: SizedBox(
                          width: 180,
                          child: _buildSelector(
                            context: context,
                            name: 'Owner occupied',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: _buildSelector(
                          context: context,
                          name: 'Free use',
                        ),
                      ),
                    ],
                  ),
                )
              ]),
              _buildTextField(
                labelText: "Land Lords Name",
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (F)',
        subtitle:
            'Applicants are to provide at least, one mobile phone number and an email',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact Of The Company",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Phone No 1*',
              ),
              _buildTextField(
                labelText: 'Phone No 2',
              ),
              _buildTextField(
                labelText: 'Mobile No 1*',
              ),
              _buildTextField(
                labelText: 'Mobile No 2',
              ),
              _buildTextField(
                labelText: 'Fax',
              ),
              _buildTextField(
                labelText: 'Email Address*',
              ),
              _buildTextField(
                labelText: 'Website',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (G)',
        subtitle: 'Section 35 (14) and (15) of Act 992',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Beneficial Owner(BO)",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "A beneficial owner (or owners) is the individual or natural person who owns, controls, has interest in, or exercises influence over the legal person (or arrangement) or receives substantial benefit from the applicant’s activity. A beneficial owner is an individual and cannot be a company",
                style: TextStyle(fontFamily: 'Poppins-Regular'),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: "SANCTIONS:",
                      style: TextStyle(
                          fontFamily: 'Poppins-Bold', color: Colors.black),
                      children: <TextSpan>[
                    TextSpan(
                      text:
                          ' Failure to disclose is an offence and will attract sanctions and penalties.',
                      style: TextStyle(fontFamily: 'Poppins-Regular'),
                    ),
                  ])),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Fill the BO Form attached /Download from website www.rgd.gov.gh",
                  style: TextStyle(fontFamily: 'Poppins-Bold'),
                ),
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (H)',
        subtitle:
            'This is to determine the size of the Company i.e. small scale business, medium scale business or large scale business',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "SME  Details",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Revenue Envisaged*',
              ),
              _buildTextField(
                labelText: 'No. of Employees Envisaged*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (W)',
        subtitle:
            'This is to determine the size of the Company i.e. small scale business, medium scale business or large scale business',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Business Operating Permit (BOP) Request",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: dropdownBOP,
              ),
              _buildTextField(
                labelText: 'Provide BOP Reference No.',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {
        showDialog(
            context: context,
            builder: (ctx) {
              return CupertinoAlertDialog(
                title: Text(
                  "Do you want to make payment?",
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      "cancel",
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      "Yes",
                    ),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      Payment.getPaymentResponse(context).then((value) {
                        setState(() {
                          isLoading = false;
                        });
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
      steps: steps,
      config: CoolStepperConfig(
        backText: 'PREV',
      ),
    );

    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: _height / 3.5,
              color: GlobalVars.kPrimary,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          IconlyLight.arrow_left_2,
                          color: Colors.white,
                          size: 18,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 100),
                      child: Text(
                        "Entity Creation",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Light',
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )),
        Positioned(
          top: 110,
          left: 0,
          right: 0,
          child: Container(
            height: _height,
            padding: EdgeInsets.only(
                top: _height < 820 ? 15 : 30, left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/pngs/orclogo.png",
                      height: 80,
                    ),
                    Container(
                      height: 45,
                      width: 1.5,
                      color: GlobalVars.kPrimary,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Image.asset(
                      "assets/pngs/COA.png",
                      height: 40,
                    ),
                  ],
                ),
                Text('${widget.pageTitle}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: _height < 820 ? 12 : 15,
                    )),
                SizedBox(
                  height: 10,
                ),
                isLoading
                    ? Padding(
                        padding: EdgeInsets.only(top: _height / 3.5),
                        child: Column(
                          children: [
                            SpinKitPulse(
                              size: 28,
                              color: GlobalVars.kPrimary,
                            ),
                            Text('Redirecting to ghana.gov'),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: _height / 1.5,
                        child: stepper,
                      )
              ],
            )),
          ),
        ),
      ]),
    );
  }

  Widget _buildTextField({
    String? labelText,
    FormFieldValidator<String>? validator,
    VoidCallback? press,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: validator,
        onTap: press,
        controller: controller,
      ),
    );
  }

  Widget _buildbigTextField({
    String? labelText,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        minLines: 2,
        maxLines: 8,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: GlobalVars.kSecondary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          contentPadding: EdgeInsets.all(15),
        ),
        validator: validator,
        controller: controller,
      ),
    );
  }

  Widget _buildSelector({
    BuildContext? context,
    required String name,
  }) {
    final isActive = name == selectedRole;

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context!).primaryColor : null,
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedRole,
          onChanged: (String? v) {
            setState(() {
              selectedRole = v;
            });
          },
          title: Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectorCompany({
    BuildContext? context,
    required String name,
  }) {
    final isActive = name == selectedComp;

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context!).primaryColor : null,
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedComp,
          onChanged: (String? v) {
            setState(() {
              selectedComp = v;
            });
          },
          title: Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
